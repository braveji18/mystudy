# Kibana 튜터리얼



## 1. Kibana – Overview 



##  2. Kibana – Environment Setup

- kibana ,elasticsearch, logstash를 설치한 노드의 IP는    10.200.101.195   라고 가정함.



### 준비 작업

```
# 방화벽 off 
systemctl stop firewalld
systemctl disable firewalld

# elastic용 계정 추가
useradd -d /home/elastic  elastic

# 자바 설치 
yum install -y java-1.8.0-openjdk
```



### Elasticsearch Installation

```
su elastic

# 설치 
cd /opt/
mkdir elastic/
cd elastic/

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.7.1-linux-x86_64.tar.gz

tar xvf elasticsearch-7.7.1-linux-x86_64.tar.gz
ln -s  elasticsearch-7.7.1  elasticsearch


# 실행 
cd /opt/elastic/elasticsearch
nohup bin/elasticsearch  & 

# 접속 확인 
curl  http://localhost:9200
```




### Logstash Installation



```
# 설치
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.7.1.rpm
yum install -y logstash-7.7.1.rpm

# 설치 확인 
rpm -qa | grep logstash
```



 ### Kibana Installation



```
# 설치
su elastic 
cd /opt/elastic/
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.7.1-linux-x86_64.tar.gz
tar xvf kibana-7.7.1-linux-x86_64.tar.gz
ln -s kibana-7.7.1-linux-x86_64 kibana
cd kibana

vi config/kibana.yml
​```
elasticsearch.hosts: ["http://localhost:9200"]
​```
cd /opt/elastic/kibana
nohup bin/kibana &
```



- 접속 확인 :  http://10.200.101.195:5601



## 3. Kibana— Introduction to ELK Stack



### Load CSV data from Logstash to Elasticsearch

- https://www.kaggle.com/fernandol/countries-of-the-world 에서  countriesdata.csv 파일 다운로드

- 사무실내부일때 :  wget http://10.200.101.253/hynix/countriesdata.csv  -P /opt/elastic/

```
mkdir -p /opt/elastic/logstash/
vi /opt/elastic/logstash/logstash_countries.conf

​```
input{
  file{
    path=>"/opt/elastic/countriesdata.csv"
    start_position=>"beginning"
    sincedb_path=>"NUL"
  }
}
filter{
  csv{
    separator=>","
    columns=>["Country", "Region","Population", "Area" ]
  }
  mutate{ convert=>["Population", "integer"]}
  mutate{ convert=>["Area",       "integer"]}
}
output{
  elasticsearch{
    hosts=>["localhost:9200"]
    index=>"countriesdata-%{+dd.MM.YYYY}"
  }
  stdout {codec=>json_lines}
}
​```

/usr/share/logstash/bin/logstash -f /opt/elastic/logstash/logstash_countries.conf 

# 데이터 로딩 확인
curl  http://localhost:9200/_cat/indices


```



 ### Use Data from Elasticsearch in Kibana

- http://10.200.101.195:5601 에 접속

![03_01](03_01.jpg)



## 4. Kibana — Loading Sample Data

### Using Logstash upload for data having fields in Elasticsearch

- Kaggle.com 사이트에서  [home medical visits](https://www.kaggle.com/HackandHealth/home-medical-visits-healthcare)   data를 다운로드 ( 예제와 실제 데이터의 헤더이름이 다름)

- 사무실내부일때 :  wget http://10.200.101.253/hynix/Home_visits.csv  -P /root/

```
su elastic
mkdir -p /opt/elastic/logstash/
vi /opt/elastic/logstash/logstash_homevisists.conf

​```
input {
  file {
    path=>"/root/Home_visits.csv"
    start_position => "beginning"
  }
}
filter {
  csv {
      separator => ","
      columns =>["Visit_Status", "Time_Delay", "City", "City_id", "Patient_Age", "Zipcode", "Latitude", "Longitude","Pathology", "Visiting_Date", "Id_type", "Id_personal", "Number_Home_Visits","Is_Patient_Minor","Geo_point"]
  }
  date {
    match => ["Visiting_Date","YYYY-MM-dd HH:mm"]
    target => "Visiting_Date"
  }
  mutate {convert => ["Number_Home_Visits", "integer"]}
  mutate {convert => ["City_id", "integer"]}
  mutate {convert => ["Id_personal", "integer"]}
  mutate {convert => ["Id_type", "integer"]}
  mutate {convert => ["Zipcode", "integer"]}
  mutate {convert => ["Patient_Age", "integer"]}
  mutate {
    convert => { "Longitude" => "float" }
    convert => { "Latitude" => "float" }
  }
  mutate {
    rename => {
      "Longitude" => "[location][lon]"
      "Latitude" => "[location][lat]"
    }
  }
}
output {
  elasticsearch {
  hosts => ["localhost:9200"]
  index => "medicalvisits-%{+dd.MM.YYYY}"
  }
  stdout {codec => json_lines }
}
​```

sudo /usr/share/logstash/bin/logstash -f  /opt/elastic/logstash/logstash_homevisists.conf

# 데이터 로딩 확인
curl  http://localhost:9200/_cat/indices
​```
yellow open medicalvisits-09.06.2020     L7xuDVTGStmGh3QAaOHHsQ 1 1 40120 0  24.5mb  24.5mb
​```

```



### Using Dev Tools to Upload Bulk Data

- Kibana의 dev tools를 이용해서 데이터를 로드하기
- wget  https://jsonplaceholder.typicode.com/todos   -O  todos.json  하여   파일을 다운로드하여 kibana에서 업로드 가능한 포맷으로 변환

```
su elastic
cd /opt/elastic/
vi /opt/elastic/convert.py
​```
import json

index_name = "todo"
i=0

with open('todos.json') as json_file:
    json_data = json.load(json_file)
    with open('todonewfile.json', 'w') as new_json:
        for key in json_data :
            new_json.write('{"index": {"_index": "' + index_name +'", "_id": "' + str(i) + '"}}')
            new_json.write('\n')
            new_json.write( json.dumps(key) )
            new_json.write('\n')
            i = i+1

​```
# 변환 실행
python convert.py 

# 확인 
cat todonewfile.json

```



- kibana의 Dev Tools을 이용해서 로드 

  ![](03_02.jpg)



- kibana dev tools 에서 console 입력란에 아래 내용 넣고 실행하면 데이터가 업로드

```
POST _bulk
{"index": {"_index": "todo", "_id": "0"}}
{"completed": false, "userId": 1, "id": 1, "title": "delectus aut autem"}
{"index": {"_index": "todo", "_id": "1"}}
{"completed": false, "userId": 1, "id": 2, "title": "quis ut nam facilis et officia qui"}
{"index": {"_index": "todo", "_id": "2"}}
{"completed": false, "userId": 1, "id": 3, "title": "fugiat veniam minus"}
{"index": {"_index": "todo", "_id": "3"}}
{"completed": true, "userId": 1, "id": 4, "title": "et porro tempora"}
{"index": {"_index": "todo", "_id": "4"}}
{"completed": false, "userId": 1, "id": 5, "title": "laboriosam mollitia et enim quasi adipisci quia provident illum"}
{"index": {"_index": "todo", "_id": "5"}}
{"completed": false, "userId": 1, "id": 6, "title": "qui ullam ratione quibusdam voluptatem quia omnis"}
{"index": {"_index": "todo", "_id": "6"}}
{"completed": false, "userId": 1, "id": 7, "title": "illo expedita consequatur quia in"}
{"index": {"_index": "todo", "_id": "7"}}
{"completed": true, "userId": 1, "id": 8, "title": "quo adipisci enim quam ut ab"}
{"index": {"_index": "todo", "_id": "8"}}
{"completed": false, "userId": 1, "id": 9, "title": "molestiae perspiciatis ipsa"}
{"index": {"_index": "todo", "_id": "9"}}
{"completed": true, "userId": 1, "id": 10, "title": "illo est ratione doloremque quia maiores aut"}
{"index": {"_index": "todo", "_id": "10"}}
{"completed": true, "userId": 1, "id": 11, "title": "vero rerum temporibus dolor"}
{"index": {"_index": "todo", "_id": "11"}}
{"completed": true, "userId": 1, "id": 12, "title": "ipsa repellendus fugit nisi"}
{"index": {"_index": "todo", "_id": "12"}}
{"completed": false, "userId": 1, "id": 13, "title": "et doloremque nulla"}
{"index": {"_index": "todo", "_id": "13"}}
{"completed": true, "userId": 1, "id": 14, "title": "repellendus sunt dolores architecto voluptatum"}
{"index": {"_index": "todo", "_id": "14"}}
{"completed": true, "userId": 1, "id": 15, "title": "ab voluptatum amet voluptas"}
{"index": {"_index": "todo", "_id": "15"}}
{"completed": true, "userId": 1, "id": 16, "title": "accusamus eos facilis sint et aut voluptatem"}
{"index": {"_index": "todo", "_id": "16"}}
{"completed": true, "userId": 1, "id": 17, "title": "quo laboriosam deleniti aut qui"}
{"index": {"_index": "todo", "_id": "17"}}
{"completed": false, "userId": 1, "id": 18, "title": "dolorum est consequatur ea mollitia in culpa"}
{"index": {"_index": "todo", "_id": "18"}}
{"completed": true, "userId": 1, "id": 19, "title": "molestiae ipsa aut voluptatibus pariatur dolor nihil"}
{"index": {"_index": "todo", "_id": "19"}}
{"completed": true, "userId": 1, "id": 20, "title": "ullam nobis libero sapiente ad optio sint"}
{"index": {"_index": "todo", "_id": "20"}}
{"completed": false, "userId": 2, "id": 21, "title": "suscipit repellat esse quibusdam voluptatem incidunt"}
{"index": {"_index": "todo", "_id": "21"}}
{"completed": true, "userId": 2, "id": 22, "title": "distinctio vitae autem nihil ut molestias quo"}
{"index": {"_index": "todo", "_id": "22"}}
{"completed": false, "userId": 2, "id": 23, "title": "et itaque necessitatibus maxime molestiae qui quas velit"}
{"index": {"_index": "todo", "_id": "23"}}
{"completed": false, "userId": 2, "id": 24, "title": "adipisci non ad dicta qui amet quaerat doloribus ea"}
{"index": {"_index": "todo", "_id": "24"}}
{"completed": true, "userId": 2, "id": 25, "title": "voluptas quo tenetur perspiciatis explicabo natus"}
{"index": {"_index": "todo", "_id": "25"}}
{"completed": true, "userId": 2, "id": 26, "title": "aliquam aut quasi"}
{"index": {"_index": "todo", "_id": "26"}}
{"completed": true, "userId": 2, "id": 27, "title": "veritatis pariatur delectus"}
{"index": {"_index": "todo", "_id": "27"}}
{"completed": false, "userId": 2, "id": 28, "title": "nesciunt totam sit blanditiis sit"}
{"index": {"_index": "todo", "_id": "28"}}
{"completed": false, "userId": 2, "id": 29, "title": "laborum aut in quam"}
{"index": {"_index": "todo", "_id": "29"}}
{"completed": true, "userId": 2, "id": 30, "title": "nemo perspiciatis repellat ut dolor libero commodi blanditiis omnis"}
{"index": {"_index": "todo", "_id": "30"}}
{"completed": false, "userId": 2, "id": 31, "title": "repudiandae totam in est sint facere fuga"}
{"index": {"_index": "todo", "_id": "31"}}
{"completed": false, "userId": 2, "id": 32, "title": "earum doloribus ea doloremque quis"}
{"index": {"_index": "todo", "_id": "32"}}
{"completed": false, "userId": 2, "id": 33, "title": "sint sit aut vero"}
{"index": {"_index": "todo", "_id": "33"}}
{"completed": false, "userId": 2, "id": 34, "title": "porro aut necessitatibus eaque distinctio"}
{"index": {"_index": "todo", "_id": "34"}}
{"completed": true, "userId": 2, "id": 35, "title": "repellendus veritatis molestias dicta incidunt"}
{"index": {"_index": "todo", "_id": "35"}}
{"completed": true, "userId": 2, "id": 36, "title": "excepturi deleniti adipisci voluptatem et neque optio illum ad"}
{"index": {"_index": "todo", "_id": "36"}}
{"completed": false, "userId": 2, "id": 37, "title": "sunt cum tempora"}
{"index": {"_index": "todo", "_id": "37"}}
{"completed": false, "userId": 2, "id": 38, "title": "totam quia non"}
{"index": {"_index": "todo", "_id": "38"}}
{"completed": false, "userId": 2, "id": 39, "title": "doloremque quibusdam asperiores libero corrupti illum qui omnis"}
{"index": {"_index": "todo", "_id": "39"}}
{"completed": true, "userId": 2, "id": 40, "title": "totam atque quo nesciunt"}
{"index": {"_index": "todo", "_id": "40"}}
{"completed": false, "userId": 3, "id": 41, "title": "aliquid amet impedit consequatur aspernatur placeat eaque fugiat suscipit"}
{"index": {"_index": "todo", "_id": "41"}}
{"completed": false, "userId": 3, "id": 42, "title": "rerum perferendis error quia ut eveniet"}
{"index": {"_index": "todo", "_id": "42"}}
{"completed": true, "userId": 3, "id": 43, "title": "tempore ut sint quis recusandae"}
{"index": {"_index": "todo", "_id": "43"}}
{"completed": true, "userId": 3, "id": 44, "title": "cum debitis quis accusamus doloremque ipsa natus sapiente omnis"}
{"index": {"_index": "todo", "_id": "44"}}
{"completed": false, "userId": 3, "id": 45, "title": "velit soluta adipisci molestias reiciendis harum"}
{"index": {"_index": "todo", "_id": "45"}}
{"completed": false, "userId": 3, "id": 46, "title": "vel voluptatem repellat nihil placeat corporis"}
{"index": {"_index": "todo", "_id": "46"}}
{"completed": false, "userId": 3, "id": 47, "title": "nam qui rerum fugiat accusamus"}
{"index": {"_index": "todo", "_id": "47"}}
{"completed": false, "userId": 3, "id": 48, "title": "sit reprehenderit omnis quia"}
{"index": {"_index": "todo", "_id": "48"}}
{"completed": false, "userId": 3, "id": 49, "title": "ut necessitatibus aut maiores debitis officia blanditiis velit et"}
{"index": {"_index": "todo", "_id": "49"}}
{"completed": true, "userId": 3, "id": 50, "title": "cupiditate necessitatibus ullam aut quis dolor voluptate"}
{"index": {"_index": "todo", "_id": "50"}}
{"completed": false, "userId": 3, "id": 51, "title": "distinctio exercitationem ab doloribus"}
{"index": {"_index": "todo", "_id": "51"}}
{"completed": false, "userId": 3, "id": 52, "title": "nesciunt dolorum quis recusandae ad pariatur ratione"}
{"index": {"_index": "todo", "_id": "52"}}
{"completed": false, "userId": 3, "id": 53, "title": "qui labore est occaecati recusandae aliquid quam"}
{"index": {"_index": "todo", "_id": "53"}}
{"completed": true, "userId": 3, "id": 54, "title": "quis et est ut voluptate quam dolor"}
{"index": {"_index": "todo", "_id": "54"}}
{"completed": true, "userId": 3, "id": 55, "title": "voluptatum omnis minima qui occaecati provident nulla voluptatem ratione"}
{"index": {"_index": "todo", "_id": "55"}}
{"completed": true, "userId": 3, "id": 56, "title": "deleniti ea temporibus enim"}
{"index": {"_index": "todo", "_id": "56"}}
{"completed": false, "userId": 3, "id": 57, "title": "pariatur et magnam ea doloribus similique voluptatem rerum quia"}
{"index": {"_index": "todo", "_id": "57"}}
{"completed": false, "userId": 3, "id": 58, "title": "est dicta totam qui explicabo doloribus qui dignissimos"}
{"index": {"_index": "todo", "_id": "58"}}
{"completed": false, "userId": 3, "id": 59, "title": "perspiciatis velit id laborum placeat iusto et aliquam odio"}
{"index": {"_index": "todo", "_id": "59"}}
{"completed": true, "userId": 3, "id": 60, "title": "et sequi qui architecto ut adipisci"}
{"index": {"_index": "todo", "_id": "60"}}
{"completed": true, "userId": 4, "id": 61, "title": "odit optio omnis qui sunt"}
{"index": {"_index": "todo", "_id": "61"}}
{"completed": false, "userId": 4, "id": 62, "title": "et placeat et tempore aspernatur sint numquam"}
{"index": {"_index": "todo", "_id": "62"}}
{"completed": true, "userId": 4, "id": 63, "title": "doloremque aut dolores quidem fuga qui nulla"}
{"index": {"_index": "todo", "_id": "63"}}
{"completed": false, "userId": 4, "id": 64, "title": "voluptas consequatur qui ut quia magnam nemo esse"}
{"index": {"_index": "todo", "_id": "64"}}
{"completed": false, "userId": 4, "id": 65, "title": "fugiat pariatur ratione ut asperiores necessitatibus magni"}
{"index": {"_index": "todo", "_id": "65"}}
{"completed": false, "userId": 4, "id": 66, "title": "rerum eum molestias autem voluptatum sit optio"}
{"index": {"_index": "todo", "_id": "66"}}
{"completed": false, "userId": 4, "id": 67, "title": "quia voluptatibus voluptatem quos similique maiores repellat"}
{"index": {"_index": "todo", "_id": "67"}}
{"completed": false, "userId": 4, "id": 68, "title": "aut id perspiciatis voluptatem iusto"}
{"index": {"_index": "todo", "_id": "68"}}
{"completed": false, "userId": 4, "id": 69, "title": "doloribus sint dolorum ab adipisci itaque dignissimos aliquam suscipit"}
{"index": {"_index": "todo", "_id": "69"}}
{"completed": false, "userId": 4, "id": 70, "title": "ut sequi accusantium et mollitia delectus sunt"}
{"index": {"_index": "todo", "_id": "70"}}
{"completed": false, "userId": 4, "id": 71, "title": "aut velit saepe ullam"}
{"index": {"_index": "todo", "_id": "71"}}
{"completed": false, "userId": 4, "id": 72, "title": "praesentium facilis facere quis harum voluptatibus voluptatem eum"}
{"index": {"_index": "todo", "_id": "72"}}
{"completed": true, "userId": 4, "id": 73, "title": "sint amet quia totam corporis qui exercitationem commodi"}
{"index": {"_index": "todo", "_id": "73"}}
{"completed": false, "userId": 4, "id": 74, "title": "expedita tempore nobis eveniet laborum maiores"}
{"index": {"_index": "todo", "_id": "74"}}
{"completed": false, "userId": 4, "id": 75, "title": "occaecati adipisci est possimus totam"}
{"index": {"_index": "todo", "_id": "75"}}
{"completed": true, "userId": 4, "id": 76, "title": "sequi dolorem sed"}
{"index": {"_index": "todo", "_id": "76"}}
{"completed": false, "userId": 4, "id": 77, "title": "maiores aut nesciunt delectus exercitationem vel assumenda eligendi at"}
{"index": {"_index": "todo", "_id": "77"}}
{"completed": false, "userId": 4, "id": 78, "title": "reiciendis est magnam amet nemo iste recusandae impedit quaerat"}
{"index": {"_index": "todo", "_id": "78"}}
{"completed": true, "userId": 4, "id": 79, "title": "eum ipsa maxime ut"}
{"index": {"_index": "todo", "_id": "79"}}
{"completed": true, "userId": 4, "id": 80, "title": "tempore molestias dolores rerum sequi voluptates ipsum consequatur"}
{"index": {"_index": "todo", "_id": "80"}}
{"completed": true, "userId": 5, "id": 81, "title": "suscipit qui totam"}
{"index": {"_index": "todo", "_id": "81"}}
{"completed": false, "userId": 5, "id": 82, "title": "voluptates eum voluptas et dicta"}
{"index": {"_index": "todo", "_id": "82"}}
{"completed": true, "userId": 5, "id": 83, "title": "quidem at rerum quis ex aut sit quam"}
{"index": {"_index": "todo", "_id": "83"}}
{"completed": false, "userId": 5, "id": 84, "title": "sunt veritatis ut voluptate"}
{"index": {"_index": "todo", "_id": "84"}}
{"completed": true, "userId": 5, "id": 85, "title": "et quia ad iste a"}
{"index": {"_index": "todo", "_id": "85"}}
{"completed": true, "userId": 5, "id": 86, "title": "incidunt ut saepe autem"}
{"index": {"_index": "todo", "_id": "86"}}
{"completed": true, "userId": 5, "id": 87, "title": "laudantium quae eligendi consequatur quia et vero autem"}
{"index": {"_index": "todo", "_id": "87"}}
{"completed": false, "userId": 5, "id": 88, "title": "vitae aut excepturi laboriosam sint aliquam et et accusantium"}
{"index": {"_index": "todo", "_id": "88"}}
{"completed": true, "userId": 5, "id": 89, "title": "sequi ut omnis et"}
{"index": {"_index": "todo", "_id": "89"}}
{"completed": true, "userId": 5, "id": 90, "title": "molestiae nisi accusantium tenetur dolorem et"}
{"index": {"_index": "todo", "_id": "90"}}
{"completed": true, "userId": 5, "id": 91, "title": "nulla quis consequatur saepe qui id expedita"}
{"index": {"_index": "todo", "_id": "91"}}
{"completed": true, "userId": 5, "id": 92, "title": "in omnis laboriosam"}
{"index": {"_index": "todo", "_id": "92"}}
{"completed": true, "userId": 5, "id": 93, "title": "odio iure consequatur molestiae quibusdam necessitatibus quia sint"}
{"index": {"_index": "todo", "_id": "93"}}
{"completed": false, "userId": 5, "id": 94, "title": "facilis modi saepe mollitia"}
{"index": {"_index": "todo", "_id": "94"}}
{"completed": true, "userId": 5, "id": 95, "title": "vel nihil et molestiae iusto assumenda nemo quo ut"}
{"index": {"_index": "todo", "_id": "95"}}
{"completed": false, "userId": 5, "id": 96, "title": "nobis suscipit ducimus enim asperiores voluptas"}
{"index": {"_index": "todo", "_id": "96"}}
{"completed": false, "userId": 5, "id": 97, "title": "dolorum laboriosam eos qui iure aliquam"}
{"index": {"_index": "todo", "_id": "97"}}
{"completed": true, "userId": 5, "id": 98, "title": "debitis accusantium ut quo facilis nihil quis sapiente necessitatibus"}
{"index": {"_index": "todo", "_id": "98"}}
{"completed": false, "userId": 5, "id": 99, "title": "neque voluptates ratione"}
{"index": {"_index": "todo", "_id": "99"}}
{"completed": false, "userId": 5, "id": 100, "title": "excepturi a et neque qui expedita vel voluptate"}
{"index": {"_index": "todo", "_id": "100"}}
{"completed": false, "userId": 6, "id": 101, "title": "explicabo enim cumque porro aperiam occaecati minima"}
{"index": {"_index": "todo", "_id": "101"}}
{"completed": false, "userId": 6, "id": 102, "title": "sed ab consequatur"}
{"index": {"_index": "todo", "_id": "102"}}
{"completed": false, "userId": 6, "id": 103, "title": "non sunt delectus illo nulla tenetur enim omnis"}
{"index": {"_index": "todo", "_id": "103"}}
{"completed": false, "userId": 6, "id": 104, "title": "excepturi non laudantium quo"}
{"index": {"_index": "todo", "_id": "104"}}
{"completed": true, "userId": 6, "id": 105, "title": "totam quia dolorem et illum repellat voluptas optio"}
{"index": {"_index": "todo", "_id": "105"}}
{"completed": true, "userId": 6, "id": 106, "title": "ad illo quis voluptatem temporibus"}
{"index": {"_index": "todo", "_id": "106"}}
{"completed": false, "userId": 6, "id": 107, "title": "praesentium facilis omnis laudantium fugit ad iusto nihil nesciunt"}
{"index": {"_index": "todo", "_id": "107"}}
{"completed": true, "userId": 6, "id": 108, "title": "a eos eaque nihil et exercitationem incidunt delectus"}
{"index": {"_index": "todo", "_id": "108"}}
{"completed": true, "userId": 6, "id": 109, "title": "autem temporibus harum quisquam in culpa"}
{"index": {"_index": "todo", "_id": "109"}}
{"completed": true, "userId": 6, "id": 110, "title": "aut aut ea corporis"}
{"index": {"_index": "todo", "_id": "110"}}
{"completed": false, "userId": 6, "id": 111, "title": "magni accusantium labore et id quis provident"}
{"index": {"_index": "todo", "_id": "111"}}
{"completed": false, "userId": 6, "id": 112, "title": "consectetur impedit quisquam qui deserunt non rerum consequuntur eius"}
{"index": {"_index": "todo", "_id": "112"}}
{"completed": false, "userId": 6, "id": 113, "title": "quia atque aliquam sunt impedit voluptatum rerum assumenda nisi"}
{"index": {"_index": "todo", "_id": "113"}}
{"completed": false, "userId": 6, "id": 114, "title": "cupiditate quos possimus corporis quisquam exercitationem beatae"}
{"index": {"_index": "todo", "_id": "114"}}
{"completed": false, "userId": 6, "id": 115, "title": "sed et ea eum"}
{"index": {"_index": "todo", "_id": "115"}}
{"completed": true, "userId": 6, "id": 116, "title": "ipsa dolores vel facilis ut"}
{"index": {"_index": "todo", "_id": "116"}}
{"completed": false, "userId": 6, "id": 117, "title": "sequi quae est et qui qui eveniet asperiores"}
{"index": {"_index": "todo", "_id": "117"}}
{"completed": false, "userId": 6, "id": 118, "title": "quia modi consequatur vero fugiat"}
{"index": {"_index": "todo", "_id": "118"}}
{"completed": false, "userId": 6, "id": 119, "title": "corporis ducimus ea perspiciatis iste"}
{"index": {"_index": "todo", "_id": "119"}}
{"completed": false, "userId": 6, "id": 120, "title": "dolorem laboriosam vel voluptas et aliquam quasi"}
{"index": {"_index": "todo", "_id": "120"}}
{"completed": true, "userId": 7, "id": 121, "title": "inventore aut nihil minima laudantium hic qui omnis"}
{"index": {"_index": "todo", "_id": "121"}}
{"completed": true, "userId": 7, "id": 122, "title": "provident aut nobis culpa"}
{"index": {"_index": "todo", "_id": "122"}}
{"completed": false, "userId": 7, "id": 123, "title": "esse et quis iste est earum aut impedit"}
{"index": {"_index": "todo", "_id": "123"}}
{"completed": false, "userId": 7, "id": 124, "title": "qui consectetur id"}
{"index": {"_index": "todo", "_id": "124"}}
{"completed": false, "userId": 7, "id": 125, "title": "aut quasi autem iste tempore illum possimus"}
{"index": {"_index": "todo", "_id": "125"}}
{"completed": true, "userId": 7, "id": 126, "title": "ut asperiores perspiciatis veniam ipsum rerum saepe"}
{"index": {"_index": "todo", "_id": "126"}}
{"completed": true, "userId": 7, "id": 127, "title": "voluptatem libero consectetur rerum ut"}
{"index": {"_index": "todo", "_id": "127"}}
{"completed": false, "userId": 7, "id": 128, "title": "eius omnis est qui voluptatem autem"}
{"index": {"_index": "todo", "_id": "128"}}
{"completed": false, "userId": 7, "id": 129, "title": "rerum culpa quis harum"}
{"index": {"_index": "todo", "_id": "129"}}
{"completed": true, "userId": 7, "id": 130, "title": "nulla aliquid eveniet harum laborum libero alias ut unde"}
{"index": {"_index": "todo", "_id": "130"}}
{"completed": false, "userId": 7, "id": 131, "title": "qui ea incidunt quis"}
{"index": {"_index": "todo", "_id": "131"}}
{"completed": true, "userId": 7, "id": 132, "title": "qui molestiae voluptatibus velit iure harum quisquam"}
{"index": {"_index": "todo", "_id": "132"}}
{"completed": true, "userId": 7, "id": 133, "title": "et labore eos enim rerum consequatur sunt"}
{"index": {"_index": "todo", "_id": "133"}}
{"completed": false, "userId": 7, "id": 134, "title": "molestiae doloribus et laborum quod ea"}
{"index": {"_index": "todo", "_id": "134"}}
{"completed": false, "userId": 7, "id": 135, "title": "facere ipsa nam eum voluptates reiciendis vero qui"}
{"index": {"_index": "todo", "_id": "135"}}
{"completed": false, "userId": 7, "id": 136, "title": "asperiores illo tempora fuga sed ut quasi adipisci"}
{"index": {"_index": "todo", "_id": "136"}}
{"completed": false, "userId": 7, "id": 137, "title": "qui sit non"}
{"index": {"_index": "todo", "_id": "137"}}
{"completed": true, "userId": 7, "id": 138, "title": "placeat minima consequatur rem qui ut"}
{"index": {"_index": "todo", "_id": "138"}}
{"completed": false, "userId": 7, "id": 139, "title": "consequatur doloribus id possimus voluptas a voluptatem"}
{"index": {"_index": "todo", "_id": "139"}}
{"completed": true, "userId": 7, "id": 140, "title": "aut consectetur in blanditiis deserunt quia sed laboriosam"}
{"index": {"_index": "todo", "_id": "140"}}
{"completed": true, "userId": 8, "id": 141, "title": "explicabo consectetur debitis voluptates quas quae culpa rerum non"}
{"index": {"_index": "todo", "_id": "141"}}
{"completed": true, "userId": 8, "id": 142, "title": "maiores accusantium architecto necessitatibus reiciendis ea aut"}
{"index": {"_index": "todo", "_id": "142"}}
{"completed": false, "userId": 8, "id": 143, "title": "eum non recusandae cupiditate animi"}
{"index": {"_index": "todo", "_id": "143"}}
{"completed": false, "userId": 8, "id": 144, "title": "ut eum exercitationem sint"}
{"index": {"_index": "todo", "_id": "144"}}
{"completed": false, "userId": 8, "id": 145, "title": "beatae qui ullam incidunt voluptatem non nisi aliquam"}
{"index": {"_index": "todo", "_id": "145"}}
{"completed": true, "userId": 8, "id": 146, "title": "molestiae suscipit ratione nihil odio libero impedit vero totam"}
{"index": {"_index": "todo", "_id": "146"}}
{"completed": true, "userId": 8, "id": 147, "title": "eum itaque quod reprehenderit et facilis dolor autem ut"}
{"index": {"_index": "todo", "_id": "147"}}
{"completed": false, "userId": 8, "id": 148, "title": "esse quas et quo quasi exercitationem"}
{"index": {"_index": "todo", "_id": "148"}}
{"completed": false, "userId": 8, "id": 149, "title": "animi voluptas quod perferendis est"}
{"index": {"_index": "todo", "_id": "149"}}
{"completed": false, "userId": 8, "id": 150, "title": "eos amet tempore laudantium fugit a"}
{"index": {"_index": "todo", "_id": "150"}}
{"completed": true, "userId": 8, "id": 151, "title": "accusamus adipisci dicta qui quo ea explicabo sed vero"}
{"index": {"_index": "todo", "_id": "151"}}
{"completed": false, "userId": 8, "id": 152, "title": "odit eligendi recusandae doloremque cumque non"}
{"index": {"_index": "todo", "_id": "152"}}
{"completed": false, "userId": 8, "id": 153, "title": "ea aperiam consequatur qui repellat eos"}
{"index": {"_index": "todo", "_id": "153"}}
{"completed": true, "userId": 8, "id": 154, "title": "rerum non ex sapiente"}
{"index": {"_index": "todo", "_id": "154"}}
{"completed": true, "userId": 8, "id": 155, "title": "voluptatem nobis consequatur et assumenda magnam"}
{"index": {"_index": "todo", "_id": "155"}}
{"completed": true, "userId": 8, "id": 156, "title": "nam quia quia nulla repellat assumenda quibusdam sit nobis"}
{"index": {"_index": "todo", "_id": "156"}}
{"completed": true, "userId": 8, "id": 157, "title": "dolorem veniam quisquam deserunt repellendus"}
{"index": {"_index": "todo", "_id": "157"}}
{"completed": true, "userId": 8, "id": 158, "title": "debitis vitae delectus et harum accusamus aut deleniti a"}
{"index": {"_index": "todo", "_id": "158"}}
{"completed": true, "userId": 8, "id": 159, "title": "debitis adipisci quibusdam aliquam sed dolore ea praesentium nobis"}
{"index": {"_index": "todo", "_id": "159"}}
{"completed": false, "userId": 8, "id": 160, "title": "et praesentium aliquam est"}
{"index": {"_index": "todo", "_id": "160"}}
{"completed": true, "userId": 9, "id": 161, "title": "ex hic consequuntur earum omnis alias ut occaecati culpa"}
{"index": {"_index": "todo", "_id": "161"}}
{"completed": true, "userId": 9, "id": 162, "title": "omnis laboriosam molestias animi sunt dolore"}
{"index": {"_index": "todo", "_id": "162"}}
{"completed": false, "userId": 9, "id": 163, "title": "natus corrupti maxime laudantium et voluptatem laboriosam odit"}
{"index": {"_index": "todo", "_id": "163"}}
{"completed": false, "userId": 9, "id": 164, "title": "reprehenderit quos aut aut consequatur est sed"}
{"index": {"_index": "todo", "_id": "164"}}
{"completed": false, "userId": 9, "id": 165, "title": "fugiat perferendis sed aut quidem"}
{"index": {"_index": "todo", "_id": "165"}}
{"completed": false, "userId": 9, "id": 166, "title": "quos quo possimus suscipit minima ut"}
{"index": {"_index": "todo", "_id": "166"}}
{"completed": false, "userId": 9, "id": 167, "title": "et quis minus quo a asperiores molestiae"}
{"index": {"_index": "todo", "_id": "167"}}
{"completed": false, "userId": 9, "id": 168, "title": "recusandae quia qui sunt libero"}
{"index": {"_index": "todo", "_id": "168"}}
{"completed": true, "userId": 9, "id": 169, "title": "ea odio perferendis officiis"}
{"index": {"_index": "todo", "_id": "169"}}
{"completed": false, "userId": 9, "id": 170, "title": "quisquam aliquam quia doloribus aut"}
{"index": {"_index": "todo", "_id": "170"}}
{"completed": true, "userId": 9, "id": 171, "title": "fugiat aut voluptatibus corrupti deleniti velit iste odio"}
{"index": {"_index": "todo", "_id": "171"}}
{"completed": false, "userId": 9, "id": 172, "title": "et provident amet rerum consectetur et voluptatum"}
{"index": {"_index": "todo", "_id": "172"}}
{"completed": false, "userId": 9, "id": 173, "title": "harum ad aperiam quis"}
{"index": {"_index": "todo", "_id": "173"}}
{"completed": false, "userId": 9, "id": 174, "title": "similique aut quo"}
{"index": {"_index": "todo", "_id": "174"}}
{"completed": true, "userId": 9, "id": 175, "title": "laudantium eius officia perferendis provident perspiciatis asperiores"}
{"index": {"_index": "todo", "_id": "175"}}
{"completed": false, "userId": 9, "id": 176, "title": "magni soluta corrupti ut maiores rem quidem"}
{"index": {"_index": "todo", "_id": "176"}}
{"completed": false, "userId": 9, "id": 177, "title": "et placeat temporibus voluptas est tempora quos quibusdam"}
{"index": {"_index": "todo", "_id": "177"}}
{"completed": true, "userId": 9, "id": 178, "title": "nesciunt itaque commodi tempore"}
{"index": {"_index": "todo", "_id": "178"}}
{"completed": true, "userId": 9, "id": 179, "title": "omnis consequuntur cupiditate impedit itaque ipsam quo"}
{"index": {"_index": "todo", "_id": "179"}}
{"completed": true, "userId": 9, "id": 180, "title": "debitis nisi et dolorem repellat et"}
{"index": {"_index": "todo", "_id": "180"}}
{"completed": false, "userId": 10, "id": 181, "title": "ut cupiditate sequi aliquam fuga maiores"}
{"index": {"_index": "todo", "_id": "181"}}
{"completed": true, "userId": 10, "id": 182, "title": "inventore saepe cumque et aut illum enim"}
{"index": {"_index": "todo", "_id": "182"}}
{"completed": true, "userId": 10, "id": 183, "title": "omnis nulla eum aliquam distinctio"}
{"index": {"_index": "todo", "_id": "183"}}
{"completed": false, "userId": 10, "id": 184, "title": "molestias modi perferendis perspiciatis"}
{"index": {"_index": "todo", "_id": "184"}}
{"completed": false, "userId": 10, "id": 185, "title": "voluptates dignissimos sed doloribus animi quaerat aut"}
{"index": {"_index": "todo", "_id": "185"}}
{"completed": false, "userId": 10, "id": 186, "title": "explicabo odio est et"}
{"index": {"_index": "todo", "_id": "186"}}
{"completed": false, "userId": 10, "id": 187, "title": "consequuntur animi possimus"}
{"index": {"_index": "todo", "_id": "187"}}
{"completed": true, "userId": 10, "id": 188, "title": "vel non beatae est"}
{"index": {"_index": "todo", "_id": "188"}}
{"completed": true, "userId": 10, "id": 189, "title": "culpa eius et voluptatem et"}
{"index": {"_index": "todo", "_id": "189"}}
{"completed": true, "userId": 10, "id": 190, "title": "accusamus sint iusto et voluptatem exercitationem"}
{"index": {"_index": "todo", "_id": "190"}}
{"completed": true, "userId": 10, "id": 191, "title": "temporibus atque distinctio omnis eius impedit tempore molestias pariatur"}
{"index": {"_index": "todo", "_id": "191"}}
{"completed": false, "userId": 10, "id": 192, "title": "ut quas possimus exercitationem sint voluptates"}
{"index": {"_index": "todo", "_id": "192"}}
{"completed": true, "userId": 10, "id": 193, "title": "rerum debitis voluptatem qui eveniet tempora distinctio a"}
{"index": {"_index": "todo", "_id": "193"}}
{"completed": false, "userId": 10, "id": 194, "title": "sed ut vero sit molestiae"}
{"index": {"_index": "todo", "_id": "194"}}
{"completed": true, "userId": 10, "id": 195, "title": "rerum ex veniam mollitia voluptatibus pariatur"}
{"index": {"_index": "todo", "_id": "195"}}
{"completed": true, "userId": 10, "id": 196, "title": "consequuntur aut ut fugit similique"}
{"index": {"_index": "todo", "_id": "196"}}
{"completed": true, "userId": 10, "id": 197, "title": "dignissimos quo nobis earum saepe"}
{"index": {"_index": "todo", "_id": "197"}}
{"completed": true, "userId": 10, "id": 198, "title": "quis eius est sint explicabo"}
{"index": {"_index": "todo", "_id": "198"}}
{"completed": true, "userId": 10, "id": 199, "title": "numquam repellendus a magnam"}
{"index": {"_index": "todo", "_id": "199"}}
{"completed": false, "userId": 10, "id": 200, "title": "ipsam aperiam voluptates qui"}
```



- 업로드 성공 

  ![](03_03.jpg)



- Kibana DevTools에서 확인 

  ```
  GET /_cat/indices
  ```

  ![](03_04.jpg)



- Kibana DevTools를 사용해서  todo 인덱스에서 title이  "rerum" 를 포함하는  데이터 조회

```
GET /todo/_search
{
  "query":{
    "match":{
      "title":"rerum"
     }
   }
}
```



## 5. Kibana — Management



### Create Index Pattern Without Time Filter field

- 아래와 같이 kibana management > kibana index Patterns > Create index pattern 순으로 선택

![](03_05.jpg)



- mdicalvisits-09.06.2020 을  index-pattern 명으로 입력하고 Next Step 버튼 선택

![](03_06.jpg)



- Time filter field name 에서 Date형인 Visiting_Date 를 선택하고 Create index pattern 버튼을 선택

  ![](03_07.jpg)



- index 생성 결과

  ![](03_08.jpg)



## 6. Kibana — Discover



- elasticsearch에 저장된 데이터를 조회

### Index without date field

- kibana의 왼쪽 메뉴바에서 Discover 버튼을 선택

![](06_01.jpg)

- elasticsearch 에 저장된 다른 index 를 선택 가능

![](06_02.jpg)



- 데이터가 조회된 전체 개수,  하나의 데이터를 Table형식 또는 JSON 형식으로 표시 가능

![](06_03.jpg)



- 특정컬럼에 포함된 문자열을 조회 가능

![](06_04.jpg)



### Index with Date Field

- Date 필드를 가지고 있는 medicalvisits-10.06.2020  인덱스를 선택하면 아래와 같이 “No results match your search criteria” 메시지가 나오면,  보여지는 데이터가 15분전으로 되어 있음.

![](06_05.jpg)



- Show dates 선택하여 시간범위를 선택 가능

| 절대시간으로 시간범위 선택 | 상대적인 시간으로 시간범위 선택 |
| -------------------------- | ------------------------------- |
| ![](06_06.jpg)             | ![](06_07.jpg)                  |



## 7. Kibana — Aggregations and Metrics

### What is Kibana Aggregation?

- Aggregation은 특정 조회 query와 필터로 부터 얻어진 문서들의 셋과 집합.
- Aggregation은 kibana에서 원하는 시각화를 생성하기 위한 핵심 개념을 형성함.
- Aggregation은 2가지 타임에 존재
  - Bucket Aggregation
  - Metric Aggregation

### Bucket Aggregation

-  bucket은 주로 key와 document로 구성
- Aggregation가 실행될 때 문서는 해당 bucket에 배치되어야 하므로 document 목록이 있는 bucket 목록이 있어야합니다.
- Kibana의 시각화에서  bucket Aggregation 목록은 아래와 같음.

![](06_08.jpg)



- Bucket Aggregation 목록
  - Date Histogram
  - Date Range
  - Filters
  -  Histogram
  -  IPv4 Range
  - Range
  -  Significant Terms
  -   Terms

- Bucket 을 만들때  document들을 그룹핑할때   Bucket Aggregation 목록중 하나로  결정이 필요.

  

- 이전의 업로드한 countries 데이터에는 population, region , area  구성

- area별 자료를 원한다고 가정하자.  이 경우에는 area이 bucket 을 형성.
- 아래 그림과 R1, R2,R3,R4,R5 과 R6이 bucket  이 되고 각각의 bucket 에는 documents 목록을 갖음.

![](06_09.jpg)

- Bucket Aggregation에 종류에 대해서 자세히 알아보자.



### Date Histogram

- Date Histogram aggregation은 date field에서 사용 가능
- documents들을 1 개 이상의 bucket 으로 구성될 수 있는 multi-bucket aggregation 임.
- 아래와 그림과 같이 interval 을 사용하여 aggregation 함.

![](06_10.jpg)

- Interval 

  - Millisecond

  - Second

  - Minute

  - Hourly

  - Daily
  - Weekly
  - Monthly
  - Yearly



### Date Range

- Date형 필드에서 사용 가능

![](06_11.jpg)



### Filters

- filter를 기반으로 한 bucket들을 생성
- 여러 filter를 사용해서 multi bucket을 구성

![](06_12.jpg)



### Histogram

- 숫자형 필드에 적용 가능

- interval을 적용하여 bucket 생성, 예) 0-50,50-100,100-150

  ![](06_13.jpg)

  

### IPv4 Range

- IP addresses을 사용할때 

![](06_14.jpg)



### Range

- 숫자형 타임에서 사용 가능 
- 범위를 지정해야하며 해당 범위에 속하는 버킷에 문서가 나열

![](06_15.jpg)

### Terms

-  숫자, 문자열, 날짜, 부울, IP 주소, 타임 스탬프 등 모든 타임에서 가능
- Order는 선택한 측정 항목을 기준으로 데이터를 그룹화하는 정렬옵션
- Size는 시각화에 표시하려는 버킷 수

![](06_16.jpg)



### Metric Aggregation

- Metric Aggregation는 주로 bucket에 있는 문서에서 수행 된 계산
- 예를 들어 숫자 필드를 선택하면 COUNT, SUM, MIN, MAX, AVERAGE 등

![](06_17.jpg)





## 8. Kibana — Create Visualization



### Create Visualization