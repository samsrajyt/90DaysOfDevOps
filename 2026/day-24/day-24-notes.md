What is a fast-forward merge?
This merge happens when there is a commits on the branch to be merged i.e the feature branch and there are no commits on the main branch , it just does a fast forward merge .


When does Git create a merge commit instead?
When the main branch has a commit/commits that is not present in the feature branch and the branch to be merged also has new commit/commits of its own, then this merge commit occurs that combines the main branch commit and the merged branch commits.
when both the branches have a seperate history of commits then a merge commit occurs .


What is a merge conflict? 
Merge Conflic happens when two branches have a different commits on the same line of the file.
<img width="901" height="866" alt="image" src="https://github.com/user-attachments/assets/5b633273-0af4-4813-a26d-3019866943b4" />


What does rebase actually do to your commits?
It rewrites the history of  all the commits of the mentioned branch in the history of the source branch  and it creates a linear hostory of commits.
How is the history different from a merge?
Merge retains the history of the commits making it non linear.
Why should you never rebase commits that have been pushed and shared with others?
rebase rewrites the history of commits and hence will cause conflicts for other users who are contributing to the project .
When would you use rebase vs merge?
rebase should be used for personal feature branches 
merge should be used for main branches as we need the histoory of the commits


What does squash merging do?
Squash merge merges a bunch of commits into one commit .
When would you use squash merge vs regular merge?
squash merge can be used when there are lots of small commits and can be merged to one commit 
Regular mege can be used when there is a major  feature change that needs to be merged with the main branch.
What is the trade-off of squashing?
Cleaner history 
easy reverts
Simplified code review


What is the difference between git stash pop and git stash apply?
git stash pop , pops out all the stashed work on to the working directory 
git stash apply , pops out all the stashed files and also mantains a copy of files in stash 
git stash list 
git stash pop stash@{0}
When would you use stash in a real-world workflow?
If we are working on a feature branch and are suddenly required for another feature change in another branch you can stash the files on the current working directory and switch to another branch.

#git cherry pick 
git cherry-pick <commitid >




