FROM golang as builder
WORKDIR /home/guestbook
ENV GOPROXY=https://mirrors.aliyun.com/goproxy/
RUN git clone  https://hub.fastgit.org/yimeng/guestbook-demo
RUN cd guestbook-demo && go build

FROM alpine
WORKDIR /home/guestbook
COPY --from=builder /home/guestbook/guestbook .
COPY entrpoint.sh .
ENTRYPOINT ./entrpoint.sh
