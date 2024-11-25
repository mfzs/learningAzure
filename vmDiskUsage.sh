#!/bin/bash
set +e
# Disk usage threshold
THRESHOLD=80

# SSH private key file
PRIVATE_KEY=""

# SSH user
SSH_USER=""

# Temporary file to store alerts
ALERT_FILE="/tmp/disk_usage_alerts.txt"
VM_LIST="/tmp/vmlist.txt"
CLEAN_VM_LIST="/tmp/cleanvmlist.txt"

# Fetch VM names and private IPs
echo "Fetching VM names and private IPs..."
az vm list-ip-addresses --query "[].{vm_name:virtualMachine.name, vm_ip:virtualMachine.network.privateIpAddresses[0]}" -o table > "$VM_LIST"

# Clean up the list by removing leading/trailing spaces and extra spaces between columns
gsed 's/^[ \t]*//;s/[ \t]*$//;s/[ \t]\{1,\}/ /g' "$VM_LIST" > "$CLEAN_VM_LIST"
# Remove header (first two lines) and ensure only valid VM data remains
gsed '1,2d' "$CLEAN_VM_LIST" > "$VM_LIST"


# Clear the alert file
> "$ALERT_FILE"
# Temporary file to log results
RESULTS_FILE="/tmp/vm_results.log"
ERROR_FILE="/tmp/vm_errors.log"

# Clear previous results and errors
> "$RESULTS_FILE"
> "$ERROR_FILE"


# Read VM list into an array
IFS=$'\n' read -d '' -r -a VM_ARRAY < "$VM_LIST"

# Loop through each line in the VM list
for LINE in "${VM_ARRAY[@]}"; do
  # Split the line into VM_NAME and VM_IP
  VM_NAME=$(echo "$LINE" | awk '{print $1}')
  VM_IP=$(echo "$LINE" | awk '{print $2}')

  # Skip empty lines
  if [[ -z "$VM_NAME" || -z "$VM_IP" ]]; then
    continue
  fi

  echo "Processing $VM_NAME ($VM_IP)..."

  # Execute the command via SSH
  USAGE=$(ssh -i "$PRIVATE_KEY" -o StrictHostKeyChecking=no -o ConnectTimeout=5 "$SSH_USER@$VM_IP" \
    "df -h --output=pcent / | tail -1 | tr -dc '0-9'" 2>>"$ERROR_FILE")

    # Check disk usage and log result
    if [[ $USAGE -ge $THRESHOLD ]]; then
      echo "ALERT: $VM_NAME ($VM_IP) has disk usage at $USAGE%." >> "$RESULTS_FILE"
    else
      echo "OK: $VM_NAME ($VM_IP) has disk usage at $USAGE%." 
    fi
done

# Display results after processing all VMs
echo "Disk Usage Report:"
cat "$RESULTS_FILE"



