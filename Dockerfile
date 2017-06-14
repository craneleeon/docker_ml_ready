FROM ubuntu:16.04 
# ENV LANG en_US.UTF-8  
ENV SHELL /bin/bash

RUN apt-get update -y && apt-get install build-essential -y
COPY apt-packages.txt /tmp/apt-packages.txt
COPY requirement.txt /tmp/requirement.txt
RUN xargs -a /tmp/apt-packages.txt apt-get install -y
# RUN useradd --create-home --home-dir /home/ml --shell /bin/bash ml
RUN echo "alias python=python3" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc
RUN pip3 install --upgrade pip && pip3 install -r /tmp/requirement.txt
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# COPY zshrc.template ~/.zshrc
RUN mkdir -p /notebooks
VOLUME /notebooks
WORKDIR /notebooks
EXPOSE 8888
CMD jupyter-notebook --no-browser --port 8888 --allow-root --ip=0.0.0.0 
