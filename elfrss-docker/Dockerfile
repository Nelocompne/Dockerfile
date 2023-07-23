FROM python:3.11

WORKDIR /data

RUN pip install 'nonebot2[fastapi]' nonebot-adapter-console nonebot-adapter-onebot \
    && mkdir -p awesome_bot/plugins && mkdir data \
    && git clone https://hub.fgit.ml/Quan666/ELF_RSS.git \
    && cp -r ELF_RSS/src/plugins/ELF_RSS2 awesome_bot/plugins \
    && pip install -r ELF_RSS/requirements.txt

EXPOSE 8080

ENTRYPOINT ["python", "bot.py"]