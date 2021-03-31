# POC to experiment with kafka ang golang

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