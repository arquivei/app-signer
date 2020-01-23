#!/bin/bash

FILENAME=$1

if [ -z "$CERT_PASSWORD" ]; then
  echo "Certificate password variable is unset!"
  exit 1;
fi

if [ -z "$FILENAME" ]; then
  echo "Filename variable is unset!"
  exit 1;
fi

if [ -z "$CERT_FILE" ]; then
  echo "Certificate file variable is unset!"
  exit 1;
fi

echo "$CERT_FILE" | base64 --decode > codesign.pfx

osslsigncode sign -pkcs12 codesign.pfx -pass $CERT_PASSWORD -n "Arquivei Servicos OnLine" -i 'https://arquivei.com.br' -in $FILENAME -out signed-$FILENAME -t http://tsa.starfieldtech.com/