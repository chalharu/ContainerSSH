FROM golang AS build
RUN mkdir -p /go/src/github.com/janoszen/containerssh
WORKDIR /go/src/github.com/janoszen/containerssh/
COPY . /go/src/github.com/janoszen/containerssh
RUN make build

FROM scratch AS run
COPY --from=build /go/src/github.com/janoszen/containerssh/containerssh /containerssh
ENTRYPOINT ["/containerssh"]
VOLUME /etc/containerssh
VOLUME /var/secrets
EXPOSE 2222
