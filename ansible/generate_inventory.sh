#!/bin/bash

VM_IP=$(cd ../terraform && terraform output -raw web_public_ip)

cat > inventory.ini <<EOF
[web]
sweb-vm ansible_host=${VM_IP} ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

echo "Generated inventory:"
cat inventory.ini