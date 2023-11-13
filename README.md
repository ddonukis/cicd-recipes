# cicd-recipes
CI/CD tips and tricks, script recipes etc

### Github Workflows
It’s a really powerful tool to automate your development and deployment processes.

It allows you to run a workflow triggered by some event in github.

In addition to general bash scripting knowledge, few cli tools you will find indispensable when working with CI pipelines:
* `gh` - official github cli client
* `jq` - cli program for processing JSON
* `awk` - powerful text processing tool (language) universally available on (almost) every terminal environment

### Bash scripting gotchas
* Use set -e in the beginning of your script to make sure the script exits on the first failure. The default behavior of bash is to continue running regardless of errors.
* Use `$()` “double quotes” and ‘single quotes’ when necessary
* Know how to pass data into and out of commands:
    * `cat data.json | jq '.'` – use cat to read the file and pipe it into the stdin of jq
    * `jq '.' < data.json` – read the file at path and pass it into the stdin of jq
    * `jq '.' data.json` – if the tool supports it pass filenames as cli arguments
    * `ls *.json | xargs jq '.'` – xargs takes a whitespace separated list and passes it to the command as positional arguments. If the ls command returns "d1.json d2.json" this is equivalent to jq '.' d1.json d2.json
