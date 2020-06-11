---
layout: "post"
location: "Berlin"
title: "My PowerShell prompt"
aliases: ["2012/10/01/my-powershell-prompt/"]
---

Today I took some time to work on my PowerShell configuration. Here is what it looks like now:

![My GitHub Shell](/assets/images/posts/2012-10-01-my-powershell-prompt/my-github-shell.png)  
In case you already know about customizing the PowerShell, you can get the file [here](https://gist.github.com/3813881). If not, read on.

## Shortening The Prompt

![Long Paths](/assets/images/posts/2012-10-01-my-powershell-prompt/long-paths.png)
This is the default git shell prompt. As you can see, the path takes about 75% of the prompt's width. Let's change that.

Admittedly, until today I didn't know a lot about PowerShell. So, after a bit research, I found an article on [prompt shortening](http://winterdom.com/powershell/2008/08/13/mypowershellprompt.html). The following two functions need to be placed into `%USERPROFILE%\Documents\WindowsPowerShell\GitHub.PowerShell_profile.ps1`

```ps1
function shorten-path([string] $path) { 
	$loc = $path.Replace($HOME, '~') 
	# remove prefix for UNC paths 
	$loc = $loc -replace '^[^:]+::', '' 
	# make path shorter like tabs in Vim, 
	# handle paths starting with \\ and . correctly 
	return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2') 
}

function prompt { 
	# write status string (-n : NoNewLine; -f : ForegroundColor)
	write-host 'PS' -n -f White
	write-host ' {' -n -f Yellow
	write-host (shorten-path (pwd).Path) -n -f White
	write-host '}' -n -f Yellow
	return ' ' 
}```

`shorten-path()` takes care of shortening the path in a GVim manner and replacing the user profile path with a `~`.  
`prompt()` is a built-in function that is used to format the prompt.  

## Putting It Together

While this was working, it turned out that this got rid of the branch status. Luckily, someone wrote an article about [displaying git data in the prompt](http://tiredblogger.wordpress.com/2009/08/21/using-git-and-everything-else-through-powershell/). 
I spent a good hour playing around with the code and eventually I got PowerShell to display the data again.

```ps1
function prompt {
    if(Test-Path .git) {
        # retrieve branch name
        $symbolicref = (git symbolic-ref HEAD)
        $branch = $symbolicref.substring($symbolicref.LastIndexOf("/") +1)

        # retrieve branch status
        $differences = (git diff-index HEAD --name-status)
        $git_mod_count = [regex]::matches($differences, 'M\s').count
        $git_add_count = [regex]::matches($differences, 'A\s').count
        $git_del_count = [regex]::matches($differences, 'D\s').count
        $branchData = " +$git_add_count ~$git_mod_count -$git_del_count"

        # write status string (-n : NoNewLine; -f : ForegroundColor)
        write-host 'GIT' -n -f White
        write-host ' {' -n -f Yellow
        write-host (shorten-path (pwd).Path) -n -f White
        
        write-host ' [' -n -f Yellow
        write-host $branch -n -f Cyan
        write-host $branchData -n -f Red
        write-host ']' -n -f Yellow
        
        write-host ">" -n -f Yellow
    }
    else {
        # write status string
        write-host 'PS' -n -f White
        write-host ' {' -n -f Yellow
        write-host (shorten-path (pwd).Path) -n -f White
        write-host ">" -n -f Yellow
    }

    return " "
}```


##PowerShell Properties
If you right-click on the PowerShell menu bar, you will find a menu called `Properties`. In there, you can change a few things that will make your work with the PowerShell a little easier.  
Here are the properties I changed:

	BufferSize: 500
	QuickEditMode: true
	Font: Lucidas Console
	Font Size: 14
	Screen Buffer Width: 100
	Screen Buffer Height: 1000
	Window Width: 100
	Window Height: 54
