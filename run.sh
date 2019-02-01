#!/bin/bash

(cd profiler && ./build.sh)
dotnet test xunit

COUNTER=0
DOTNET_PATH=$(dotnet --info | grep -m1 "Base Path"  | grep -P "/.*" -o)

while  [  $COUNTER -lt 1000 ]; do
   CORECLR_ENABLE_PROFILING=1 CORECLR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916dd} CORECLR_PROFILER_PATH_64="$PWD/profiler/CorProfiler.so" dotnet exec "${DOTNET_PATH}vstest.console.dll" --framework:.NETCoreApp,Version=v2.0 "$PWD/xunit/bin/Debug/netcoreapp2.0/ilrewriterTest.dll"

   result=$?
   if [ $result -ne 0 ]
   then 
     echo "Bad result: $result"
     exit
   fi
   let COUNTER=COUNTER+1 
done