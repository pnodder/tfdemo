terraform command cheat sheet

init -      creates the .terraform folder, clones any remote modules to local disk, safe to run multiple times
get -       run this after declaring a new module, clones that module to local disk
plan -      compares current state with remote and generates a new plan based on delta, does not actually change anything
apply -     deploys any changes, can be used with -auto-approve to skip confirmation prompt
destroy -   destroys all infra, can be used with -auto-approve