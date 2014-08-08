#!/bin/bash

cd ../../bin/

for i in 1 2
do
    echo "$i times between omcq(e) Max - Minimax"
    scala application.Main quoridor mcts minimax 0 0 omcq minimax e e max max 30 /home/qha/tmp/quoridor/set6/
done

for i in 1 2
do
    echo "$i times between Minimax - omcq(e) Max"
    scala application.Main quoridor minimax mcts 0 0 minimax omcq e e max max 30 /home/qha/tmp/quoridor/set6/
done