FROM rocker/geospatial:4.1.1

# Add intel MKL

RUN \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends intel-mkl

# Configure MKL 
RUN \
update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so  libblas.so-x86_64-linux-gnu      /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so.3 libblas.so.3-x86_64-linux-gnu    /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so  liblapack.so-x86_64-linux-gnu    /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so.3  liblapack.so.3-x86_64-linux-gnu  /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50

RUN install2.r --error \
  cowplot \
  patchwork \ 
  ggforce 

# Dependencies for igraph & related
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  libxml2-dev \
  libgmp3-dev \
  libglpk-dev


# Forgot to install these ones
RUN install2.r --error \ 
  igraph \
  ape \
  blockmodels \
  eigenmodel \
  ergm \
  huge \
  igraphdata \
  kernlab \
  ndtv \
  network \
  networkDynamic\
  networkTomography \
  ngspatial \
  rgexf \
  ROCR \
  RSiena \
  sand \
  sna \
  statnet \
  tergm \
  vioplot \
  GGally \
  ggraph \
  BiocManager

# Add bioconductor packages
RUN r -e 'BiocManager::install(c("GOstats", "Rgraphviz", "WGCNA"))'

