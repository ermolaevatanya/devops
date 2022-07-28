FROM python:3.9
COPY . /HW7
WORKDIR /HW7
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
