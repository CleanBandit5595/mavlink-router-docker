FROM ubuntu:20.04


ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y git build-essential autoconf automake pkg-config python3-pip libtool
RUN apt install -y meson ninja-build pkg-config gcc g++ systemd
RUN pip3 install --user future lxml
RUN pip3 install --upgrade --user meson
RUN git clone --recursive https://github.com/intel/mavlink-router
WORKDIR mavlink-router

RUN meson setup build .
RUN ninja -C build install


RUN mkdir /etc/mavlink-router
COPY files/mavlink-router.conf /etc/mavlink-router/main.conf

CMD mavlink-routerd -e 127.0.0.1:14551 -e 127.0.0.1:14552 -e 127.0.0.1:14553 -e 127.0.0.1:14554 -e 127.0.0.1:14555 0.0.0.0:24550
