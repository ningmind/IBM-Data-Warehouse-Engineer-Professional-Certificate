Task 2.1
(new terminal)
cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties

Task 2.2
(new terminal)
cd kafka_2.12-2.8.0
bin/kafka-server-start.sh config/server.properties

Task 2.3
(new terminal)
cd kafka_2.12-2.8.0
bin/kafka-topics.sh --create --topic toll --bootstrap-server localhost:9092

Task 2.4
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Final%20Assignment/toll_traffic_generator.py

Task 2.6
python3 toll_traffic_generator.py

Task 2.7
(new terminal)
cd kafka_2.12-2.8.0
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Final%20Assignment/streaming_data_reader.py

Task 2.8
python3 streaming_data_reader.py

Task 2.9
(new terminal)
cd kafka_2.12-2.8.0
bin/kafka-console-consumer.sh --topic toll --from-beginning --max-messages 10 --bootstrap-server localhost:9092
