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

################################################################################
### install third part tools: r-base, system libraries and Git
RUN echo "deb http://cran.univ-paris1.fr/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \ 
    r-base \
    libcurl4-openssl-dev \
    libxml2-dev \
    git && \ 
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

################################################################################
### install R libraries

# init R env. (Docker)
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

# install R libs
RUN Rscript -e "install.packages('batch', dep=TRUE)"

################################################################################
### set script / container metadata

ENV TOOL_VERSION="release_2016.03.03"

LABEL tool="tool-generic_filter"
LABEL tool.version="${TOOL_VERSION}"
LABEL version="0.1"

################################################################################
### install core scripts

# get script using `git clone` command
RUN git clone --recurse-submodules --single-branch -b ${TOOL_VERSION} https://github.com/workflow4metabolomics/tool-generic_filter.git /files/tool-generic_filter
 
# set authorizations
RUN ["chmod", "a+x", "/files/tool-generic_filter/filter_wrap.R"]

# make tool accessible through PATH
ENV PATH = $PATH:/files/tool-generic_filter

################################################################################
### Define script ENTRYPOINT or container CMD
ENTRYPOINT ["/files/tool-generic_filter/filter_wrap.R"]

### [END]
################################################################################
