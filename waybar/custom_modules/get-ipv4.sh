#!/bin/bash
ip -4 -o addr show $(ip route get 1 | awk '{print $5}') | awk '{print $4}' | cut -d/ -f1
