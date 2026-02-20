#!/usr/bin/env bash
countryfeed=("DE" "GR" "GB" "BE" "FR" "TR" "NO" "AT" "RO" "CZ" "SE" "NL" "FI" "SK" "UA" "ES" "MK" "IT" "CH" "PL" "BG" "LV" "DK")

for feed in "${countryfeed[@]}"; do
  curl -fsSL 'https://mirrors.rockylinux.org/mirrorlist?arch=x86_64&repo=BaseOS-10&country='$feed | awk -F/ '/:\/\//{print $3}' | sed 's/:.*//' | sort -u > feed/BaseOS/$feed
done

