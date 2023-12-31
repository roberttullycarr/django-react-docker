FROM continuumio/miniconda3:latest
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN mkdir -p /backend
RUN mkdir -p /scripts
RUN mkdir -p /static-files
RUN mkdir -p /media-files
RUN mkdir -p /frontend
RUN mkdir -p /frontend_tmp

COPY ./backend /backend
COPY ./scripts /scripts
RUN chmod +x ./scripts

WORKDIR /backend
RUN conda env create -f requirements.yml
ENV PATH /opt/conda/envs/django-react-docker/bin:$PATH
RUN conda update -n base -c defaults conda
RUN echo "source activate django-react-docker">~/.bashrc

WORKDIR /frontend_tmp
COPY ./frontend/package.json /frontend_tmp/
#COPY ./frontend/package-lock.json /frontend/
RUN npm install
COPY ./frontend /frontend_tmp
RUN npm run build

WORKDIR /backend
