HF_ACCESS_TOKEN="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"
CIVITAI_ACCESS_TOKEN="1e02ca8ab1875d5bff720b78f42e31e6"

#wget -O models/checkpoints/wildcardxRealistic_wildcardxV2.safetensors https://civitai.com/api/download/models/292264?token=1e02ca8ab1875d5bff720b78f42e31e6 --content-disposition
#wget -O zy_AmateurStyle_v2.safetensors https://civitai.com/api/download/models/717403?token=1e02ca8ab1875d5bff720b78f42e31e6 --content-disposition
#wget -O models/checkpoints/realvisxlV50_v50LightningBakedvae.safetensors https://civitai.com/api/download/models/798204?token=1e02ca8ab1875d5bff720b78f42e31e6 --content-disposition


# wget https://civitai.com/api/download/models/293331?$CIVITAI_ACCESS_TOKEN --content-disposition
# wget https://civitai.com/api/download/models/293331?token=1e02ca8ab1875d5bff720b78f42e31e6 --content-disposition
#wget --header="Authorization: Bearer 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" -O models/ipadapter/ip-adapter-faceid-plusv2_sdxl.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin
#wget --header="Authorization: Bearer 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" -O models/loras/flux_realism_lora.safetensors https://huggingface.co/comfyanonymous/flux_RealismLora_converted_comfyui/resolve/main/flux_realism_lora.safetensors
#wget --header="Authorization: Bearer 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" -O antelopev2.zip https://huggingface.co/vladmandic/insightface-faceanalysis/resolve/main/antelopev2.zip
#wget --header="Authorization: Bearer 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" -O buffalo_l.zip https://huggingface.co/vladmandic/insightface-faceanalysis/resolve/main/buffalo_l.zip

#wget --header="Authorization: Bearer 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" -O models/controlnet/sdxl/diffusion_pytorch_model_promax.safetensors https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors
#wget --header="Authorization: Bearer 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" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors
#wget --header="Authorization: Bearer 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" -O models/controlnet/flux/flux-union-pro.safetensors https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro/resolve/main/diffusion_pytorch_model.safetensors

echo "Cloning the ComfyUI repository..."
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI

# Install the required Python packages
echo "Installing Python dependencies..."
pip3 install -r requirements.txt


#install custom nodes
echo "Installing ComfyUI Manager..."
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git

git clone https://github.com/XLabs-AI/x-flux-comfyui.git
cd x-flux-comfyui
python3 setup.py

cd ..
cd ..

# Create the necessary directories for the models if they don't exist
mkdir -p models/unet
mkdir -p models/clip
mkdir -p models/clip_vision
mkdir -p models/vae
mkdir -p models/controlnet/flux
mkdir -p models/controlnet/sdxl
mkdir -p models/xlabs/ipadapters
mkdir -p models/ipadapter
mkdir -p models/loras

#download SDXL
wget -O models/checkpoints/wildcardx-xl-turbo.safetensors https://civitai.com/api/download/models/329685?token=$CIVITAI_ACCESS_TOKEN --content-disposition
wget -O models/checkpoints/wildcardxRealistic_wildcardxV2.safetensors https://civitai.com/api/download/models/292264?token=$CIVITAI_ACCESS_TOKEN --content-disposition
wget -O models/checkpoints/ponyRealism_v22MainVAE.safetensors https://civitai.com/api/download/models/914390?token=$CIVITAI_ACCESS_TOKEN --content-disposition
wget -O models/checkpoints/realvisxlV50_v50LightningBakedvae.safetensors https://civitai.com/api/download/models/798204?token=$CIVITAI_ACCESS_TOKEN --content-disposition


# Download the UNET model (flux1-dev.safetensors or flux1-schnell.safetensors)
echo "Downloading UNET model from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/unet/flux1-dev.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors

# Download the CLIP models
echo "Downloading CLIP models from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors

#Download Clip Vision
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip_vision/model.safetensors https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors

#Faceloader
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/model.safetensors
mkdir -p models/insightface/models
cd models/insightface/models
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O antelopev2.zip https://huggingface.co/vladmandic/insightface-faceanalysis/resolve/main/antelopev2.zip
unzip antelopev2.zip
cd ..
cd ..


#Download IPadapters
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/xlabs/ipadapters/flux-ip-adapter.safetensors https://huggingface.co/XLabs-AI/flux-ip-adapter/resolve/main/flux-ip-adapter.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/ipadapter/ip-adapter-faceid-plusv2_sdxl.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin


#Download loras
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/loras/ip-adapter-faceid-plusv2_sdxl_lora.safetensors https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/loras/flux_realism_lora.safetensors https://huggingface.co/comfyanonymous/flux_RealismLora_converted_comfyui/resolve/main/flux_realism_lora.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/loras/flux_turbo_alpha.safetensors https://huggingface.co/alimama-creative/FLUX.1-Turbo-Alpha/resolve/main/diffusion_pytorch_model.safetensors
wget -O models/loras/zy_AmateurStyle_v2.safetensors https://civitai.com/api/download/models/717403?token=$CIVITAI_ACCESS_TOKEN --content-disposition
wget -O models/loras/FLUX_Polyhedron_all_Kohya_ss.safetensors https://civitai.com/api/download/models/812320?token=$CIVITAI_ACCESS_TOKEN --content-disposition


# Download the VAE model
echo "Downloading VAE model from Hugging Face..."
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors

# Download the ControlNet model
echo "Downloading ControlNet model from Hugging Face..."
#wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/controlnet/flux/flux-union.safetensors https://huggingface.co/InstantX/FLUX.1-dev-Controlnet-Union/resolve/832dab0074e8541d4c324619e0e357befba19611/diffusion_pytorch_model.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/controlnet/flux/flux-union-pro.safetensors https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro/resolve/main/diffusion_pytorch_model.safetensors
#wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/controlnet/sdxl/OpenPoseXL2.safetensors https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/OpenPoseXL2.safetensors
wget --header="Authorization: Bearer $HF_ACCESS_TOKEN" -O models/controlnet/sdxl/diffusion_pytorch_model_promax.safetensors https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors






# Extract ClearRealityV1 upscale model from existing zip file
echo "Extracting ClearRealityV1 upscale model..."
mkdir -p ComfyUI/models/upscale_models
unzip ../misc/ClearRealityV1.zip -d models/upscale_models

echo "ComfyUI installation completed."