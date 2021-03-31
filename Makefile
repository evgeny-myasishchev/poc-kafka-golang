KAFKA_VERSION=2.7.0
SCALA_VERSION=2.13

KAFKA_PACKAGE_VERSION=$(SCALA_VERSION)-$(KAFKA_VERSION)
TGZ=kafka_$(KAFKA_PACKAGE_VERSION).tgz
KAFKA_ROOT=tmp/kafka_$(KAFKA_PACKAGE_VERSION)

tmp:
	mkdir -p tmp

tmp/$(TGZ): tmp
	curl https://apache.ip-connect.vn.ua/kafka/$(KAFKA_VERSION)/$(TGZ) --output $@

$(KAFKA_ROOT): tmp/$(TGZ)
	tar -xvvf tmp/$(TGZ) -C tmp

kafka_image: $(KAFKA_ROOT)
	docker build . -f docker/Dockerfile.kafka \
		-t local/kafka:latest \
		--build-arg KAFKA_PACKAGE_VERSION=$(KAFKA_PACKAGE_VERSION)