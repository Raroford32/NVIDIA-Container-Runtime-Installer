#!/bin/bash

# Install Dependencies
echo "[Step 1] Installing Dependencies..."
sudo apt update && sudo apt install -y curl git net-tools docker.io neofetch

# Install NVIDIA Driver
echo "[Step 2] Installing NVIDIA Drivers..."
sudo apt update && sudo apt upgrade -y
sudo apt install ubuntu-drivers-common -y
NVIDIA_DRIVER=$(sudo ubuntu-drivers devices | grep recommended | awk '{print $2}')
echo "Recommended NVIDIA driver version: $NVIDIA_DRIVER"
sudo apt install "$NVIDIA_DRIVER" -y

# Reboot after installing NVIDIA driver
echo "Rebooting system..."
sudo reboot now

# Install CUDA
echo "[Step 3] Installing CUDA..."
nvidia-smi
sudo apt install gcc -y
gcc -v
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda

# Reboot after installing CUDA
echo "Rebooting system..."
sudo reboot now

# Configure .bashrc for CUDA
echo "[Step 4] Configuring .bashrc for CUDA..."
echo "neofetch" >> ~./bashrc
echo "export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc

# Verify CUDA Installation
echo "Verifying CUDA Installation..."
nvcc -V

# Install Docker NVIDIA Runtime
echo "[Step 5] Installing Docker NVIDIA Runtime..."
sudo apt install -y nvidia-docker2
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "[Complete] Installation completed successfully."