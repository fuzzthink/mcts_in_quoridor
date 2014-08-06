#!/bin/bash

cd ../../bin/

for i in 1 2
do
    echo "$i times between pbbmq(e) RobustMax - Minimax"
    scala application.Main quoridor mcts minimax 0 0 pbbmq pbbmq e e robustmax robustmax 300 /home/qha/tmp/quoridor/set6/
done

for i in 1 2
do
    echo "$i times between Minimax - pbbmq(e) RobustMax"
    scala application.Main quoridor minimax mcts 0 0 pbbmq pbbmq e e robustmax robustmax 300 /home/qha/tmp/quoridor/set6/
done