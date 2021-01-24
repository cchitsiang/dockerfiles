docker run --net=kafka_fast-data -e APPLICATION_ID=zz-cep-app -e KAFKA_BOOTSTRAP_SERVER=kafka:9092 wizzieio/zz-cep:latest

KAFKA_LISTENER_NAME_EXTERNAL_PLAIN_SASL_JAAS_CONFIG: \
          org.apache.kafka.common.security.plain.PlainLoginModule required \
          username="xxx" \
          password="xxx"