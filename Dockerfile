FROM python:3.13-alpine AS build_stage
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt -t .

FROM python:3.13-alpine
COPY --from=build_stage /app /app
ENTRYPOINT ["python", "/app/dnsvalidator.py"]
