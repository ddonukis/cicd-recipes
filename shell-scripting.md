## Useful shell commands
```bash
# basic system operations:
pwd # print current working directory
cd path # change working directory
ls # list files
mkdir dirname # create directory
rm filename # remove files(s)/directory
cp source destination # copy file(s)
mv source destination # move (rename) file(s)
man command  # bring up manual entry for command (press Q to exit)
sudo command # run the command as a super user (elevated access permissions), will prompt for password
find path  # find directories/files by type name pattern etc (and optionally run a command on the results)
```

## Text file processing
### `grep`
find lines in file(s) by regular expression
```bash
# print out all lines in rand.txt that begin with a number
grep -E '^\d' data/text/rand.txt
# print the number of lines (-c = count) in rand.txt that begin with a number
grep -c -E '^\d' data/text/rand.txt
# same, but using wc
grep -E '^\d' data/text/rand.txt | wc -l
```

### Chaining multiple commands
```bash
# print out function definitons from all python files, prefixed with filename and line number
find . -type f -name '*.py' | xargs grep -H -n -E '^\s*def '
```
