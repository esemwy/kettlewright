FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app
# media-types provides /etc/mime.types so static .webp files get the right Content-Type
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends media-types && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY . /app/
RUN mkdir -p /app/instance
RUN chmod +x /app/entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"]