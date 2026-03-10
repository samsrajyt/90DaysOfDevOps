first obeservation 
docker pull accept only one argument and cannot pass multpile arguments 

Task 1: Docker Images
Pull the nginx, ubuntu, and alpine images from Docker Hub

<img width="927" height="454" alt="image" src="https://github.com/user-attachments/assets/27748007-2e20-4302-ae73-38e34991da33" />


List all images on your machine — note the sizes
--------------------------
REPOSITORY    SIZE
nginx         161MB
ubuntu        78.1MB
alpine        8.44MB
hello-world   10.1kB
--------------------------

<img width="727" height="174" alt="image" src="https://github.com/user-attachments/assets/7cd5a356-b229-4029-b994-8e2ff82bd20d" />


Compare ubuntu vs alpine — why is one much smaller?
Alpine is of a smaller size than ubuntu 
Alpine is a super minimal linux distriution built for speed and security , the lesser the image size the more faster and secure it is.It only has the essentail libraries.
Ubuntu is a complete linux OS which comes with pre installed packages like bash,curl,apt etc

Inspect an image — what information can you see?
<img width="1483" height="1054" alt="image" src="https://github.com/user-attachments/assets/8c7cc7d0-1a42-48b9-8f2d-e0b91c7b5d9d" />

It contains the low level meta deta of the image in JSON format.

Remove an image you no longer need

<img width="996" height="403" alt="image" src="https://github.com/user-attachments/assets/1ff48fa3-7515-48d3-bd24-4f672b6277b5" />


Task 2: Image Layers
Run docker image history nginx — what do you see?
<img width="1255" height="530" alt="image" src="https://github.com/user-attachments/assets/2622a7c5-c96e-4d2c-a8b8-1f342f0842e6" />

Each line is a layer. Note how some layers show sizes and some show 0B

Write in your notes: What are layers and why does Docker use them?




