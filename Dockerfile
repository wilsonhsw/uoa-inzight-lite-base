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
RUN R -e "install.packages(\
             c('RJSONIO', 'iNZightMR', 'iNZightTS', 'iNZightRegression', 'iNZightPlots', 'GGally', 'gpairs'), \
             repos = c('http://docker.stat.auckland.ac.nz/R', 'http://cran.stat.auckland.ac.nz') \
           ); update.packages(oldPkgs = 'shiny', repos = 'https://cran.r-project.org', ask = FALSE); install.packages('hextri', repos = 'https://cran.r-project.org', type = 'source'); install.packages('colorspace', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('RColorBrewer', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('viridis', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('XML', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE); install.packages('https://cran.r-project.org/src/contrib/Archive/gridSVG/gridSVG_1.5-0.tar.gz', repos = NULL, type = 'source', dependencies = TRUE);  install.packages('RgoogleMaps', repos = 'https://cran.r-project.org', dependencies = TRUE); install.packages('countrycode', repos = 'https://cran.r-project.org'); update.packages(repos = 'http://r.docker.stat.auckland.ac.nz/R/', ask = FALSE); install.packages('iNZightMaps', repos = 'http://r.docker.stat.auckland.ac.nz/R/'); install.packages('readxl', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*

