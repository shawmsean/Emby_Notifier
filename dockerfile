FROM python:3.11-alpine3.18

LABEL maintainer="Xu@nCh3n"

ENV TZ=Asia/Shanghai LANG=zh_CN.UTF-8 PYTHONUNBUFFERED=1

EXPOSE 8000

RUN set -eux && \
        \
        apk --no-cache update && apk -U --no-cache add git && \
        \
        mkdir -p /usr/src/myapp/ && \
        git clone git@github.com:shawmsean/Emby_Notifier.git /usr/src/myapp/ && \
        python3 -m pip install --no-cache-dir requests colorlog aiohttp -q; 

ENTRYPOINT ["python3"]
CMD ["/usr/src/myapp/main.py"]