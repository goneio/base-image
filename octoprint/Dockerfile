FROM octoprint/octoprint AS octoprint
RUN apt update -q && \
    apt install -yq \
        cpulimit && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/lib/dpkg/status.old /var/cache/debconf/templates.dat /var/log/dpkg.log /var/log/lastlog /var/log/apt/*.log

FROM matthewbaggett/octoprint AS builder
WORKDIR /build
RUN apt update -q && \
    apt install -yq unzip subversion
RUN curl -s -L https://github.com/pranjalv123/mjpg-streamer-yu12/archive/refs/heads/master.zip --output mjpeg-streamer-yu12.zip && \
    unzip -q mjpeg-streamer-yu12.zip
RUN cd mjpg-streamer-yu12-master/mjpg-streamer && \
    make && \
    ls -lah

FROM matthewbaggett/octoprint AS octoprint-mjpg-streamer
COPY --from=builder /build/mjpg-streamer-yu12-master/mjpg-streamer/mjpg_streamer /usr/local/bin/mjpg_streamer
COPY --from=builder /build/mjpg-streamer-yu12-master/mjpg-streamer/*.so /usr/local/lib/mjpg-streamer/