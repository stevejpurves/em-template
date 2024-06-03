ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

COPY . ${HOME}
WORKDIR ${HOME}

COPY ./entrypoint.sh ${HOME}/entrypoint.sh
RUN chmod +x ${HOME}/entrypoint.sh

RUN pip install -r requirements.txt

ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/pyvista-proxy/'

ENTRYPOINT ["${HOME}/entrypoint.sh"]