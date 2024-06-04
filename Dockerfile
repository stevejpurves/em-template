ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

COPY . ${HOME}
WORKDIR ${HOME}

RUN pip install -r requirements.txt
RUN apt install -y libgl1-mesa-glx xvfb

ENV CN_TEST='/pyvista-proxy/'