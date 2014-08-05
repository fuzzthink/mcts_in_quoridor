#!/bin/bash

cd ../../bin/

for i in 1 2 3 4 5
do
    echo "$i times between Best Old 1(omc) - Best Enhanced 1(omcq)"
    scala application.Main quoridor 0 0 omc omcq e e max max 20 /home/qha/tmp/quoridor/set4/
done

for i in 1 2 3 4 5
do
    echo "$i times between Best Enhanced 1(omcq) - Best Old 1(omc)"
    scala application.Main quoridor 0 0 omcq omc e e max max 20 /home/qha/tmp/quoridor/set4/
done