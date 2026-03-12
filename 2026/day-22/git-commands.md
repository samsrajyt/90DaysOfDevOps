### Git Basic Commands :

**Setup & Config**
* To configure username and email locally 
```bash
  git config --global user.name "<username>"
  git config --global user.email "<email>"
```

**Basic Workflow**

* git init -> intializes an empty git repository
* git add -> used to stage files (Add all untracked files)
* git commit -> commits and push all files to tracked
* git rm --cache <filename> -> to unstage a filename
* git restore <filename> -> to restore any files which are deleted


**Viewing Changes**

* git status -> to check the status of the files added or removed
* git log ->to check the log of all the files being committed


**git doesnot store the actual file but it stores the hash value which is the encoded commit .**

**HEAD always points to the latest commit on any branch**

**Branching Commands :**
* git checkout -b <branchname> -> creates the specified branch name and switches to the created branch and also copies the commit history of the source where the branch is created 
* git branch -> list all the branches availble on the directory 
* git switch <branch name> -> switches the mentioned branch name 
* git branch -D <branch name> ->deletes the mentioned branch name 

**To clone a repo from remote to local** 
* git clone <url>

**To push from local to remote** 
  ```bash
  git push origin <branch>
```
   eg : git push origin main 

**To check the variable origin and to which url origin is set** 
  ```bash
  git remote -v
``` 

**To change or set the origin variable** 
 
   *git remote set-url origin "<https or ssh url>"*

* **git clone** -> used copy to local from remote repo
* fork -> used to copy from one remote repo to another remote repo

* git pull = git fetch + git merge
* git fetch = It downloads the latest metadata and changes from a remote repository (like GitHub) to your local machine, but it does not merge those changes into your current working files.




