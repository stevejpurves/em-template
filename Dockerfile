ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

ARG NB_USER
ARG NB_UID

COPY . ${HOME}
WORKDIR ${HOME}

USER root
RUN apt install -y libgl1-mesa-glx xvfb
USER ${NB_USER}

RUN pip install -r requirements.txt

ENV CN_TEST='/pyvista-proxy/'