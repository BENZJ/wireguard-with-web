#!/bin/bash
nohup revel run /Web_Wireguard_config > wgweboutput 2>&1 & 
wg-quick up wg0
/bin/bash