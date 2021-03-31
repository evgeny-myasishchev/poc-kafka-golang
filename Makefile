KAFKA_VERSION=2.7.0
SCALA_VERSION=2.13
KAFKA_TGZ_VERSION=$(SCALA_VERSION)-$(KAFKA_VERSION)
TGZ=kafka_$(KAFKA_TGZ_VERSION).tgz

tmp:
	mkdir -p tmp

tmp/$(TGZ):
	curl https://apache.ip-connect.vn.ua/kafka/$(KAFKA_VERSION)/$(TGZ) --output tmp/$(TGZ)

build_kafka: tmp/$(TGZ)