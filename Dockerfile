################################################################################
### 
### [CONTAINER CORE FUNCTIONS]: 
###     install "Generic Filter" Galaxy tool (and required third part softwares, libraries, ...).
### [NOTE]
###     please refer to README.md and about_docker.md files for further informations
### 
################################################################################

################################################################################
### fix parent containter
FROM ubuntu:16.04

################################################################################
### set author
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

ENV TOOL_NAME=tool-generic_filter
ENV TOOL_VERSION="release_2016.03.03"
ENV CONTAINER_VERSION=0.2
ENV CONTAINER_GITHUB=https://github.com/phnmnl/container-tool-generic_filter

LABEL version="${CONTAINER_VERSION}"
LABEL software.version="${TOOL_VERSION}"
LABEL software="${TOOL_NAME}"
LABEL base.image="ubuntu:16.04"
LABEL description="A filter for samples and/or variables."
LABEL website="${CONTAINER_GITHUB}"
LABEL documentation="${CONTAINER_GITHUB}"
LABEL license="${CONTAINER_GITHUB}"
LABEL tags="Metabolomics"

################################################################################
# Install
RUN echo "deb http://cran.univ-paris1.fr/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9  && \
    apt-get update  && \
    apt-get -y upgrade  && \
    apt-get install --no-install-recommends -y r-base && \
    apt-get install --no-install-recommends -y libcurl4-openssl-dev && \
    apt-get install --no-install-recommends -y libxml2-dev && \
    apt-get install --no-install-recommends -y git  && \
    git clone --recurse-submodules --single-branch -b ${TOOL_VERSION} https://github.com/workflow4metabolomics/tool-generic_filter.git /files/tool-generic_filter  && \
    echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile  && \
    Rscript -e "install.packages('batch', dep=TRUE)" && \
    apt-get purge -y git && \
    apt-get clean  && \
    apt-get autoremove -y  && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Set authorizations
RUN ["chmod", "a+x", "/files/tool-generic_filter/filter_wrap.R"]

# Make tool accessible through PATH
ENV PATH = $PATH:/files/tool-generic_filter

################################################################################
### Define script ENTRYPOINT or container CMD
ENTRYPOINT ["/files/tool-generic_filter/filter_wrap.R"]

### [END]
################################################################################
