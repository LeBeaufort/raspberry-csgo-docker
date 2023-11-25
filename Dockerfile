FROM anujdatar/box86

COPY entry.sh /entry.sh
COPY steamcmd-script.txt /install-script.txt

# the environement variable
ENV EXTRA_ARGS = $"+sv_pure 1 +sv_bot 0"

#installing dependencies
RUN apt update && apt install curl -y && \
	apt update && apt install bash -y

# installing steamCMD
WORKDIR /steamCMD/
RUN curl -O https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
	tar -xzf steamcmd_linux.tar.gz && rm -f steamcmd_linux.tar.gz

	

# running the entry script
WORKDIR /
ENTRYPOINT chmod +x entry.sh && ./entry.sh "$EXTRA_ARGS"