FROM rocker/shiny-verse:4.0.3

# RUN apt-get update && apt-get install -y   && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git-core \
    libcurl4-openssl-dev \
    libgit2-dev \
    libicu-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pandoc \
    pandoc-citeproc \
    zlib1g-dev \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    # liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev

# Install R packages
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 40)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'

RUN install2.r --error \
    attempt \
    shinydashboard \
    config \
    rintrojs \
    qs \
    viridis \
    ggrepel \
    shinyEffects \
    ggnewscale \
    shinyWidgets \
    cowplot \
    shinycssloaders \
    shinydashboardPlus \
    plotly \
    golem \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    geoR \
    geosphere \
    tgstat \
    promises \
    future \
    anndata \
    attempt \
    chameleon \
    cli \
    colourpicker \
    circlize \
    config \
    cowplot \
    dplyr \
    DT \
    forcats \
    fs \
    furrr \
    future \
    ggnewscale \
    ggplot2 \
    ggrepel \
    grDevices \
    glue \
    golem \
    htmltools \
    markdown \
    matrixStats \
    pkgload \
    plotly \
    processx \
    promises \
    purrr \
    pryr \
    qs \
    rintrojs \
    rlang \
    rmarkdown \
    scales \
    shiny \
    shinyjs \
    shinycssloaders \
    shinydashboard \
    shinydashboardPlus \
    shinyEffects \
    shinyWidgets \
    shinybusy \
    tgstat \
    tibble \
    tidyr \
    vctrs \
    viridis \
    yaml \
    zip \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    geoR \
    geosphere \
    bslib \
    ## from bioconductor
    && R -e "BiocManager::install('rhdf5', update=FALSE, ask=FALSE)"

RUN Rscript -e 'remotes::install_github("tanaylab/tgutil")'
RUN Rscript -e 'remotes::install_github("tanaylab/tglkmeans")'
RUN Rscript -e 'remotes::install_github("tanaylab/MCView")'
RUN Rscript -e 'remotes::install_github("tanaylab/tgconfig")'


RUN install2.r --error \
    pryr \
    gplots \
    magicaxis

# Configure
EXPOSE 3838

WORKDIR /home/

ADD ./run_server.sh /home/

# Run server

CMD ["bash", "/home/run_server.sh"]

