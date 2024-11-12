#!/bin/bash

# Define the absolute path to your SSH key
SSH_KEY_PATH=""
# Define username
username=""
# Define the output file for aliases
ALIAS_FILE="$HOME/azure_vm_aliases"

# you need to login into your azure account before running this script 
# az login

# Fetch all VM names and IP addresses
vms=$(az vm list-ip-addresses --query "[].{vm_name:virtualMachine.name, vm_ip:virtualMachine.network.privateIpAddresses[0]}" -o table)
# Clear the alias file
echo "# Azure VM Aliases" > "$ALIAS_FILE"

# Loop through the VMs and create aliases
while read -r vm_name vm_ip; do
    echo "alias $vm_name='ssh -i $SSH_KEY_PATH $username@$vm_ip'" >> "$ALIAS_FILE"
done <<< "$vms"

# Append the alias file to the shell profile (e.g., .bash_profile or .zshrc) if not already added
PROFILE_FILE="$HOME/.zshrc" 

if ! grep -q "$ALIAS_FILE" "$PROFILE_FILE"; then
    echo "source $ALIAS_FILE" >> "$PROFILE_FILE"
fi

# Reload the shell profile to apply the changes
source "$PROFILE_FILE"

echo "Aliases have been created and applied!"

