FROM python:3.11-alpine as builder
WORKDIR /myapp
COPY . /myapp/
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine
WORKDIR /myapp
COPY --from=builder /myapp /myapp
EXPOSE 5000
CMD [ "python", "app.py" ]