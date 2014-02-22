from math import *
import random
from quoridor import *
import copy
import threading
from time import *
from node import Node
from utils import *

def MCTS(rootstate, itermax, step, time_left):
    rootnode = Node(state = rootstate)
    rootboard, rootplayer = rootstate

    counter = 0

    for i in range(itermax):
        node = rootnode
        state = copy.deepcopy(rootstate)
        board, player = state

        print("=======================")
        print(counter, " - Iteration")
        counter += 1

        # Selection
        while node.untriedMoves == [] and node.childNodes != []: # node is fully expanded and non-terminal
            print("1. SELECTION")
            node = node.UCT()
            print("Move:", node.move)
            board = node.board
            player = node.player

        # Expansion
        if node.untriedMoves is not []: # if we can expand (i.e. state/node is non-terminal)
            print("2. EXPANSION")
            m = random.choice(node.untriedMoves)
            state = (node.board.clone().play_action(m, node.player), (node.player+1)%2)
            node = node.AddChild(m, state, step, time_left) # add child and descend tree
            # update player and board
            board = node.board
            player = node.player

        # Rollout - Simulation
        rollplayer = copy.deepcopy(player)
        rollboard = copy.deepcopy(board)
        rollmove = node.move
        keepalive = 0
        print("3. ROLLOUT - SIMULATION...", rollplayer)
        while rollboard.is_finished() is False: # while state is non-terminal
            rollmove = random.choice(get_advanced_moves(rollboard, rollplayer))
            rollboard.play_action(rollmove, rollplayer)
            rollplayer = (rollplayer + 1) % 2
            # keepalive
            keepalive +=1
            print("Still running...", keepalive)

        # Backpropagate
        while node != None: # backpropagate from the expanded node and work back to the root node
            print("4. BACKPROPAGATE for:", rootplayer)
            if rollboard.is_playerwin(rootplayer) is True:
                node.Update(1) # state is terminal. Update node with result from POV of node.playerJustMoved
            if rollboard.is_playerwin((rootplayer+1)%2) is True:
                node.Update(0)
            node = node.parentNode

    # test
    print("Results:")
    for item in rootnode.childNodes:
        print("Node action:", item.move)
        print("Node score:", item.visits, item.wins)

    return sorted(rootnode.childNodes, key = lambda c: c.visits)[-1].move # return the move that was most visited

def search(state, step, time_left):
    # step pre-process
    if (step <= 10):
        itermax = 100
    else:
        itermax = 1000

    print("START MCTS! Step:", step)
    start = clock()
    move = MCTS(rootstate=state, itermax=itermax, step=step, time_left=time_left)
    board, player = state
    print(get_advanced_moves(board, player))
    print("NEXT MOVE IS:")
    print(move)
    end = clock() - start
    print("THINKING TIME: ", end)
    return move
