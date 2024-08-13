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