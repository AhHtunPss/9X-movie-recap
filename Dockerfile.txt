FROM python:3.11-slim

# ffmpeg + a Myanmar-script font so subtitles render correctly
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg fonts-noto-core fonts-noto-unhinted \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=7860
EXPOSE 7860

CMD ["python", "app.py"]
