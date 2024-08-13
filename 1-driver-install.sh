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