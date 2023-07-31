FROM python:3.10-buster

COPY requirements.txt /usr/src/requirements.txt
RUN pip install --no-cache-dir -r /usr/src/requirements.txt

EXPOSE 8080

COPY ./src /app/src

# Use the ping endpoint as a healthcheck,
# so Docker knows if the API is still running ok or needs to be restarted
#HEALTHCHECK --interval=21s --timeout=3s --start-period=10s CMD curl --fail http://localhost:8080/ || exit 1

WORKDIR /app/src

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]