FROM golang:alpine as builder
WORKDIR /go
ENV GOPROXY=https://mirrors.aliyun.com/goproxy/
RUN apk add git
RUN git clone  https://hub.fastgit.org/yimeng/guestbook-demo
RUN cd guestbook-demo && go build 

FROM alpine
WORKDIR /home/guestbook
COPY --from=builder /go/guestbook-demo/guestbook-demo .
COPY entrpoint.sh .
ENTRYPOINT ./entrpoint.sh
