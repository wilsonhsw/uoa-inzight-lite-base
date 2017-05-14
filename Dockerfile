# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific 
# packages
#
# ----------------------------------------
FROM scienceis/uoa-inzight-base:latest

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV BUILD_DATE "2017-05-14"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN apt-get update \
  && apt-get install -y -q \
                     libxml2-dev \
  && R -e "install.packages(\
             c('RJSONIO', 'iNZightMR', 'iNZightTS', 'iNZightRegression', 'iNZightPlots', 'gpairs'), \
             repos = c('http://docker.stat.auckland.ac.nz/R', 'http://cran.stat.auckland.ac.nz') \
           ); install.packages('https://cran.r-project.org/src/contrib/Archive/GGally/GGally_0.5.0.tar.gz', repos = NULL, type = 'source', dependencies = TRUE); update.packages(oldPkgs = 'shiny', repos = 'https://cran.r-project.org', ask = FALSE); install.packages('hextri', repos = 'https://cran.r-project.org', type = 'source'); install.packages('colorspace', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('RColorBrewer', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('viridis', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('XML', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('https://cran.r-project.org/src/contrib/Archive/gridSVG/gridSVG_1.5-0.tar.gz', repos = NULL, type = 'source', dependencies = TRUE); install.packages('RgoogleMaps', repos = 'https://cran.r-project.org', dependencies = TRUE); install.packages('countrycode', repos = 'https://cran.r-project.org'); update.packages(repos = 'http://r.docker.stat.auckland.ac.nz/R/', ask = FALSE); install.packages('iNZightMaps', repos = 'http://r.docker.stat.auckland.ac.nz/R/'); install.packages('readxl', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*

