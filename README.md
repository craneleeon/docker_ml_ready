# docker_ml_ready

Docker image for ML

To run within current folder as Jupyter notebooks folder: 

```shell
docker run -it -p 8888:8888 -p 6006:6006 --name myml -v `pwd`:/notebooks -e "PASSWORD=ANewPassword" craneleeon/docker_ml_ready
```
