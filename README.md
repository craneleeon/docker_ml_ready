# docker_ml_ready

Docker image for ML

To run within current folder as Jupyter notebooks folder: 

```shell
docker run -it -p 8888:8888 --name myml -v `pwd`:/notebooks craneleeon/docker_ml_ready
```
