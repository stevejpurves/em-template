ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

COPY --chown=${NB_USER} . ${HOME}
WORKDIR ${HOME}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
USER ${NB_USER}

USER root
RUN apt install -y libgl1-mesa-glx xvfb
USER ${NB_USER}

RUN pip install -r requirements.txt

ENV CN_TEST='/pyvista-proxy/'