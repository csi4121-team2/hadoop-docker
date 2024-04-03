#!/bin/bash
service ssh start
su -c "ssh -o StrictHostKeyChecking=no localhost &" hadoop > /dev/null 2>&1
su - hadoop
bash
