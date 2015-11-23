# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific
# packages
#
# ----------------------------------------
#FROM scienceis/uoa-inzight-base:latest
FROM uoa-inzight-base:tom

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV R_PACKAGES '"iNZightMR", "iNZightTS", "iNZightRegression", "iNZightPlots", "GGally"'

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages(c(${R_PACKAGES}), \
             repos = c('http://docker.stat.auckland.ac.nz/R', 'http://cran.stat.auckland.ac.nz'))" \
  && rm -rf /tmp/* /var/tmp/*
