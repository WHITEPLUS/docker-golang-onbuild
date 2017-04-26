FROM buildpack-deps:jessie

# Ref: https://hub.docker.com/_/golang/
# buildpack-deps (exclude g++, gcc, make, g++ gcc libc6-dev for cgo)

ENV GOLANG_VERSION 1.8.1
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 a579ab19d5237e263254f1eac5352efcf1d70b9dacadb6d6bb12b0911ede8994
ENV GOPATH /go

ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && sed -i "s/httpredir\\.debian\\.org/cdn.debian.net/" /etc/apt/sources.list \
 && sed -i "s/jessie main/jessie main contrib non-free/" /etc/apt/sources.list \
 # APT - Update/Upgrade/Install
 && apt-get update 1> /dev/null \
 && apt-get upgrade -y -q --no-install-recommends \
 && apt-get install -y --no-install-recommends \
 # CA-Certificates
 ca-certificates \
 # Tools
 git pkg-config curl \
 # Golang
 && curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
 && echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
 && tar -C /usr/local -xzf golang.tar.gz \
 && rm golang.tar.gz \
 && mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" \
 # APT - Clean
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR $GOPATH

ENTRYPOINT ["go"]


