#!/bin/bash

SUBNET="192.168.1.0/24"

sudo nmap -sn -PR -R "$SUBNET" | awk '
function print_line() {
  for(i=1; i<=4; i++) {
    printf "+"
    for(j=1; j<=max_len[i]+2; j++) printf "-"
  }
  print "+"
}

BEGIN {
  headers[1] = "hostname"
  headers[2] = "IP"
  headers[3] = "Tipo Chipset"
  headers[4] = "MAC"

  for(i=1; i<=4; i++) max_len[i] = length(headers[i])
}

/Nmap scan report for/ {
  ip = ""
  hostname = "Unknown"

  if ($0 ~ /\(([^)]+)\)/) {
    match($0, /\(([^)]+)\)/, arr)
    ip = arr[1]
    hostname = $5
  } else {
    ip = $5
  }

  if (hostname == ip || hostname == "") {
    hostname = "Unknown"
  }

  current_ip = ip
  current_hostname = hostname
}

/MAC Address:/ {
  mac = $3
  vendor = ""
  for(i=4; i<=NF; i++) vendor = vendor $i " "
  sub(/[[:space:]]+$/, "", vendor)
  if (vendor == "") vendor = "Unknown"

  data[++count, "hostname"] = current_hostname
  data[count, "ip"] = current_ip
  data[count, "vendor"] = vendor
  data[count, "mac"] = mac

  if(length(current_hostname) > max_len[1]) max_len[1] = length(current_hostname)
  if(length(current_ip) > max_len[2]) max_len[2] = length(current_ip)
  if(length(vendor) > max_len[3]) max_len[3] = length(vendor)
  if(length(mac) > max_len[4]) max_len[4] = length(mac)
}

END {
  print_line()
  printf "| %-*s | %-*s | %-*s | %-*s |\n", max_len[1], headers[1], max_len[2], headers[2], max_len[3], headers[3], max_len[4], headers[4]
  print_line()
  for(i=1; i<=count; i++) {
    printf "| %-*s | %-*s | %-*s | %-*s |\n", max_len[1], data[i, "hostname"], max_len[2], data[i, "ip"], max_len[3], data[i, "vendor"], max_len[4], data[i, "mac"]
  }
  print_line()
}
'
