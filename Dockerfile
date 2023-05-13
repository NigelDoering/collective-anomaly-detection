FROM jupyter/datascience-notebook
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/
 
COPY bdp-api-py/ ${APP_ROOT_CONTAINER}/bdp-api-py/
COPY requirements.txt ${APP_ROOT_CONTAINER}/
COPY scripts/install_dependencies.sh ${APP_ROOT_CONTAINER}/scripts/install_dependencies.sh

USER root
RUN scripts/install_dependencies.sh 
USER jovyan

COPY . ${APP_ROOT_CONTAINER}