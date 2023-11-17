map(if .type == "py" then .xid = ("blah/" + .xid) else . end)
