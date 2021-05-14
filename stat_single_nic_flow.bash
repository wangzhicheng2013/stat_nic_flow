#!/bin/bash
ETH=eth3
echo ===NIC FLOW STAT NOW===
sleep 1
echo loading...
sleep 1
  
while true
do
  current_flow=$(cat /proc/net/dev | grep $ETH | sed 's/:/ /g' | awk '{print $2}')
  sleep 1
  next_flow=$(cat /proc/net/dev | grep $ETH | sed 's/:/ /g' | awk '{print $2}')
  
  clear
  echo -e "\t\t\t  RX \t\t  TIME"
  
  total_flow=$((next_flow-current_flow))
  
  
  if [ $total_flow -lt 1024 ];then
    total_flow="${total_flow}B/s"
  elif [ $total_flow -gt 1048576 ];then
    total_flow=$(echo $total_flow | awk '{print $1/1048576 "MB/s"}')
  else
    total_flow=$(echo $total_flow | awk '{print $1/1024 "KB/s"}')
  fi
  
  
  echo -e "\t\t$ETH \t $total_flow    \t`date +%k:%M:%S` "
  
done
