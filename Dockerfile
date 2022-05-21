FROM continuumio/miniconda3:4.7.10

RUN conda install -y anaconda-client conda-build conda-verify numpy
RUN conda install --yes --quiet mamba -c conda-forge
RUN mamba install --yes --quiet boa -c conda-forge

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]