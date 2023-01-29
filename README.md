Synchook is ✨ _special_ ✨ because it's a simple way to track (via the GitHub[^1] contribution graph) your git contributions **universally accross all of your git workflows**.

Meaning that git commits you perform on other services such as [GitLab](https://gitlab.com/), [Bitbucket](https://bitbucket.org/), or [Code Commit](https://aws.amazon.com/codecommit/), or even locally, can all be counted and displayed on your Github graph.

## What is it?

Synchook works by using a simply Git hook that calls its secure cloud service to sync your commit logs to a secondary GitHub repo. The secondary repo doesn't store any files but rather the commit metadata (git log, sha, repo, branch, url), thus privacy is maintained. Contributions to the secondary repo are then counted/reflected on your GitHub contributions graph.

## Things that normally get in the way of universal contribution tracking are...

* private repos
* external repos (outside of GitHub)
* and other [GitHub specific reasons](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-settings-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile) of which you may have a legit reason to want to count like...
  * forks
  * branches
  
I wrote Synchook because a lot of my development time (in private/external repos) wasn't reflected in my GitHub contribution graph and I found that a bit 😒.

## How to use it?

The steps to use Synchook are simple:

1. Sign up and obtain a FREE API key at https://brakecode.com/synchook.
    * If you're currently a BrakeCODE user just link your GitHub account using the BrakeCODE Dashboard, and new users simply need to signup by authenticating with their GitHub account.
    * A secondary tracking repo is automatically created for you at https://github.com/synchook/your_github_username of which you will have access to as a collaborator and via the synchook hook.<br>
    
      My Synchook repo for example: [https://github.com/synchook/june07](https://github.com/synchook/june07)

2. Configure the [post-commit](https://github.com/synchook/synchook/blob/main/post-commit) hook in your .git/hooks directory.

3. Enjoy the 🔥

![image](https://user-images.githubusercontent.com/123592097/215356537-042db8e5-f5aa-4d6c-84f2-c873887c020a.png)


### 


[^1]: and  other Git service contribution graphs as well <sub>*haven't gotten that far*</sub>
