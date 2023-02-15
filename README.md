Synchook is ✨ _special_ ✨ because it's a simple way to track (via the GitHub[^1] contribution graph) your git contributions **universally across all of your git workflows**.

Meaning that git commits you perform on other services such as [GitLab](https://gitlab.com/), [Bitbucket](https://bitbucket.org/), or [Code Commit](https://aws.amazon.com/codecommit/), or even locally, can all be counted and displayed on your Github graph.

## What is it?

Synchook works by using a git hook that calls its secure cloud service to sync your commit logs to a secondary GitHub repo. The secondary repo doesn't store any files but rather the commit metadata (git log, sha, repo, branch, url), thus privacy is maintained. Contributions to the secondary repo are then counted/reflected on your GitHub contributions graph.

## Things that normally get in the way of universal contribution tracking are...

* private repos
* external repos (outside of GitHub)
* and other [GitHub specific reasons](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-settings-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile) of which you may have a legit reason to want to count like...
  * forks
  * branches
  
I wrote Synchook because a lot of my development time (in private/external repos) wasn't reflected in my GitHub contribution graph and I found that a bit 😒.

## How to use it?

The steps to use Synchook are simple:

1. For step 1 there are two options...
    * Sign up and obtain a free API key at https://brakecode.com/synchook.

        * If you're currently a BrakeCODE user just link your GitHub account using the BrakeCODE Dashboard, and new users simply need to signup by authenticating with their GitHub account.
        * A secondary tracking repo is automatically created for you at https://github.com/synchook/your_github_username. You will receive an invitation to be a collaborator for your repo and have access via synchook as well.<br><br>

        My Synchook repo for example: [https://github.com/synchook/june07](https://github.com/synchook/june07)

        **IMPORTANT NOTE**: Currently you must use the Canary version of BrakeCODE Dashboard to access this feature.
    * Or use the GitHub App at https://github.com/apps/kitchen-synchook
        * The App will allow you to try a limited version of Synchook using a shared API key ([shared API key endpoint](https://api.brakecode.com/api/v1/synchook/apikey))
        * The App requests minimal permissions and is used to give you collaborator access to the shared *kitchen sync* repo https://github.com/synchook/kitchen 
        * You won't have access to the BrakeCODE Dashboard which provides additional features.

2. Then configure the [post-commit](https://github.com/synchook/synchook/blob/main/post-commit) hook in your .git/hooks directory.
    * This step can be done in a number of ways (symlink, file copy, etc) but the way I recommend is by cloning the synchook repo and then symlinking the needed hooks. This way you can get any updates accross all repos using the hooks with a single git pull.
    * You can also use the git template directory to automatically include the hooks in each new repo by default.

  ### Recommended way of configuring Synchook (assuming your home directory is the base subdirectory for your various code projects)
  ```
    cd ~
    git clone https://github.com/synchook/synchook.git synchook
    cd ~/my-project/.git/hooks
    ln -s ../../../synchook/post-commit
    ln -s ../../../synchook/post-commit-synchook
  ```
### Example of running synchook for the first time
* note this specific example does not correlate to other examples shown

![synchook-initial-run](https://user-images.githubusercontent.com/123592097/217370845-35de4d07-21cf-4321-8095-992a6d35e8b4.gif)

3. Enjoy the 🔥

    * As you can see in the yellow highlighted area, all of my external commits are now being reflected in my primary GitHub account contribution graph!
      ![image](https://user-images.githubusercontent.com/123592097/215356537-042db8e5-f5aa-4d6c-84f2-c873887c020a.png)

    * On the BrakeCODE dashboard you will be able to see your realtime API call log.
      ![image](https://user-images.githubusercontent.com/123592097/217401608-afd32412-e6ca-4a8d-9308-e70780fa103f.png)
      
    * And on GitHub you will notice an update was made to your synchook repo.
      ![image](https://user-images.githubusercontent.com/123592097/217401982-74915c33-774a-4278-b9d8-1d4c747d7605.png)

### 


[^1]: and other git service (GitLab for example) contribution graphs as well <sub>*haven't gotten that far yet!*</sub>
