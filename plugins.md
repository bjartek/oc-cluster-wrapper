The way I see this there are a couple of things that we need. 

1. for plugins that add a new command we need a way to dispatch commands and subcommands to correct functions
2. For plugins that add flags to up a way to dispatch them
3. 

I have been thinking a lot about how we can solve this, especially in regards to the completions. I 
think that if we base the completions upon files in the .oc directory this could work. 

say for #23 we have a new flag --with-pipelines that we are adding. So this is a plugin in your second category.

If we append --with-pipelines to .oc/completions/boolean_flags it will show up in completion (give hat we rewrite it)

If we have a case where we want snapshos then we can append let's say snapshot to .oc/completion/commands

And for any subcommands of snapshot we can append to
.oc/completion/commands/snapshot/list

So completions can be sorted, I think. 

