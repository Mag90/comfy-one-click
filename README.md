# comfy-one-click


ssh -i hyperstack-ssh.pem -L 8188:127.0.0.1:8188 ubuntu@38.80.122.223

git clone https://github.com/Mag90/comfy-one-click.git

cd comfy-one-click

bash ./install.sh


python3 -m venv env
source env/bin/activate

ssh -i hyperstack-ssh.pem -L 8188:127.0.0.1:8188 -L 7860:127.0.0.1:7860 ubuntu@38.80.122.223
