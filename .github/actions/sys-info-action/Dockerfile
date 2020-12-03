FROM alpine:latest

RUN apk add --no-cache bash

COPY sys_info.sh /sys_info.sh

ENTRYPOINT ["/bin/bash", "/sys_info.sh"]
