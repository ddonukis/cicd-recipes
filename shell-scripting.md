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

## Bash arg quoting
```bash
alias argprinter='python data/functions/arg_printer/main.py'
argprinter hello $WHO
```
```
Recieved args: ['hello', 'cognite']
```
```bash
argprinter "hello $WHO"
```
```
Recieved args: ['hello cognite']
```
```bash
argprinter 'hello $WHO'
```
```
Recieved args: ['hello $WHO']
```
You should always use double qoutes around variables:
```bash
alias ap='python data/functions/arg_printer/main.py'
ap a
```
```
Recieved args: ['a']
```
```bash
myvar='a b c'
ap $myvar
```
```
Recieved args: ['a', 'b', 'c']
```
```bash
ap "$myvar"
```
> ```
> Recieved args: ['a b c']
> ```


## Text file processing
### `wc`
Count words, lines, characters.
```bash
# count lines
wc -l data/text/rand.txt
wc -l < data/text/rand.txt
cat data/text/rand.txt | wc -l
# count charcters
wc -c < data/text/rand.txt
# count words
wc -w < data/text/rand.txt
```

### `head`, `tail`
Print the first N lines or last N lines of a file.
```bash
# first 10 (default) lines
head < data/text/rand.txt
# first 5 lines
head -5 < data/text/rand.txt
head -n 5 < data/text/rand.txt
# last line
tail -1 < data/text/rand.txt
```

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

# print filenames of python modules that import sys
# -l = print filenames of files that have matches
find . -type f -name '*.py' | xargs grep -E -l '^import sys'
```
