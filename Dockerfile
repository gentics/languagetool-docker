FROM openjdk:8-jdk-slim-buster

ENV VERSION 5.6
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN set -ex \
    && apt-get update -y \
    && apt-get install -y \
	unzip \
    && apt-get clean \
    && unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip

WORKDIR /LanguageTool-$VERSION

CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--port", "8010", "--public" ]
EXPOSE 8010
