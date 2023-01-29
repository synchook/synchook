Synchook is ✨ _special_ ✨ because it's a simple way to track (via the GitHub contribution graph... and possibly other Git service contribution graphs as well <sub>*haven't gotten that far*</sub>) **all of your git contributions universally** accross all of your git workflows.

It's a simply Git hook that calls a service to sync your commit logs to a secondary GitHub repo.

1. When you register and obtain a FREE Api Key, the service creates a secondary tracking repo for you at https://github.com/synchook/your_github_username.<br>
  My Synchook repo for example: [https://github.com/synchook/june07](https://github.com/synchook/june07)
2. Configure the [post-commit](https://github.com/synchook/synchook/blob/main/post-commit) hook in your .git/hooks directory.
3. 

Things that normally get in the way of universal contribution tracking are...

* private repos
* external repos (outside of GitHub)
* and other [GitHub specific reasons](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-settings-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile) of which you may have a legit reason to want to count like...
  * forks
  * branches
  
I wrote Synchook because a lot of my development time (in private/external repos) wasn't reflected in my GitHub contribution graph and I found that a bit 😒.

### 
