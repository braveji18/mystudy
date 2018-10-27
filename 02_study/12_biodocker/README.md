# Bio Docker 



### �Ʒ� ���ϵ��� �ϳ��� ���丮�ȿ� ��� �ٿ�ε�.
 
- 01.jupyter.base.Dockerfile
- 01.make.sh
- 02.jupyter.bio.Dockerfile
- 02.make.sh
- 03.jupyter.ml.Dockerfile
- 03.make.sh
- docker_run.sh
- jupyter_notebook_config.py
- run_jupyter.sh

### Bio Docker ����� ���� ����
1. 01.jupyter.base.Dockerfile 
   - python 2.7,  python 3.6,  R 3.4.3�� ��ġ�ϰ� jupyter ��Ʈ������  ������ ȯ���� ������ �� �ִ� ����� ����
   - �� ��Ŀ �̹����� ������� �پ��� �뵵�� �̹����� ����� ���ؼ� �⺻���� ��Ű���� ��ġ��.

2. 02.jupyter.bio.Dockerfile
   - bio ���� ��Ű���� �ַ� ��ġ
   
3. 03.jupyter.ml.Dockerfile
   - jupyter.bio������� �پ��� �м� ���̺귯���� ��ġ�ϱ� ���� ��Ŀ����
   - �ʿ��� ���� �߰� �ʿ�.
   - jupyter.base������� �Ϲ����� ������ �м��� ��Ŀ �̹����� ���� ��.
   

### ����  ����

1. Docker  jupyter.base Image �����ϱ� 
```
./01.make.sh
```

2. Docker  jupyter.bio Image �����ϱ� 
```
./02.make.sh
```

3. Docker  jupyter.ml Image �����ϱ� 
```
./03.make.sh
```

4. �ѹ��� ��� ���� �ϱ�
```
# �Ʒ� ��ɾ� ġ�� ���
nohup   ./01.make.sh &&  ./02.make.sh &&  ./03.make.sh  &

# ������ ��ħ�� Ȯ�� �ϱ� 
tail -f nohup.out
```


###  Docker Container�� ����
```
# docker_run.sh  ����Ǵ°�����     jupyter�������Һ�й�ȣ    ��Ʈ��ȣ    ��Ŀ��
./docker_run.sh  ID0001    biospin1!   8081   {base|bio|ml}
```

### Docker image�� �ٸ� ������ ���� ���
```  
docker save macrogen/jupyter.base:01 | \
gzip -c >   macrogen_jupyter.base:01.tar.gz

docker save macrogen/jupyter.bio:01 | \
gzip -c >   macrogen_jupyter.bio:01.tar.gz

docker save macrogen/jupyter.ml:01 | \
gzip -c >   macrogen_jupyter.ml:01.tar.gz

# �ٸ� ������ ����
scp  *.tar.gz    ip:/download_dir/

# �ٸ� ������ SSH ����
ssh ip
docker image load --input macrogen_jupyter.base:01.tar.gz
docker image load --input macrogen_jupyter.bio:01.tar.gz
docker image load --input macrogen_jupyter.ml:01.tar.gz

``` 



