### Task 1: Install and Configure Git
1. Verify Git is installed on your machine
  Since Git was also founded by Linus Torvalds , the Linux OS comes with GIT preinstalled .
  <img width="631" height="81" alt="image" src="https://github.com/user-attachments/assets/12415305-6152-4f05-874b-1d0c3b88f1f0" />

2. Set up your Git identity — name and email
   <img width="746" height="225" alt="image" src="https://github.com/user-attachments/assets/522c1046-f4aa-4c14-ad43-07c79f4e223f" />

3. Verify your configuration

   <img width="817" height="138" alt="image" src="https://github.com/user-attachments/assets/d69a9c67-47b4-4804-8af2-eaa04e94638e" />


### Task 2: Create Your Git Project
1. Create a new folder called `devops-git-practice`

<img width="820" height="115" alt="image" src="https://github.com/user-attachments/assets/5fd3371f-2249-427e-8d48-e0733851ed2d" />


2. Initialize it as a Git repository

<img width="1099" height="394" alt="image" src="https://github.com/user-attachments/assets/2297e4b9-4729-4bdc-a742-a52c95939b7d" />

3. Check the status — read and understand what Git is telling you
   **Status**:Initialized empty Git repository in /home/ubuntu/devops-git-practice/.git/
     An empty git repository is intialized in /home/ubuntu/devops-git-practice/
4. Explore the hidden `.git/` directory — look at what's inside
   <img width="864" height="249" alt="image" src="https://github.com/user-attachments/assets/b2cf28be-9f36-48c7-b685-7d9915a5a972" />

 

### Task 3: Create Your Git Commands Reference
[git-commands.md](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-22/git-commands.md)


### Task 4: Stage and Commit
1. Stage your file
2. Check what's staged
3. Commit with a meaningful message
4. View your commit history

<img width="1093" height="718" alt="image" src="https://github.com/user-attachments/assets/9f4a62e5-87ed-458e-9166-cfb47f8c42ad" />

<img width="809" height="194" alt="image" src="https://github.com/user-attachments/assets/b48cfe03-295c-4ddc-8982-1c2ee53eac79" />

### Task 5: Make More Changes and Build History
1. Edit `git-commands.md` — add more commands as you discover them
2. Check what changed since your last commit
3. Stage and commit again with a different, descriptive message
4. Repeat this process at least **3 times** so you have multiple commits in your history
5. View the full history in a compact format

<img width="1114" height="932" alt="image" src="https://github.com/user-attachments/assets/78563b50-9fda-42de-8d43-47c429353e91" />


### Task 6: Understand the Git Workflow
->What is the difference between git add and git commit?
* Git add adds all the untracked files to the staging area whereas git commit saves the final snapshot of the project onto the local git repo.
* Git add is a selection process and git commit is the saving process.


->What does the staging area do? Why doesn't Git just commit directly?
* Staging area keeps track of all the files that needs to be saved and the user can choose to unstage them or commit them as per the requirement.
  Git doesnot commit directly , as it gives the user the flexibility on what needs to be saved and carefully review whats committed for a clean project.


->What information does git log show you?
* Git log shows the history of all the commits along with Commit hash,Author name ,Authors email , date& time of commit and the commit message done in the working directory 


->What is the .git/ folder and what happens if you delete it?
* .git folder indicates that it's a git repository and all the files are being tracked .It is a hidden directory which contains all the metadata and version history of the entire project.
when you delete the .git folder , simply means that the repository is not GIT repo and files will not be tracked further that is version history is lost and you will no longer be able to execute git commands

->What is the difference between a working directory, staging area, and repository?

**Working Directory**: This is the directory where all your project code is developed and designed and this is the directory in which GIT was intialized.

**Staging Area**: Staging Area refers to the place where you can add all the final codes to this and then commit them as a final step to save them .Its a kind of draft board where you can add your files to be committed later.

**Repository**: Repository is a version controlled system where all the files are tracked with their history.


