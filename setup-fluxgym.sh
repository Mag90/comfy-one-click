
sudo apt install python3.10-venv


git clone https://github.com/cocktailpeanut/fluxgym
cd fluxgym
git clone -b sd3 https://github.com/kohya-ss/sd-scripts

python3 -m venv env
source env/bin/activate

cd sd-scripts
pip install -r requirements.txt

cd ..

pip install -r requirements.txt