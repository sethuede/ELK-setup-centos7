FROM centos:7

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.7.2-x86_64.rpm && \
    rpm -i filebeat-6.7.2-x86_64.rpm && \
    rm -f filebeat-6.7.2-x86_64.rpm && \
    mkdir -p /etc/filebeat

COPY filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod 600 /etc/filebeat/filebeat.yml

ENTRYPOINT ["/usr/share/filebeat/bin/filebeat", "-e", "-v"]
CMD ["-c", "/etc/filebeat/filebeat.yml"]
