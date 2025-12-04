# One Model is All You Need: Multi-Task Learning Enables Simultaneous Histology Image Segmentation and Classification

## How to run

Open Docker

in Docker if you have __macOS__, in the settings in __Resources__, you need to allocate more cores in __CPUs__ and more gigs of RAM in __Memory__ (because the project itself is resource-intensive, and Docker allocates little by default and artificially stops processing) — and then for the second line in the console, remove the _cpus_ and _memory_ arguments and also run these two commands in sequence.

After running Docker:
```
docker pull shilovski/dl_cerberus:multi-arch
docker run -it --cpus="4.0" --memory="8g" shilovski/dl_cerberus:multi-arch
```
where the first one downloads the __Image__ and the second launch of the __Container__.

After starting the __Container__ (nothing needs to be done — everything will be executed by itself, according to the __shell__ file launched after the start of the __Container__):
- download repository from github
- my patch will be applied to it (to change startup from __CUDA__ to __CPU__)
- sequential image processing (segmentation and classification of histological images)
- test.py execution — comparison of two images.

If at the end the download is finished like this — everything is ok:

<img width="734" alt="Снимок экрана 2023-03-22 в 20 42 39" src="https://user-images.githubusercontent.com/75098744/226991977-e813f177-304d-4585-8f4f-9257369fcaaf.png">

Your results can be viewed in the folder /workdir/output_test/overlay


* First look at the _CONTAINER_ID_ launched from _IMAGE_ shilovski/dl_cerberus:multi-arch
```
docker ps -a
```
* Copy the images you received from the __Container__ to <your_folder>:
```
docker cp <container_id>:/workdir/output_test ~/<your_folder>
docker cp <container_id>:/workdir/output ~/<your_folder>
```

The results, I got, are in the folder /workdir/output

The file _test.py_ is located in /workdir and is called in _entrypoint.sh_ (also in /workdir) after images are processed
## References

[Page](https://paperswithcode.com/paper/one-model-is-all-you-need-multi-task-learning) on __Papers With Code__

__Cerberus__ [repository](https://github.com/TissueImageAnalytics/cerberus#one-model-is-all-you-need-multi-task-learning-enables-simultaneous-histology-image-segmentation-and-classification)

Download the weights by visiting [this page](https://warwick.ac.uk/fac/cross_fac/tia/software/cerberus/), also for more information about the project

Test datasets
- Gland Segmentation in Histology Images Challenge — [GlaS Dataset](https://academictorrents.com/details/208814dd113c2b0a242e74e832ccac28fcff74e5)
- Dataset provided by Cerberus developers on [this page](https://warwick.ac.uk/fac/cross_fac/tia/software/cerberus/)

## Citation

```
@article{graham2022one,
  title={One model is all you need: multi-task learning enables simultaneous histology image segmentation and classification},
  author={Graham, Simon and Vu, Quoc Dang and Jahanifar, Mostafa and Raza, Shan E Ahmed and Minhas, Fayyaz and Snead, David and Rajpoot, Nasir},
  journal={Medical Image Analysis},
  pages={102685},
  year={2022},
  publisher={Elsevier}
}
```
