#!/bin/bash
service ssh start
echo | su -c "ssh -o StrictHostKeyChecking=no localhost &" hadoop
su - hadoop
