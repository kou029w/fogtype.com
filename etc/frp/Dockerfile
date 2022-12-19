FROM alpine:3.17.0
RUN apk add --no-cache frp
COPY ./frps.ini /etc/frp/frps.ini
CMD ["frps", "-c", "/etc/frp/frps.ini"]
