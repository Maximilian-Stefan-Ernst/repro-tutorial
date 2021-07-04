# Generated by repro: do not edit by hand
# Please edit Dockerfiles in .repro/
FROM rocker/verse:4.0.4
ARG BUILD_DATE=2021-05-06
WORKDIR /home/rstudio
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
# install fixed version of Chrome
RUN apt-get update &&\
  wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_90.0.4430.72-1_amd64.deb \
  && apt install -y /tmp/chrome.deb \
  && rm /tmp/chrome.deb
RUN Rscript -e 'tinytex::tlmgr_install(c("epstopdf-pkg", "mdwtools", "booktabs", "framed", "fancyvrb", "geometry", "infwarerr", "pdftexcmds", "xcolor", "etoolbox", "kvsetkeys", "ltxcmds", "kvoptions", "iftex", "amsmath", "auxhook", "auxhook", "bigintcalc", "bitset", "etexcmds", "gettitlestring", "hycolor", "hyperref", "intcalc", "kvdefinekeys", "letltxmacro", "pdfescape", "refcount", "rerunfilecheck", "stringenc", "uniquecounter", "zapfding", "colortbl", "soul", "multirow", "microtype", "totcount", "amscls", "hyphenat", "natbib", "footmisc", "newfloat", "caption", "texlive-scripts", "fancyhdr", "grfext", "lastpage", "palatino", "ec", "lineno", "float", "setspace", "enumitem", "psnfss", "symbol", "titlesec", "tabto-ltx", "fp", "ms", "pgf", "fpl", "mathpazo", "dvips"))'
RUN install2.r --error --skipinstalled \ 
  furrr \ 
  future.batchtools \ 
  gert \ 
  here \ 
  knitr \ 
  lavaan \ 
  moments \ 
  pander \ 
  patchwork \ 
  renv \ 
  report \ 
  rticles \ 
  slider \ 
  targets \ 
  tidyverse \ 
  usethis
RUN installGithub.r \ 
  aaronpeikert/repro@7bfaf98 \ 
  rstudio/webshot2@f62e743
