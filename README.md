# :sunglasses: minesweeper

#### How to Play:
1. Open your terminal and type:
```
ruby minesweeper.rb
```
2. You will see a grid of squares. Some squares have bombs, but others are clear. The object of the game is to clear the board without uncovering a bomb.

3. Choose a square by entering its row and column. If you click on a square containing a bomb, you lose. 

4. If you manage to click all the squares, without clicking on any bombs, you win the game.

5. Clicking a square that is empty reveals a value that indicates the number of neighboring squares that contain bombs. You can use this to help you guess which of the remaining squares have bombs, and which are clear.

6. When you have chosen a square, you will be asked if you would like to open the space or to flag it for the bomb squad. Enter 'X' to open the space, or 'f' to flag it. 

#### Github notes:
To create a remote github repository from your desktop, do the following:
1. `mkdir repository_name`
2. `cd repository_name`
3. `touch README.md`
4. open README.md:
   `nano README.md`
5.  add `# repository_name` on first line and save, it just the can't be empty 
6.  `git init`
7.  `git add .`
8.  `git commit -m "your message"`
9.  Use github API to create remote:
   `curl -u 'USER' https://api.github.com/user/repos -d '{"name":"REPO"}'`
   (replace USER with your username and REPO with your repository/application name)
10. `git remote add origin git@github.com:USER/REPO.git`
11. `git remote -v`
    (verifies remote)
7. git push origin master
