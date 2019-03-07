# :sunglasses: minesweeper

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
