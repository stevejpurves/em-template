ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

COPY . ${HOME}
WORKDIR ${HOME}
RUN pip install -r requirements.txt

COPY ./entrypoint.sh ${HOME}/entrypoint.sh
RUN chmod +x ${HOME}/entrypoint.sh

ENTRYPOINT ["${HOME}/entrypoint.sh"]