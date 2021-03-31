# POC to experiment with kafka ang golang

The repo includes ready to use docker/compose template with kafka and few supporting tools: 
* [yahoo/CMAK](https://github.com/yahoo/CMAK)
* https://github.com/obsidiandynamics/kafdrop

Prepare images:
```sh
make images
```

Run kafka:
```sh
docker-compose up -d kafka
```
You now have kafka up and running on port `9092`

Optionally run cmak or kafdrop:
```sh
docker-compose up -d cmak
docker-compose up -d kafdrop
```
**Note:** they both use port 9000 so use just one of them