#!/bin/bash
set -e

echo
echo '#'
echo '# This System Report was generated by: https://github.com/bitrise-docker/bitrise-base/blob/master/system_report.sh'
echo '#  Pull Requests are welcome!'
echo '#'
echo

echo
echo "=== Revision / ID ======================"
echo "* BITRISE_DOCKER_REV_NUMBER_BASE: $BITRISE_DOCKER_REV_NUMBER_BASE"
echo "========================================"
echo

# Make sure that the reported version is only
#  a single line!
echo
echo "=== Pre-installed tool versions ========"

ver_line="$(go version)" ;                        echo "* Go: $ver_line"
ver_line="$(ruby --version)" ;                    echo "* Ruby: $ver_line"
ver_line="$(bundle --version)" ;                  echo "  * bundler: $ver_line"
ver_line="$(python --version 2>&1 >/dev/null)" ;  echo "* Python: $ver_line"

echo
ver_line="$(git --version)" ;                     echo "* git: $ver_line"
ver_line="$(git lfs version)" ;                   echo "* git lfs: $ver_line"
ver_line="$(hg --version | grep version)" ;       echo "* mercurial/hg: $ver_line"
ver_line="$(curl --version | grep curl)" ;        echo "* curl: $ver_line"
ver_line="$(wget --version | grep 'GNU Wget')" ;  echo "* wget: $ver_line"
ver_line="$(rsync --version | grep version)" ;    echo "* rsync: $ver_line"
ver_line="$(unzip -v | head -n 1)" ;              echo "* unzip: $ver_line"
ver_line="$(zip -v | head -n 2 | tail -n 1)";     echo "* zip: $ver_line"
ver_line="$(tar --version | head -n 1)" ;         echo "* tar: $ver_line"
ver_line="$(tree --version)" ;                    echo "* tree: $ver_line"

echo
ver_line="$(sudo --version 2>&1 | grep 'Sudo version')" ; echo "* sudo: $ver_line"

echo
ver_line="$(docker --version)" ;                  echo "* docker: $ver_line"
ver_line="$(docker-compose --version)" ;          echo "* docker-compose: $ver_line"

echo
echo "--- Bitrise CLI tool versions"
ver_line="$(bitrise --version)" ;                 echo "* bitrise: $ver_line"
ver_line="$(stepman --version)" ;                 echo "* stepman: $ver_line"
ver_line="$(envman --version)" ;                  echo "* envman: $ver_line"
echo "========================================"
echo

echo
echo "=== Linux info ========================="
echo "* uname -a"
uname -a
echo "* uname -r"
uname -r
echo "* lsb_release --all"
lsb_release --all
echo "========================================"
echo

echo
echo "=== Docker info ========================"
docker info
echo "========================================"
echo

echo
echo "=== System infos ======================="
info_line="$( df -kh / | grep '/' )" ;            echo "* Free disk space: $info_line"
echo "* Free RAM & swap:"
free -mh
echo "========================================"
echo
