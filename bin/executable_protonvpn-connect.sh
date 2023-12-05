#!/bin/bash

VPN_CMD=/usr/bin/protonvpn-cli
if command -v $VPN_CMD &>/dev/null; then
    # $VPN_CMD ks --off && $VPN_CMD c -f && protonvpn &
    $VPN_CMD ks --off && $VPN_CMD c -f &
fi
