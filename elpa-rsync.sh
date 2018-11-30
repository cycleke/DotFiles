#!/bin/env bash

rsync -vai4CH --safe-links --numeric-ids --delete --delete-delay --delay-updates \
  rsync://mirrors.tuna.tsinghua.edu.cn/elpa/ \
  ~/elpa-mirror
