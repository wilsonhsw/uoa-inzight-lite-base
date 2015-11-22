# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific 
# packages
#
# ----------------------------------------
FROM scienceis/uoa-inzight-base:latest

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages(\
             c('iNZightMR', 'iNZightTS', 'iNZightRegression', 'iNZightPlots', 'GGally'), \
             repos = c('http://docker.stat.auckland.ac.nz/R', 'http://cran.stat.auckland.ac.nz') \
           )" \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

