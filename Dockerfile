FROM jupyter/datascience-notebook
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/
 
COPY requirements.txt ${APP_ROOT_CONTAINER}/
COPY scripts/install_dependencies.sh ${APP_ROOT_CONTAINER}/scripts/install_dependencies.sh

USER root
RUN apt-get update
RUN apt-get install -y software-properties-common && apt-get update
RUN add-apt-repository ppa:ubuntugis/ppa && apt-get update
RUN apt-get install -y gdal-bin libgdal-dev
RUN apt-get install -y --no-install-recommends graphviz
ARG CPLUS_INCLUDE_PATH=/usr/include/gdal
ARG C_INCLUDE_PATH=/usr/include/gdal
RUN scripts/install_dependencies.sh 
USER jovyan



COPY . ${APP_ROOT_CONTAINER}