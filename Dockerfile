FROM maven:3-jdk-8

RUN apt-get update && apt-get install -y --no-install-recommends graphviz fonts-symbola fonts-wqy-zenhei && rm -rf /var/lib/apt/lists/*
RUN wget -O /plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.1.2019.6.jar/download

# By default, java writes a 'hsperfdata_<username>' directory in the work dir.
# This directory is not needed; to ensure it is not written, we set `-XX:-UsePerfData`
ENTRYPOINT [ "java", "-XX:-UsePerfData", "-jar", "/plantuml.jar" ]