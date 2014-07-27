#!/bin/bash
for i in {1..5}
do
    echo "$i times between omcq(a) - omcq(e)"
    cd ../bin/ && scala application.Main quoridor 0 0 omcq omcq a e max max 20 /home/qha/tmp/quoridor/set2/
done

for i in {1..5}
do
    echo "$i times between omcq(e) - omcq(a)"
    cd ../bin/ && scala application.Main quoridor 0 0 omcq omcq e a max max 20 /home/qha/tmp/quoridor/set2/
done

for i in {1..5}
do
    echo "$i times between pbbmq(a) - pbbmq(e)"
    cd ../bin/ && scala application.Main quoridor 0 0 pbbmq pbbmq a e robustmax robustmax 20 /home/qha/tmp/quoridor/set2/
done

for i in {1..5}
do
    echo "$i times between pbbmq(e) - pbbmq(a)"
    cd ../bin/ && scala application.Main quoridor 0 0 pbbmq pbbmq e a robustmax robustmax 20 /home/qha/tmp/quoridor/set2/
done

for i in {1..5}
do
    echo "$i times between uctq(a) - uctq(e)"
    cd ../bin/ && scala application.Main quoridor 0 0 uctq uctq a e robust robust 20 /home/qha/tmp/quoridor/set2/
done

for i in {1..5}
do
    echo "$i times between uctq(e) - uctq(a)"
    cd ../bin/ && scala application.Main quoridor 0 0 uctq uctq e a robust robust 20 /home/qha/tmp/quoridor/set2/
done