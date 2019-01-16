# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

MAINTAINER Christian Del Monte "register@cdelmonte.de"

RUN conda install --quiet --yes \
    'py2neo=4.*' \
    'python-igraph=0.7*' && \
    conda clean -tipsy && \
    pip install ipython-cypher networkx --user --no-cache-dir && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
