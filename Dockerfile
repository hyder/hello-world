FROM oracle/graalvm-ce:20.1.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/hello-world
WORKDIR /home/app/hello-world

RUN native-image --no-server -cp build/libs/hello-world-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/hello-world/hello-world /app/hello-world
ENTRYPOINT ["/app/hello-world"]
