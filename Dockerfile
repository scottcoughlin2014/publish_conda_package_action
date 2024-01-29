FROM condaforge/mambaforge:latest

RUN mamba install -c conda-forge boa anaconda-client conda-verify

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
