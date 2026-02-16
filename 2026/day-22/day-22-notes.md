->What is the difference between git add and git commit?
A) Git add adds all the untracked files to the staging area whereas git commit saves the final snapshot of the project onto the local git repo.
   Git add is a selection process and git commit is the saving process.
->What does the staging area do? Why doesn't Git just commit directly?
A) Staging area keeps track of all the files that needs to be saved and the user can choose to unstage them or commit them as per the requirement.
   Git doesnot commit directly , as it gives the user the flexibility on what needs to be saved and carefully review whats committed for a clean project.
What information does git log show you?
A) Git log shows the history of all the commits along with Commit hash,Author name ,Authors email , date& time of commit and the commit message done in the working directory 
What is the .git/ folder and what happens if you delete it?
A) .git folder indicates that it's a git repository and all the files are being tracked .It is a hidden directory which contains all the metadata and version history of the entire project.
when you delete the .git folder , simply means that the repository is not GIT repo and files will not be tracked further that is version history is lost and you will no longer be able to execute git commands

->What is the difference between a working directory, staging area, and repository?
A) Working Directory
   This is the directory where all your project code is developed and designed and this is the directory in which GIT was intialized.
Staging Area
Staging Area refers to the place where you can add all the final codes to this and then commit them as a final step to save them .Its a kind of draft board where you can add your files to be committed later.
Repository 
Repository is a version controlled system where all the files are tracked with their history.


