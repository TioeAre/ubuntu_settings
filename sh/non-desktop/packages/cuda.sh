#!/usr/bin/bash

wget https://developer.download.nvidia.com/compute/cuda/12.6.0/local_installers/cuda_12.6.0_560.28.03_linux.run
sh cuda_12.6.0_560.28.03_linux.run

wget https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-9.10.2.21_cuda12-archive.tar.xz
tar -xvf cudnn-linux-x86_64-9.10.2.21_cuda12-archive.tar.xz

cp include/cudnn*.h /home/lixuan/cuda12.6/include/
cp lib/libcudnn* /home/lixuan/cuda12.6/lib64/

chmod a+r /home/lixuan/cuda12.6/include/cudnn*.h /home/lixuan/cuda12.6/lib64/libcudnn*

# export CUDA_HOME=/home/lixuan/cuda12.6
# export PATH=/home/lixuan/cuda12.6/bin:$PATH
# export LD_LIBRARY_PATH=/home/lixuan/cuda12.6/lib64:$LD_LIBRARY_PATH