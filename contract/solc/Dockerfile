FROM alpine:3.20
MAINTAINER Antonio Roldao <docker@anton.io>

ARG VERSION=0.0.1

LABEL name="solc" version=$VERSION


# Install core components.
RUN apk update && \
    apk upgrade && \
    apk add bash npm && \
    npm install -g solc

# Install dependencies.
RUN npm i -g "@openzeppelin/contracts"

# Configure entry point with option to run bash.
COPY entrypoint.sh entrypoint.sh
RUN chmod u+x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]