#!/bin/bash
wg-quick up wg0
nohub revel run /Web_Wireguard_config > wgweboutput 2>&1 &
sleep infinity