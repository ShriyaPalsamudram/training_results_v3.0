## Steps to launch training

### QuantaGrid D74H-7U

Launch configuration and system-specific hyperparameters for the QuantaGrid D74H-7U
submission are in the `../<implementation>/config_D74H-7U_1x8x192x1.sh` script.

Steps required to launch training on QuantaGrid D74H-7U.

1. Build the docker container and push to a docker registry

```
cd ../pytorch
docker build --pull -t <docker/registry:benchmark-tag> .
docker push <docker/registry:benchmark-tag>
```

2. Launch the training
```
source config_D74H-7U_1x8x192x1.sh
NEXP=10 CONT=<docker/registry:benchmark-tag> DATADIR=<path/to/data> METADATA_DIR=<path/to/data/tokenized> SENTENCEPIECES_DIR=<path/to/data/sentencepieces> bash ./run_with_docker.sh
