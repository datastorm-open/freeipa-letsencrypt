#!/usr/bin/bash
set -o nounset -o errexit

WORKDIR="/root/ipa-le"

dnf install letsencrypt -y

ipa-cacert-manage install "$WORKDIR/ca/isrgrootx1.pem" -n ISRGRootCAX1 -t C,,
ipa-certupdate -v

ipa-cacert-manage install "$WORKDIR/ca/lets-encrypt-r3.pem" -n ISRGRootCAR3 -t C,,
ipa-certupdate -v


"$(dirname "$0")/renew-le.sh" "--first-time"
