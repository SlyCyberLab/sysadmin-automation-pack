#!/bin/bash

# Create a secure admin user

useradd secureops
passwd secureops


# Set strong permissions on home dir
chmod 700 /home/secureops


# Lock down unused acounts
for acc in games nobody lp; do
        usermod -L $acct 2>/dev/null
        echo "Locked account: $acct"
done

echo "User baseline security applied."
