FROM ultralytics/yolov5:latest-cpu
RUN mkdir detection
# COPY requirements.txt detection

RUN export LC_CTYPE=en_US.UTF-8
# RUN python3 -m pip install --upgrade pip wheel
RUN pip3 install Flask
    # pip3 install -r detection/requirements.txt
    
COPY setup.py detection
COPY yolov5n.pt detection
COPY yolo_detection.py detection
COPY run.sh detection

RUN python3 detection/setup.py
WORKDIR detection
# RUN python3 setup.py

EXPOSE 8080
CMD ["sh","./run.sh"]