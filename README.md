# :sunglasses: minesweeper

#### How to Play:
1. Open your terminal and type:
```
ruby minesweeper.rb
```
2. You will see a grid of squares. Some squares have bombs, but others are clear. The object of the game is to clear the board without uncovering a bomb.

3. Choose a square by entering its row and column. If you click on a square containing a bomb, you lose. 

4. If you manage to click all the squares, without clicking on any bombs, you win the game.

5. When you have chosen a square, you will be asked if you would like to open the space or to flag it if you think it contains a bomb. Enter 'x' to open the space, or 'f' to flag it. 

7. You are only allowed 10 flags, use them wisely.

#

***WORK IN PROGRESS***

TO DO: 
- [x] Accepts input from user (row, colum, (x)-uncover or (f)-flag) If x, and if bomb present, game over, if not, mark square. If f, flag square and decrement total flags by one, when flags are exhausted only allows user to uncover squares.
- [x] Animated header graphic (similar to the Windows XP classic version)
- [ ] Inspect adjacent squares, if none of these have a bomb, they are revealed. If any of the neighbors have no adjacent bombs, they too are revealed, and so on. The "fringe" of the revealed area is squares all adjacent to a bomb (or corner). The fringe should be revealed and contain the count of adjacent bombs.