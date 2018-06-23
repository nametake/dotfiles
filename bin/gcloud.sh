#!/bin/bash
if [ -z ${GOOGLE_CLOUD_SDK} ]; then
  echo "GOOGLE_CLOUD_SDK env does not exists"
  exit 1
fi

curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=${HOME}/.local/share/
${GOOGLE_CLOUD_SDK}/bin/gcloud components install app-engine-go -q
chmod +x ${GOAPP}/goapp
