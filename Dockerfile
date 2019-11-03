FROM continuumio/miniconda3
SHELL ["/bin/bash", "-c"]

# see https://github.com/ContinuumIO/docker-images/issues/89
# see https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754

COPY . .
WORKDIR dhSegment

# CONDA skip v-env it only creates trouble and is superfluous inside the container
# RUN conda create -n dh_segment \
#    && echo "conda activate dh_segment" >> ~/.bashrc
# ENV PATH /opt/conda/envs/dh_segment/bin:$PATH


RUN pip install git+https://github.com/dhlab-epfl/dhSegment \
    && conda install --quiet --yes tensorflow-gpu=1.13.1

# DEMO
# WORKDIR demo
# ADD https://github.com/dhlab-epfl/dhSegment/releases/download/v0.2/pages.zip .
# RUN apt-get install unzip \
# && unzip pages.zip \
# && rm pages.zip
# ADD https://github.com/dhlab-epfl/dhSegment/releases/download/v0.2/model.zip .
# RUN unzip model.zip \
#  && rm -r model.zip \
#  && cd ..
# WORKDIR dhSegment


# HEALTHCHECK
