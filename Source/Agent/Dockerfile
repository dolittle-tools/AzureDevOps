FROM ubuntu:18.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
 && apt-get -y install \
        wget

RUN apt-get update \
 && apt-get -y install \
        software-properties-common \
        dirmngr \
        apt-transport-https \
        lsb-release \
        ca-certificates

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && add-apt-repository universe

RUN add-apt-repository ppa:git-core/ppa -y && apt-get update && apt-get install git -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN add-apt-repository ppa:rmescandon/yq

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        curl \
        jq \
        iputils-ping \
        libcurl4 \
        mono-devel \
        yq \
        python3-pip \
        dotnet-sdk-3.0

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]