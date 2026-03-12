### Task 1: Your First Dockerfile

<img width="1466" height="218" alt="image" src="https://github.com/user-attachments/assets/02ac3894-633c-4f2a-b65b-7148a9f75e2b" />



### Task 2:

<img width="1312" height="440" alt="image" src="https://github.com/user-attachments/assets/4aba92a1-2c75-463f-8bc3-6355544131af" />


<img width="1794" height="155" alt="image" src="https://github.com/user-attachments/assets/eabc204e-cf02-4701-81c2-d4428daceb30" />


<img width="1734" height="1072" alt="image" src="https://github.com/user-attachments/assets/ec3c9d84-3195-4d91-8ccd-e830a65a1d0b" />










### Task 3 :

##CMD (Default Argument)
<img width="741" height="339" alt="image" src="https://github.com/user-attachments/assets/f72b4c59-12ea-4947-81f3-ff3859431f80" />


* When we run the image with CMD ,we ge the above output where the mentioned command `echo "Hello"` is executed .



<img width="965" height="514" alt="image" src="https://github.com/user-attachments/assets/e9330bc6-ae9b-40d5-93ab-e5957c61a2c2" />

* When we run the image by passing another command as argument , then the mentioned `echo "Hello"` is overidden by the command which is passed at run time.

##ENTRYPOINT (FIXED EXECUTABLE)

<img width="1322" height="527" alt="image" src="https://github.com/user-attachments/assets/ba67c32c-934d-42b5-9a67-e5933b7cef03" />

With entrypoint we see that even though the arguments differ but the functionality remains which is to print the argument .

* **ANOTHER EXAMPLE**

* <img width="562" height="264" alt="image" src="https://github.com/user-attachments/assets/4b7b0e75-85ea-4724-b86f-25cf93726f6a" />

<img width="1086" height="364" alt="image" src="https://github.com/user-attachments/assets/f2def299-9252-4689-9daa-fb28052e0cfd" />

* When no argument is passed , runs the default command
  
<img width="826" height="293" alt="image" src="https://github.com/user-attachments/assets/539f6521-763f-4bcc-bb1c-75864daf62ed" />

* When an argument is passed 

<img width="839" height="248" alt="image" src="https://github.com/user-attachments/assets/da31acf6-797b-4604-b2b0-f0308a044160" />


### Task 4 :

<img width="1031" height="1035" alt="image" src="https://github.com/user-attachments/assets/b7993ee3-5b1e-4bf0-85b5-e0a94447e1b6" />


<img width="889" height="409" alt="image" src="https://github.com/user-attachments/assets/288bb9c2-2a33-4753-870d-82be9b4be35e" />


<img width="1656" height="220" alt="image" src="https://github.com/user-attachments/assets/e7e2fcee-37dc-45fd-8a69-ce15dbb99d62" />

<img width="1690" height="1079" alt="image" src="https://github.com/user-attachments/assets/b53f66c9-fb1f-45b5-b043-16f90036e8de" />

### Task 5: .dockerignore
1. Create a `.dockerignore` file in one of your project folders  && 2. Add entries for: `node_modules`, `.git`, `*.md`, `.env`

<img width="1097" height="340" alt="image" src="https://github.com/user-attachments/assets/826965c0-0608-44ef-a446-e120ab936b39" />



<img width="1237" height="135" alt="image" src="https://github.com/user-attachments/assets/0ec84f63-ebe6-4c18-8921-14747573bed4" />


3. Build the image — verify that ignored files are not included

   * **On Contianer**
    
   <img width="1793" height="422" alt="image" src="https://github.com/user-attachments/assets/1dd3c48d-97a0-4fa4-b4f0-e1d786eea46f" />

   * **On Host**
   
    Verified that README.md file was skipped 


   <img width="1076" height="310" alt="image" src="https://github.com/user-attachments/assets/a8f2ffba-e997-402f-b3cb-ae5d6c43794b" />


### Task 6: Build Optimization
1. Build an image, then change one line and rebuild — notice how Docker uses **cache**

<img width="1116" height="467" alt="image" src="https://github.com/user-attachments/assets/88365b45-fc94-4f42-81eb-399215ea9205" />

<img width="1162" height="528" alt="image" src="https://github.com/user-attachments/assets/a1c77294-4aa5-48e6-a34d-3bbf6ef24891" />

<img width="1065" height="616" alt="image" src="https://github.com/user-attachments/assets/5dd51fbf-3f50-4e0a-8223-f57ae859b5b0" />





2. Reorder your Dockerfile so that frequently changing lines come **last**

<img width="1234" height="389" alt="image" src="https://github.com/user-attachments/assets/570f10e9-039a-4bf2-9bf1-bf1f2c8c74b3" />

Added requirements.txt first so that all the dependencies are installed first and the source code is copied later.


3. Write in your notes: Why does layer order matter for build speed?


In Docker, layer order is the difference between a 2-second build and a 2-minute build. This is due to Layer Caching:
Docker treats each instruction in a Dockerfile as a read-only layer.
When you rebuild an image, Docker checks if it can reuse layers from the previous build.
The critical rule is: If a layer changes, every subsequent layer must be rebuilt from scratch.
