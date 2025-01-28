FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04
ARG PERL_VERSION=5.34.1

# Everything below this is needed for installing MariaDB
# Instructions are copied and modified from: https://mariadb.com/docs/clients/mariadb-connectors/connector-cpp/install/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -yq install \
        curl \
        libgd-dev uuid-dev \
        libgd-text-perl \
        libdevel-patchperl-perl \
        libmodule-runtime-perl

#RUN timedatectl set-timezone Europe/London

#ARG PERL_VERSION

#RUN curl -sSL https://install.perlbrew.pl -o perlbrew.sh \
#    && sh perlbrew.sh \
#    && perlbrew available \
#    && perlbrew install --notest perl-$PERL_VERSION \
#    && perlbrew use perl-$PERL_VERSION \
#    && perlbrew install-cpanm

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
