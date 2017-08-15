FROM tensorflow/tensorflow:latest-py3
# ENV LANG en_US.UTF-8  
ENV SHELL /bin/bash

RUN apt-get update -y && apt-get install build-essential -y
COPY apt-packages.txt /tmp/
COPY requirement.txt /tmp/
RUN xargs -a /tmp/apt-packages.txt apt-get install -y
RUN echo "alias python=python3" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc
RUN pip3 install --upgrade pip && pip3 install -r /tmp/requirement.txt

# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# COPY zshrc.template ~/.zshrc

# RUN mkdir -p /notebooks
# VOLUME /notebooks
# WORKDIR /notebooks

# Tensor Board
# EXPOSE 6006
# Jupiter
# EXPOSE 8888
# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
# COPY run_jupyter.sh /
# CMD ["/run_jupyter.sh", "--allow-root", "--no-browser", "--ip=0.0.0.0"]
