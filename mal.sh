#!/bin/bash

# Variables
FLAG_FILE="flag.txt"
ENCRYPTED_FILE="flag.enc"
README_FILE="readme.txt"
KEY="flagistoocomplexforyousohereisabigkey"

# Step 1: Check if the flag file exists
if [ ! -f "$FLAG_FILE" ]; then
    echo "Flag file not found!"
    exit 1
fi

# Step 2: Encrypt the flag file (simple base64 encoding with a key)
openssl enc -aes-256-cbc -salt -in "$FLAG_FILE" -out "$ENCRYPTED_FILE" -pass pass:$KEY

# Step 3: Remove the original flag file
rm "$FLAG_FILE"

# Step 4: Create a ransom note
cat <<EOT >> "$README_FILE"
Your flag has been encrypted!
To decrypt it, you must provide the key.
The encrypted file is: $ENCRYPTED_FILE
Good luck finding the key!
EOT

# Step 5: Delete the ransomware script (self-delete)
rm -- "$0"
