FROM ubuntu:22.10
FROM continuumio/miniconda3:latest

WORKDIR /workdir

COPY environment.yml .

RUN apt-get update && apt-get -y install make git gcc ffmpeg libsm6
RUN conda env create -f environment.yml
RUN . /opt/conda/etc/profile.d/conda.sh && conda activate cerberus
RUN pip install torch==1.13.0 torchvision==0.14.0 --extra-index-url https://download.pytorch.org/whl/cpu
RUN mkdir -p /workdir/images_test && mkdir -p /workdir/resnet34_cerberus && mkdir -p /workdir/output

COPY resnet34_cerberus /workdir/resnet34_cerberus
COPY images_test /workdir/images_test
COPY output /workdir/output
COPY entrypoint.sh for_cpu.patch test.py ./

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
