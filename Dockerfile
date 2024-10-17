FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git 

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install pyyaml
RUN /opt/venv/bin/pip install pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint uses the virtual environment
ENTRYPOINT [ "/entrypoint.sh" ]

# Activate the virtual environment by default in the entrypoint script
RUN echo "source /opt/venv/bin/activate" >> /entrypoint.sh

