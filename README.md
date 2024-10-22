# comfy-one-click


ssh -i hyperstack-ssh.pem -L 8188:127.0.0.1:8188 ubuntu@38.80.123.36
ssh -i hyperstack-ssh.pem -L 7860:127.0.0.1:7860 ubuntu@38.80.123.36
ssh -i hyperstack-ssh.pem ubuntu@38.80.123.36

mv clarav2.safetensors ~/comfy-one-click/ComfyUI/models/loras/flux/

git clone https://github.com/Mag90/comfy-one-click.git

cd comfy-one-click

bash ./install.sh


#flux-gym

python3 -m venv env
source env/bin/activate

ssh -i hyperstack-ssh.pem -L 8188:127.0.0.1:8188 -L 7860:127.0.0.1:7860 ubuntu@38.80.123.36

scp ubuntu@38.80.123.36:~/comfy-one-click/ComfyUI/output/final*.png ./

tar -czvf redskirt.tar.gz redskirt/
scp ubuntu@38.80.123.36:~/comfy-one-click/fluxgym/outputs/cccai.tar.gz ./