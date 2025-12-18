FROM continuumio/miniconda3:latest

WORKDIR /workdir

COPY environment.yml .
RUN apt-get update && apt-get -y install make git gcc ffmpeg libsm6 libxext6 imagecodecs

RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "cerberus", "/bin/bash", "-c"]

RUN pip install torch==1.13.0 torchvision==0.14.0 --extra-index-url https://download.pytorch.org/whl/cpu

COPY . /workdir/

RUN chmod +x entrypoint.sh

ENTRYPOINT ["conda", "run", "-n", "cerberus", "./entrypoint.sh"]
