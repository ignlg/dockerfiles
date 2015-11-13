#!/bin/sh

# Default communication port
sh /update_or_add.sh 'ORPort' '9001' "$PORT"
# Disable Socks connections
sh /update_or_add.sh 'SocksPort' '0' "$SOCKS_PORT"
# Set node nickname
sh /update_or_add.sh 'Nickname' 'hacktheplanet' "$NICKNAME"
# Set contact info
sh /update_or_add.sh 'ContactInfo' 'Anonymous' "$CONTACT_INFO"
# Start the count
sh /update_or_add.sh 'AccountingStart' 'month 1 00:01' "$ACCOUNTING_START"
# Set monthly bandwidth limit
sh /update_or_add.sh 'AccountingMax' '100 GBytes' "$ACCOUNTING_MAX"
# Throttle traffic
sh /update_or_add.sh 'RelayBandwidthRate' "$BANDWIDTH_RATE"
# Allow bursts
sh /update_or_add.sh 'RelayBandwidthBurst' "$BANDWIDTH_BURST"
# Change advertised bandwidth
sh /update_or_add.sh 'MaxAdvertisedBandwidth' "$ADVERTISED_BANDWIDTH"
# Mirror directory information for others
sh /update_or_add.sh 'DirPort' "$DIR_PORT"
# Bridge relay
if [ -z "$BRIDGE_RELAY" ] || [ "$BRIDGE_RELAY" -eq "0" ]; then
  # Reject all exits. Only relay.
  sh /update_or_add.sh 'Exitpolicy' 'reject *:*' "$EXIT_POLICY"
else
  sh /update_or_add.sh 'BridgeRelay' '1' "$BRIDGE_RELAY"
fi
# Private bridge
sh /update_or_add.sh 'PublishServerDescriptor' "$PUBLISH_SERVER_DESCRIPTOR"
