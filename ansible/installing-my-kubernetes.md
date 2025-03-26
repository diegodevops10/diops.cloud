# Kubernetes Installation

```bash
# Activate the python venv

python3 -m venv venv
source venv/bin/activate

git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
git checkout release-2.25


# Only in the first installation:

# Install python dependecies
pip install -r requirements.txt

mkdir -p ../inventory/myhomelabcluster
cp -rfp inventory/sample ../inventory/myhomelabcluster

declare -a IPS=(192.168.15.154 192.168.15.155 192.168.15.156 192.168.15.157 192.168.15.158 192.168.15.159 192.168.15.160 192.168.15.161)
CONFIG_FILE=../myhomelabcluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

ansible-playbook -i ../myhomelabcluster/hosts.yaml -u ubuntu -b -v --private-key=~/.ssh/id_rsa cluster.yml
```
