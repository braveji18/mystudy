docker build  -t goodmit.com/nvidia/tensorflow:18.07-py3   -f Dockerfile.tensorflow.py3   .
docker build  -t goodmit.com/nvidia/tensorflow:18.07-py2   -f Dockerfile.tensorflow.py2   .
docker build  -t goodmit.com/nvidia/mxnet:18.07-py3        -f 01.mxnet.18.07-py3.Dockerfile .
docker build  -t goodmit.com/nvidia/mxnet:18.07-py2        -f 01.mxnet.18.07-py2.Dockerfile .
docker build  -t goodmit.com/nvidia/cntk:18.07-py3         -f 01.cntk.18.07-py3.Dockerfile .
docker build  -t goodmit.com/nvidia/caffe2:18.07-py3       -f 01.caffe2.18.07-py3.Dockerfile .  
docker build  -t goodmit.com/nvidia/caffe2:18.07-py2       -f 01.caffe2.18.07-py2.Dockerfile .
docker build  -t goodmit.com/nvidia/pytorch:18.07-py3      -f 01.pytorch.18.07-py3.Dockerfile .           


nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/tensorflow:18.07-py2
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/mxnet:18.07-py3
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/mxnet:18.07-py2
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/cntk:18.07-py3
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/caffe2:18.07-py3
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/caffe2:18.07-py2
nvidia-docker run -it -p 8888:8888 -p 6006:6006 goodmit.com/nvidia/pytorch:18.07-py3

################################################
# tensorflow 테스트코드
################################################
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
sess.run(hello)

a = tf.constant(10)
b = tf.constant(32)
sess.run(a+b)

################################################
# mxnet 테스트코드
################################################
import mxnet as mx
a = mx.nd.ones((2,3), mx.gpu())
print(  (a*2).asnumpy() )

################################################
# caffe2 테스트코드
################################################
from caffe2.python import workspace, model_helper
import numpy as np
# Create random tensor of three dimensions
x = np.random.rand(4, 3, 2)
print(x)
print(x.shape)

workspace.FeedBlob("my_x", x)

x2 = workspace.FetchBlob("my_x")
print(x2)


################################################
## pytorch 테스트 코드 
################################################
import torch

dtype = torch.float
device = torch.device("cpu")
# device = torch.device("cuda:0") # Uncomment this to run on GPU

# N is batch size; D_in is input dimension;
# H is hidden dimension; D_out is output dimension.
N, D_in, H, D_out = 64, 1000, 100, 10

# Create random input and output data
x = torch.randn(N, D_in, device=device, dtype=dtype)
y = torch.randn(N, D_out, device=device, dtype=dtype)

# Randomly initialize weights
w1 = torch.randn(D_in, H, device=device, dtype=dtype)
w2 = torch.randn(H, D_out, device=device, dtype=dtype)

learning_rate = 1e-6
for t in range(500):
    # Forward pass: compute predicted y
    h = x.mm(w1)
    h_relu = h.clamp(min=0)
    y_pred = h_relu.mm(w2)

    # Compute and print loss
    loss = (y_pred - y).pow(2).sum().item()
    print(t, loss)

    # Backprop to compute gradients of w1 and w2 with respect to loss
    grad_y_pred = 2.0 * (y_pred - y)
    grad_w2 = h_relu.t().mm(grad_y_pred)
    grad_h_relu = grad_y_pred.mm(w2.t())
    grad_h = grad_h_relu.clone()
    grad_h[h < 0] = 0
    grad_w1 = x.t().mm(grad_h)

    # Update weights using gradient descent
    w1 -= learning_rate * grad_w1
    w2 -= learning_rate * grad_w2

################################################
# cntk 테스트코드
################################################
from cntk.device import try_set_default_device, gpu
try_set_default_device(gpu(0))

import numpy as np
import cntk as C
c = C.constant(3, shape=(2,3))
c.asarray()
np.ones_like(c.asarray())

###################
from __future__ import print_function
import numpy as np
import cntk as C
from cntk.learners import sgd
from cntk.logging import ProgressPrinter
from cntk.layers import Dense, Sequential

def generate_random_data(sample_size, feature_dim, num_classes):
     # Create synthetic data using NumPy.
     Y = np.random.randint(size=(sample_size, 1), low=0, high=num_classes)

     # Make sure that the data is separable
     X = (np.random.randn(sample_size, feature_dim) + 3) * (Y + 1)
     X = X.astype(np.float32)
     # converting class 0 into the vector "1 0 0",
     # class 1 into vector "0 1 0", ...
     class_ind = [Y == class_number for class_number in range(num_classes)]
     Y = np.asarray(np.hstack(class_ind), dtype=np.float32)
     return X, Y

def ffnet():
    inputs = 2
    outputs = 2
    layers = 2
    hidden_dimension = 50

    # input variables denoting the features and label data
    features = C.input_variable((inputs), np.float32)
    label = C.input_variable((outputs), np.float32)

    # Instantiate the feedforward classification model
    my_model = Sequential ([
                    Dense(hidden_dimension, activation=C.sigmoid),
                    Dense(outputs)])
    z = my_model(features)

    ce = C.cross_entropy_with_softmax(z, label)
    pe = C.classification_error(z, label)

    # Instantiate the trainer object to drive the model training
    lr_per_minibatch = C.learning_parameter_schedule(0.125)
    progress_printer = ProgressPrinter(0)
    trainer = C.Trainer(z, (ce, pe), [sgd(z.parameters, lr=lr_per_minibatch)], [progress_printer])

    # Get minibatches of training data and perform model training
    minibatch_size = 25
    num_minibatches_to_train = 1024

    aggregate_loss = 0.0
    for i in range(num_minibatches_to_train):
        train_features, labels = generate_random_data(minibatch_size, inputs, outputs)
        # Specify the mapping of input variables in the model to actual minibatch data to be trained with
        trainer.train_minibatch({features : train_features, label : labels})
        sample_count = trainer.previous_minibatch_sample_count
        aggregate_loss += trainer.previous_minibatch_loss_average * sample_count

    last_avg_error = aggregate_loss / trainer.total_number_of_samples_seen

    test_features, test_labels = generate_random_data(minibatch_size, inputs, outputs)
    avg_error = trainer.test_minibatch({features : test_features, label : test_labels})
    print(' error rate on an unseen minibatch: {}'.format(avg_error))
    return last_avg_error, avg_error

np.random.seed(98052)
ffnet()
