# Anatomy of a shell command

* stdin - standard input (file-like), file descriptor 0
* stdout - standard output (file-like), file descriptor 1
* stderr - standard error (file-like), file descriptor 2

```bash
command1 > file  # redirect stdout to file (overwrite)
command1 1> file # redirect stdout to file (same as > file, because stdout is at file desciptor 1)
command1 2> file # redirect stderr to file (stderr is fd 2)
command1 >> file # redirect stdout to file (append)
command1 > /dev/null # discard stdout data (/dev/null is a null device that discards any data that is written to it)
command1 < file  # redirect file to stdin
command1 | command2  # connect command1 stdout to command2 stdin
command1 |& command2 # connect command1 stdout and stderr to command2 stdin
```

## Command returns a status code
* `0` (zero) means success
* non-zero is a failure, depending on the program non-zero status codes can have different meanings
```bash
ls whatever  # assume whatever doens't exist
echo $?  # prints 1 (previous command exit code)
```
