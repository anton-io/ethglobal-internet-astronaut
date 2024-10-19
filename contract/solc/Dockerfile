FROM alpine:3.20
MAINTAINER Antonio Roldao <docker@anton.io>

ARG VERSION=0.0.1

LABEL name="solc" version=$VERSION
COPY entrypoint.sh entrypoint.sh

# Install core components.
RUN apk update && \
    apk upgrade && \
    apk add bash npm && \
    npm install -g solc && \
    chmod u+x entrypoint.sh

# Install dependencies.
RUN npm install "@openzeppelin/contracts"

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["./entrypoint.sh"]