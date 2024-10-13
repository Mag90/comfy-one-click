HF_ACCESS_TOKEN="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"

echo "Cloning the ComfyUI repository..."
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI

# Install the required Python packages
echo "Installing Python dependencies..."
pip3 install -r requirements.txt

echo "Installing ComfyUI Manager..."
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ..

# Create the necessary directories for the models if they don't exist
mkdir -p models/unet
mkdir -p models/clip
mkdir -p models/vae
mkdir -p models/controlnet/flux

# Download the UNET model (flux1-dev.safetensors or flux1-schnell.safetensors)
echo "Downloading UNET model from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/unet/flux1-dev.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors

# Download the CLIP models
echo "Downloading CLIP models from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors

# Download the VAE model
echo "Downloading VAE model from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors

# Download the ControlNet model
echo "Downloading ControlNet model from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/controlnet/flux/diffusion_pytorch_model.safetensors https://huggingface.co/InstantX/FLUX.1-dev-Controlnet-Union/resolve/832dab0074e8541d4c324619e0e357befba19611/diffusion_pytorch_model.safetensors


# Extract ClearRealityV1 upscale model from existing zip file
echo "Extracting ClearRealityV1 upscale model..."
mkdir -p models/upscale_models
unzip misc/ClearRealityV1.zip -d models/upscale_models

echo "Starting ComfyUI server..."
nohup python3 main.py > comfyui.log 2>&1 &

echo "ComfyUI has been set up and is running. You can access the GUI at http://127.0.0.1:8188."
