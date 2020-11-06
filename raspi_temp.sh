#!/bin/bash

TEMP=`vcgencmd measure_temp`
echo ${TEMP:5}
