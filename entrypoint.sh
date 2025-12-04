#!/bin/bash --login

git clone https://github.com/TissueImageAnalytics/cerberus.git

cd cerberus

git apply ../for_cpu.patch

conda activate cerberus

python run_infer_tile.py \
--gpu="0" \
--batch_size=25 \
--model="../resnet34_cerberus" \
--input_dir="../images_test/" \
--output_dir="../output_test/"

cd ..

python test.py