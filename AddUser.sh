#!/bin/bash
username="<%=customOptions.username%>"
pass="<%=customOptions.password%>"
useradd -m -p "$pass" "$username"
