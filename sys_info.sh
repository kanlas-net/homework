#!/bin/bash
if [[ "$1" == "CPU" || "$1" == "ALL" ]]; then
model=$(cat /proc/cpuinfo | grep "model name" | cut -d ':' -f 2 | head -n 1)
cores=$(cat /proc/cpuinfo | grep "cpu cores" | cut -d ':' -f 2 | head -n 1)
freq=$(cat /proc/cpuinfo | grep "cpu MHz" | cut -d ':' -f 2 | head -n 1)
processors=$(cat /proc/cpuinfo | grep "processor" | wc -l)
echo "
+---------------------------------------------+
|                 CPU INFO
+---------------------------------------------+
| MODEL          $model
+---------------------------------------------+
| CORES          $cores
+---------------------------------------------+
| FREQUENCY      $freq MHz
+---------------------------------------------+
| PROCESSORS      $processors
+---------------------------------------------+
" | tee -a log.txt
fi

if [[ "$1" == "MEM" || "$1" == "ALL" ]]; then
mem_total="$(($(cat /proc/meminfo | grep MemTotal | cut -d ':' -f 2 | tr -d 'kB') / 1024)) MB"
mem_free="$(($(cat /proc/meminfo | grep MemFree | cut -d ':' -f 2 | tr -d 'kB') / 1024)) MB"
swap_total="$(($(cat /proc/meminfo | grep SwapTotal | cut -d ':' -f 2 | tr -d 'kB') / 1024)) MB"
swap_free="$(($(cat /proc/meminfo | grep SwapFree | cut -d ':' -f 2 | tr -d 'kB') / 1024)) MB"
echo "
+---------------------------------------------+
|                 MEMORY INFO
+------+--------------------------------------+
|      | TOTAL    $mem_total
| RAM  +--------------------------------------+
|      | FREE     $mem_free
+------+--------------------------------------+
|      | TOTAL    $swap_total
| SWAP +--------------------------------------+
|      | FREE     $swap_free
+------+--------------------------------------+
" | tee -a log.txt
fi

if [[ "$1" == "RELEASE" || "$1" == "ALL" ]]; then
echo "
+---------------------------------------------+
|                 RELEASE INFO
+---------------------------------------------+
$(cat /etc/*release)
+---------------------------------------------+
" | tee -a log.txt
fi
