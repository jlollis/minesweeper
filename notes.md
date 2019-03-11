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

***WORK IN PROGRESS***

TO DO: 
- [x] Accepts input from user (row, colum, (x)-uncover or (f)-flag) If x, and if bomb present, game over, if not, mark square. If f, flag square and decrement total flags by one, when flags are exhausted only allows user to uncover squares.
- [x] Animated header graphic (similar to the Windows XP classic version)
- [ ] Inspect adjacent squares, if none of these have a bomb, they are revealed. If any of the neighbors have no adjacent bombs, they too are revealed, and so on. The "fringe" of the revealed area is squares all adjacent to a bomb (or corner). The fringe should be revealed and contain the count of adjacent bombs.
