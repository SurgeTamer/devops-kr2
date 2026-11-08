FROM devops-app:1.0

USER root
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

USER app

EXPOSE 8004

CMD ["gunicorn", "--bind", "0.0.0.0:8004", "--access-logfile", "-", "app:app"]