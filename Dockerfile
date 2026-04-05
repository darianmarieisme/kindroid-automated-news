FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Railway cron jobs: this just runs the script and exits
CMD ["python", "news_bot.py"]
