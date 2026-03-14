### Task 1: Git Merge — Hands-On
1. Create a new branch `feature-login` from `main`, add a couple of commits to it
    

   ### What is a fast-forward merge?
   * *This merge happens when the feature branch has commit/commits and the main branch has no commits , this merge simply adds the commits in the history.it simply moves the main pointer forward       to the latest commit on feature.*  
   ### When does Git create a merge commit instead?
   *  *When the histories of both the main and feature branch are different and if there are no conflicts between the main and feature branch then a merge commit occurs.*
   ### What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
    * *Merge Conflic happens when two branches have a different commits on the same line of the file.*
    
     <img width="901" height="866" alt="image" src="https://github.com/user-attachments/assets/5b633273-0af4-4813-a26d-3019866943b4" />


### Task 2: Git Rebase — Hands-On

   - What does rebase actually do to your commits?

     *It rewrites and creates a linear history of commits.*
      
   - How is the history different from a merge?
     
     *When a merge commit happens , there is clear history of commit and all the commits are properly documented.*
     
   - Why should you **never rebase commits that have been pushed and shared** with others?

     *It will create conflicts and the contributions will not be properly documnted and will cause confusion.*
     
   - When would you use rebase vs merge?


     *rebase should be used for personal feature branches* 

     *merge should be used for main branches as we need the history of the commits.*

### Task 3: Squash Commit vs Merge Commit


  - What does squash merging do?

    *Squash merge merges a bunch of commits into one commit .*


  - When would you use squash merge vs regular merge?

      *Squash merge can be used when there are lots of small commits and can be merged to one commit.* 
      *Regular merge can be used when there is a major  feature change that needs to be merged with the main branch.*

  - What is the trade-off of squashing?


      * *Cleaner history* 
      * *easy reverts*
      * *Simplified code review*






### Task 4 : Git Stash — Hands-On

## What is the difference between git stash pop and git stash apply?
   *git stash pop , pops out all the stashed work on to the working directory* 
   
   *git stash apply , pops out all the stashed files and also mantains a copy of files in stash* 
```bash
git stash list 
git stash pop stash@{0}
```

## When would you use stash in a real-world workflow?
   
   *If we are working on a feature branch and are suddenly required for another feature change in another branch you can stash the files on the current working directory and switch to another branch.*


## Task 5: Cherry Picking
### What does cherry-pick do?
***Cherry pick allows us to apply a specific commit.***

 ***Applies a specific commit from one branch to another and creates a new commit with a new ID.***

### When would you use cherry-pick in a real project?

***When I need only specific changes, like applying a hotfix from a feature branch to main,without merging the entire branch.***

### What can go wrong with cherry-picking?

***merge conflicts ***
***Duplicate Commits because it creates new commit ids.***








