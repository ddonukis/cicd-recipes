# jq recipes
## Useful jq scripts


## How to create your own jq library
You can create reusable filters and functions for jq. For example, I find useful to be able
to count the number of objects in an array grouped by a certain field. Here's the source
code for the function:
```
def count_by($k):
#  Count the number of objects in the input array grouped by the values of key k.
#
#  Command: jq 'count_by("name")'
#  Input:   [{"name": "A"}, {"name": "A"}, {"name": "B"}]
#  Output:  [{"A": 2}, {"B": 1}]

group_by(.[$k]) | map({(.[0].[$k] | tostring): length});
```
In order to make it be able to use it in a jq script it needs to be imported. The easiest
way to do that is to create a `.jq` file in `$HOME` folder and add this code there. This
jq module is automatically loaded when you run jq.
```bash
printf '[{"name": "A"}, {"name": "A"}, {"name": "B"}]' | jq 'count_by("name")'
```
