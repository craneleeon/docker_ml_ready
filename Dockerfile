FROM ubuntu:16.04 
ENV LANG en_US.UTF-8

RUN apt-get update -y && apt-get install build-essential -y
ADD apt-packages.txt /tmp/apt-packages.txt
ADD requirement.txt /tmp/requirement.txt
RUN xargs -a /tmp/apt-packages.txt apt-get install -y
RUN pip3 install -r /tmp/requirement.txt
# RUN useradd --create-home --home-dir /home/ml --shell /bin/bash ml
RUN echo "alias python=python3" >> ~/.bashrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ADD .zshrc ~/.zshrc
EXPOSE 8888
RUN mkdir -p ~/notebooks
VOLUME ~/notebooks
WORKDIR ~/notebooks

CMD ["/bin/zsh"]
