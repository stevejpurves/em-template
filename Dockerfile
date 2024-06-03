ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

COPY start /start
RUN chmod +x /start

COPY . ${HOME}
WORKDIR ${HOME}
RUN pip install -r requirements.txt

ENTRYPOINT ["start"]