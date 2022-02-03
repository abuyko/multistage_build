FROM ubuntu:18.04 AS builder
RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc build-essential

WORKDIR /root
COPY hello.c .
RUN gcc -o helloworld hello.c

FROM ubuntu:18.04 AS runtime

COPY --from=builder /root/helloworld .
CMD ["./helloworld"]