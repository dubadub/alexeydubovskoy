#!/usr/bin/env bash

rsync -av --delete --exclude=".git" ./ alexey@192.168.1.2:~/alexeydubovskoy

ssh alexey@192.168.1.2 -t "sudo nixos-rebuild switch"
