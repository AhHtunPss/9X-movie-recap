FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install movie-narrator-web

ENV PORT=10000

EXPOSE 10000

CMD ["sh", "-c", "mn-web --host 0.0.0.0 --port ${PORT}"]
