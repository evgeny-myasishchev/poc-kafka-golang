KAFKA_VERSION=2.7.0
SCALA_VERSION=2.13
CMAK_VERSION=3.0.0.5

KAFKA_PACKAGE_VERSION=$(SCALA_VERSION)-$(KAFKA_VERSION)
TGZ=kafka_$(KAFKA_PACKAGE_VERSION).tgz
KAFKA_ROOT=tmp/kafka_$(KAFKA_PACKAGE_VERSION)

.PHONY: kafka kafka_image cmak_image

tmp:
	mkdir -p tmp

tmp/$(TGZ): tmp
	curl https://apache.ip-connect.vn.ua/kafka/$(KAFKA_VERSION)/$(TGZ) --output $@

$(KAFKA_ROOT): tmp/$(TGZ)
	tar -xvvf tmp/$(TGZ) -C tmp

kafka: $(KAFKA_ROOT)

kafka_image: $(KAFKA_ROOT)
	docker build . -f docker/Dockerfile.kafka \
		-t local/kafka:latest \
		--build-arg KAFKA_PACKAGE_VERSION=$(KAFKA_PACKAGE_VERSION)

cmak_image:
	docker build . -f docker/Dockerfile.cmak \
		--build-arg CMAK_VERSION=$(CMAK_VERSION)