## Task 1: Understanding Branches

### What is a branch in Git?
* **Branch in GIT is a seperate workspace where you can devlop new features and codes without affecting the main code.**

### Why do we use branches instead of committing everything to main?
* **The main branch always consists of clean , stable production code and thats why we create seperate branches where we can tryout and experiment new features which can be merged on to main branch.**
  
### What is HEAD in Git?
* **HEAD always points the latest commit in a branch.**

### What happens to your files when you switch branches?
* **All the committed files will appear in every branch and all the unsaved files in the working directory will appear whenever you switch branches.**

## Task 2: Branching Commands — Hands-On

In your `devops-git-practice` repo, perform the following:
1. List all branches in your repo
     
2. Create a new branch called `feature-1`
3. Switch to `feature-1`
4. Create a new branch and switch to it in a single command — call it `feature-2`
5. Try using `git switch` to move between branches — how is it different from `git checkout`?
6. Make a commit on `feature-1` that does **not** exist on `main`
7. Switch back to `main` — verify that the commit from `feature-1` is not there
8. Delete a branch you no longer need
9. Add all branching commands to your `git-commands.md`


