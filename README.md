#### A Git Hook to Track Code Contributions on **GitHub**'s Contribution Graph<sup id="a1">[1](#f1)</sup>, **UNIVERSALLY** from ANY Workflow.

Great if you want to capture your true commit activity on the ubiquitous GitHub contribution graph but... use other git workflows for the majority of your work (private, non-GitHub, local)

* works regardless of what workflow you happen to have... (GitLab, BitBucket, CodeCommit, local repo only i.e. plain Git, ...)
* smartly tracks useful metadata only and is customizable for privacy, etc.
* full control of what's shared and what's not via filtering.
* not limited to main (or any specific branch) to work

Like many, much of my work is not in public GitHub projects. But after just adding Synchook to a few of the private repos I work on, I saw the following change in my graph...

![Before after Synchook](https://user-images.githubusercontent.com/123592097/221391361-d54e21f6-443a-4f56-a164-601b66b7d30e.png)

## Real-time Universal Git Contributions Graph
With it you can now track your ([my](https://brakecode.com/synchook/?user=june07@github)) daily commits in real-time...
<div align="center">
 
https://user-images.githubusercontent.com/123592097/222279962-21de6d8a-0463-478c-982b-f4716c09bf3a.mp4

</div>

## Work NDA's... no problem
For those who might be bound to NDAs, you can also redact/obfuscate some or everything about your commits...

<div align="center">

![synchook-nda-feature](https://user-images.githubusercontent.com/123592097/223283388-e3671bff-3fda-4a21-80e8-54a18e9e9a56.gif)

</div>

## Wishing for the solution Synchook provides...

<div align="center">

![Synchook Wishes](https://user-images.githubusercontent.com/11353590/221730634-009f7e10-d2ed-4e79-8d65-2514148c9f24.gif)

</div>

Meaning that git commits you perform on other services such as [GitLab](https://gitlab.com/), [Bitbucket](https://bitbucket.org/), or [Code Commit](https://aws.amazon.com/codecommit/), or even locally, can all be counted and displayed on your Github graph.

# How does it work?

Synchook works by using [a git hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) that calls its secure cloud service to sync your commit logs to a secondary GitHub repo. The secondary repo doesn't store any files but rather the commit metadata (git log, sha, repo, branch, url), thus privacy is maintained. Contributions to the secondary repo are then counted/reflected on your GitHub contributions graph.

# Is it safe?

* Yes, since no code is actually sent anywhere and the hook is fully open source so you can verify that yourself.
* And while only metdata (git log, sha, repo, branch, url) is sent, you can further [filter](#Filter-and-mask-true-repo-names) that based on your needs.
* The backend server authorization component (Auth0/Okta) only requests enough permissions from your git identity provider (GitHub) to verify and matchup the metadata you send with the correct secondary tracking account which is based on your git identity but which has zero privileges to any of your repos.
* Same with the [GitHub App](https://github.com/apps/kitchen-synchook), it required minimal permissions.

# Is this just a *hack* or *gaming* the system?
**Absolutely not.** The reason I wrote this was to capture my *ACTUAL* and *MEANINGFUL (though that part could be argued)* code contributions made using git as a tool and yet which fell outside of the scope of what GitHub did count or even could practically count (considering they don't own the entire software development pipeline... yet 🤨)

As far as all the "solutions" out there to game the system... I'll just say this isn't one of them.

The entire point is to more effectively capture your true workflow in an effort to build upon a positive feedback cycle.

# Things that normally get in the way of universal contribution tracking are...

* private repos
* external repos (outside of GitHub)
* and other [GitHub specific reasons](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-settings-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile) of which you may have a legit reason to want to count like...
  * forks
  * branches
  
I wrote Synchook because a lot of my development time (in private/external repos) wasn't reflected in my GitHub contribution graph and I found that a bit 😒.

# How to use it?

The steps to use Synchook are simple:

1. For step 1 there are two options...
    * Sign up and obtain a free API key at https://brakecode.com/synchook.

        * If you're currently a BrakeCODE user just link your GitHub account using the BrakeCODE Dashboard, and new users simply need to signup by authenticating with their GitHub account.
        * A secondary tracking repo is automatically created for you at https://github.com/synchook/your_github_username. You will receive an invitation to be the sole collaborator (excluding Synchook) for this secondary repo and have access via synchook as well.
        * The BrakeCODE Dashboard will show your commit activity in real time from the Synchook panel.
        <br><br>

        My Synchook repo for example: [https://github.com/synchook/june07](https://github.com/synchook/june07)

        **IMPORTANT NOTE**: Currently you must use the Canary version of BrakeCODE Dashboard to access this feature.
    * Or use the GitHub App at https://github.com/apps/kitchen-synchook
        * The App will allow you to try a limited version of Synchook using a shared API key ([shared API key endpoint](https://api.brakecode.com/api/v1/synchook/apikey))
        * The App requests minimal permissions and is used to give you collaborator access to the shared *kitchen sync* repo https://github.com/synchook/kitchen where you will see your commit updates.
        * Your own commit graph will start reflecting commits made to the shared kitchen sync repo.
        * You won't have access to the BrakeCODE Dashboard which provides additional features.<br><br>

2. Then configure the [post-commit](https://github.com/synchook/synchook/blob/main/post-commit) hook in your .git/hooks directory.
    * This step can be done in a number of ways (symlink, file copy, etc) but the way I recommend is by cloning the synchook repo and then symlinking the needed hooks. This way you can get any updates accross all repos using the hooks with a single git pull.
    * You can also use the git template directory to automatically include the hooks in each new repo by default.

  ## Recommended way of configuring Synchook (assuming your home directory is the base subdirectory for your various code projects)
  There's actually [a script](https://github.com/synchook/synchook/blob/main/scripts/add.sh) for the following process now, so you could use https://github.com/synchook/synchook/blob/main/scripts/add.sh to add new repos to track...

  ```
    cd ~
    git clone https://github.com/synchook/synchook.git synchook
    cd ~/my-project/.git/hooks
    ln -s ../../../synchook/post-commit
    ln -s ../../../synchook/post-commit-synchook
  ```
## Example of running synchook for the first time
* note this specific example does not correlate to other examples shown

![synchook-initial-run](https://user-images.githubusercontent.com/123592097/217370845-35de4d07-21cf-4321-8095-992a6d35e8b4.gif)

3. Enjoy the 🔥

    * As you can see in the yellow highlighted area, all of my external commits are now being reflected in my primary GitHub account contribution graph!
      ![image](https://user-images.githubusercontent.com/123592097/215356537-042db8e5-f5aa-4d6c-84f2-c873887c020a.png)

    * On the BrakeCODE dashboard you will be able to see your realtime API call log.
      ![image](https://user-images.githubusercontent.com/123592097/217401608-afd32412-e6ca-4a8d-9308-e70780fa103f.png)
      
    * And on GitHub you will notice an update was made to your synchook repo.
      ![image](https://user-images.githubusercontent.com/123592097/217401982-74915c33-774a-4278-b9d8-1d4c747d7605.png)

# Options
  * ## Filter and mask 🎭 true repo names
    To add additional privacy, you can filter repo names via the FILTER configuration elements using the syntax `FILTER=<match>:<replacement>` and the replacement name will be used for commits to the secondary repo.

    Example:
      * The following configuration will translate a repo named "super-private-repo" into "super-public-repo"

        ```
          FILTER=super-private-repo:super-public-repo
        ```

      * Multiple filters are supported so a second filter could be added to translate "veryPrivateRepo" into "openRepo"

        ```
          FILTER=super-private-repo:super-public-repo
          FILTER=veryPrivateRepo:openRepo
        ```

    **Note: Spaces in the repo folder name are not yet suppored.**

  * ## Exclude repos
    To exclude repos that are already directly counted by the git providers normal mechanism, you can use the `EXCLUDE` config key. See [this issue](https://github.com/synchook/synchook/issues/5) for more detail on what this option is for.

    Example:
      * The following configuration will exclude the GitHub repo nimv3 from being committed to the secondary repo as it would be redundant to do so. This configuration will exclude all branches of the nimv3 repo.

        ```
              EXCLUDE=github:nimv3
        ```
      * To simply exclude a single branch, you would use this configuration:
      
        ```
              EXCLUDE=github:nimv3:master
        ```
    To get a better idea on exactly what you would need to add as your EXCLUDE config, just look at the secondary repo folder structure for a hint.
  
  * ## NDA feature
    To exclude or redact some or even all metadata from your commits, you can use the `NDA` config key multiple times as required. If the NDA log key is used, a random time of day and commit sha will be generated for use in the secondary repo commit.
    
  ![image](https://user-images.githubusercontent.com/123592097/223285229-cff3469a-2549-4d4e-a1f2-2fa77d2065be.png)

The resulting commit will be found as such:

  ![image](https://user-images.githubusercontent.com/123592097/223285422-ff3948b8-46ca-453d-b29b-d2ef931c6aac.png)

And the folder structure will remain the same simply using *---REDACTED---* in the place of what NDA keys are used.

    Example:
      * The following configuration will fully exclude ALL metadata from being sent. 

        ```
              NDA=host
              NDA=repo
              NDA=branch
              NDA=url
              NDA=log
        ```

## FAQ

  1. **Can it sync my past commits?**<br>
    *Synchook is more concerned with looking forward and not back... you know what they say about such things. That said, there are other great solutions out there to suit that specific use case, like one I just found out about https://github.com/kefimochi/sync-contribution-graph.*

<br><br><br><br>
<b id="f1">1</b>
and other git service (GitLab for example) contribution graphs as well <sub>*haven't gotten that far yet!*</sub>
[↩](#a1)
