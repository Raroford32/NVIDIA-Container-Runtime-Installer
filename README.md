# NVIDIA-Container-Runtime-Installer

> Author FKT

A simple script for debian based OS install NVIDIA Driver and Docker container runtime

---

## Getting Started

### Step.1 Install Dependencies/Driver

```shell
sudo sh 1-driver-install.sh
```

then auto reboot

### Step.2 Install CUDA

```shell
sudo sh 2-cuda-install.sh
```

then auto reboot

### Step.3 Setup Configure

```shell
sudo sh 3-configure
```

Complete Install

### Try

```shell
nvidia-smi # Try NVIDIA Driver
nvcc -V # Try CUDA
# NVIDIA Container Runtime
```

----


