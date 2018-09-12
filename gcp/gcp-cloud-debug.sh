#!/bin/bash

# SCRIPT STATUS: IN THE WORKS. Results obtained after running twice on Sep 12, 2018.
# This script, written by WilsonMar@gmail.com, is intended to be run by you after you
# This script performs the commands described in the "Getting Started with Cloud KMS" (GSP079) hands-on lab at
#    https://google.qwiklabs.com/focuses/1713?parent=catalog
# Copy the Account from the Qwiklabs page.
# Click "Open Google Console".
# Sign Out and Use Another Account. Clear out your own account name and paste the Account from Qwiklabs page.
# Copy and Paste Account and Password from the Qwiklabs page. Click Next.
# Flip back to the Qwiklabs page to copy the Password to your Clipboard.
# Flip back to the Console and paste it. Click "Accept".
# Click "Done" at "Protect your account".
# Click "Yes" twice to Accept. 
# Click the icon for the Cloud Shell and START CLOUD SHELL.
# Copy the command below (without the #) 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/DevSecOps/master/gcp/gcp-cloud-debug.sh)"
# Click the Google Cloud console and press command+V to paste.

# CURRENT STATUS: NOT WORKING. This error message appears:
# sh: 27: Syntax error: "(" unexpected

# which is part of quest ???
# Comments under each command provide the RESPONSE returned when I ran it.

### Define utility functions:
function echo_f() {
   local fmt="$1"; shift
   # shellcheck disable=SC2059
   printf "\\n>>> $fmt\\n" "$@"
}
function echo_c() {
  local fmt="$1"; shift
  printf "\\n  $ $fmt\\n" "$@"
}
function echo_r() {
  local fmt="$1"; shift
   # shellcheck disable=SC2059
   printf "$fmt\\n" "$@"
}
command_exists() {
  command -v "$@" > /dev/null 2>&1
}

TIME_START="$( date -u +%s )"
   # 1536771542
FREE_DISKBLOCKS_START="$( df | sed -n -e '2{p;q}' | cut -d' ' -f 6 )"
LOG_PREFIX=$(date +%Y-%m-%dT%H:%M:%S%z)-$( ( 1 + RANDOM % 1000 ) )
   # ISO-8601 date plus RANDOM=$((1 + RANDOM % 1000))  # 3 digit random number.
   #  LOGFILE="$0.$LOG_PREFIX.log"
echo_f "$0 starting at $LOG_PREFIX ..."

uname -a
   # RESPONSE: Linux cs-6000-devshell-vm-e3b7d016-01c1-493c-948c-f9eaac3e163b 4.14.33+ #1 SMP Sat Aug 11 08:05:16 PDT 2018 x86_64 GNU/Linux
