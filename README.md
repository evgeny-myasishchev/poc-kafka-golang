# POC to experiment with kafka ang golang

The repo includes ready to use docker/compose template with kafka and [yahoo/CMAK](https://github.com/yahoo/CMAK)

Assuming docker and compose are installed.

Prepare kafka image:
```sh
make kafka_image
```

Run kafka:
```sh
docker-compose up -d kafka
```

You now have kafka up and running on port `9092`