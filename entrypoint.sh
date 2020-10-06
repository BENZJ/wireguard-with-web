#!/bin/bash
wg-quick up wg0
revel run /Web_Wireguard_config > wgweboutput 2>&1 & 