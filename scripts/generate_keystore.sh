#!/bin/bash

# Create android/app directory if it doesn't exist
mkdir -p android/app

KEYSTORE="android/app/keystore.jks"
KEYSTORE_TYPE="JKS"
ALGORITHM="RSA"
KEY_SIZE="2048"
VALIDITY="10000"
ALIAS="release"

keytool -genkey -v \
  -keystore "$KEYSTORE" \
  -storetype "$KEYSTORE_TYPE" \
  -keyalg "$ALGORITHM" \
  -keysize "$KEY_SIZE" \
  -validity "$VALIDITY" \
  -alias "$ALIAS"

echo "Keystore generated: $KEYSTORE"