# AUTHOR: Marcos Winicyus Borges Lima
# DESCRIPTION: Basic Airflow with papermill container 
# SOURCE: https://github.com/MarcosWinicyus/prod-airflow-docker

FROM puckel/docker-airflow:1.10.9
LABEL maintainer="marcos.lima@simpleagro.com.br"

USER root

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -y\
    && pip install --upgrade pip apache-airflow \
    && pip install jupyterlab \
    && pip install papermill \
    && jupyter labextension install --minimize=False @jupyterlab/celltags \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

