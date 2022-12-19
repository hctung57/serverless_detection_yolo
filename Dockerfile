FROM nvcr.io/nvidia/l4t-pytorch:r32.7.1-pth1.9-py3
RUN mkdir detection
COPY requirements.txt detection
RUN pip install Flask
RUN pip install -r requirements.txt

COPY yolov5n.pt detection
COPY jetson_detection.py detection
COPY run.sh detection
# COPY setup.py detection

WORKDIR detection
# RUN python3 setup.py

EXPOSE 8080
CMD ["sh","./run.sh"]