# minesweeper

To create a remote github repository from the command line, follow these steps:
```
mkdir minesweeper
git init
touch README.md
nano README.md
```

Type something in README file, it can't be empty

```
git init
curl -u 'jlollis' https://api.github.com/user/repos -d '{"name":"minesweeper"}'
git remote add origin git@github.com:jlollis/minesweeper.git
git remote -v
git add .
git commit -m "first commit"
git push origin master
```
