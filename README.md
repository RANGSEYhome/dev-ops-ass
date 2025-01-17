# DEVOPS Assignment

## Overview
This project is a requirement for completion of the DEVOPS class taught by instructor Kheang KimAng.

## Acknowledgement
I would like to express my sincere gratitude to my instructor, Kheang KimAng, for his invaluable guidance and support throughout this DEVOPS class. His teaching has greatly enhanced my understanding of the subject matter.

I would also like to thank my classmates for their collaboration and assistance in fixing errors. Special thanks to Mr. LONG Ratha for his hard work in resolving most of the errors ([Fix error in the original submodule](https://github.com/RANGSEYhome/dev-ops-ass/blob/main/NOTE.md#error)) and for taking the lead on many aspects of the assignment.

This assignment has taught me a great deal. I have gained knowledge through practice and can see that the concepts I learned are now a little more clear in my mind. Although I did not complete all the assignments, I truly learned from this experience, which served as real practice.

I appreciate the opportunity to grow and learn in this class. The skills I've acquired and the challenges I've faced have not only deepened my understanding of DEVOPS but have also inspired me to embrace future projects.

## Assignment Instruction and Requirement
Given fronten and backend repository, fork them
- Frontend: https://github.com/tfd-ed/tfd-nest-boilerplate
- Backend: https://github.com/tfd-ed/tfd-nuxt-tailwind-boilerplate

What to do:
1. Create a new Github repository that submodule forked fronten and backend
2. Create docker compose that combine fronten and backend (also DB and Nginx and other services)
3. Deploy the repository in VPS and map the domain appropriately (last-day.***)
4. Build CI/CD pipeline to trigger redeployment upon push to the forked repository on VPS

## Setup Instructions (for this ready to use project)
0. Suppose the tasks listed below are done:
- Configure Docker on VPS
- Map backend and api domain
- Configure on key secret for Github action (CONTABO_KEY)
1. Clone the Repository
```sh
git clone --recurse-submodules https://github.com/RANGSEYhome/dev-ops-ass.git
```
2. Navigate to the repository folder
```sh
cd dev-ops-ass
```
3. Edit .env files as needed (can also navigate to edit later)
- .env.backend.example: edit JWT, DATABASE, and REDIS CACHE as needed
- .env.frontend.example: edit api url
3. Copy .env files to fronten and backend submodule
```sh
cp .env.backend.example backend/.env
cp .env.frontend.example frontend/.env
```
5. Build and run containers in detached mode
```sh
docker compose up --build -d
```

## Setup Instructions (for starting project from scratch)
Project structure:
- .github/workflows
- backend
- frontend
- nginx
    - entrypoint-nginx.sh
    - vhost.template
- .env.backend.example
- .env.frontend.example
- .gitmodules
- docker-compose.yml
- Dockerfile-backend
- Dockerfile-frontend
- Dockerfile-nginx
1. Create a new Github repository that submodule forked fronten and backend
- Create a new Github repository
- Forked fronten and backend (from link above)
- Add submodule to repository (navigate to the new Github repository)
```sh
git clone --recurse-submodules FORKED_FRONTEND_REPO_RUL frontend
git clone --recurse-submodules FORKED_BACKEND_REPO_RUL backend
git submodule update --init --recursive
```
2. Create docker compose that combine fronten and backend (also DB and Nginx and other services)
- nginx
    - entrypoint-nginx.sh
    - vhost.template
- .env.backend.example
- .env.frontend.example
- docker-compose.yml
- Dockerfile-backend
- Dockerfile-frontend
- Dockerfile-nginx

🚨 **Important Fix** 🚨  
[Fix error in the original submodule](https://github.com/RANGSEYhome/dev-ops-ass/blob/main/NOTE.md#error)  
🚨 **End Important Fix** 🚨  

3. Deploy the repository in VPS and map the domain appropriately (last-day.***)
- Map domain for frontend and api
- Clone the Repository
```sh
git clone --recurse-submodules GITHUB_REPO_URL
```
- Navigate to the repository folder
```sh
cd GITHUB_REPO_NAME
```
- Edit .env files as needed (can also navigate to edit later)
    - .env.backend.example: edit JWT, DATABASE, and REDIS CACHE as needed
    - .env.frontend.example: edit api url
- Copy .env files to fronten and backend submodule
```sh
cp .env.backend.example backend/.env
cp .env.frontend.example frontend/.env
```
- Build and run containers in detached mode
```sh
docker compose up --build -d
```
4. Build CI/CD pipeline to trigger redeployment upon push to the forked repository on VPS
- Generate SSK key pair
```sh
ssh-keygen -t rsa -b 4096 -C
```
- Copy the Public Key to VPS
```sh
ssh-copy-id username@your-server-ip
```
- Manually Add the Public Key (if ssh-copy-id is not available)
    - Display your public key
    ```sh
    cat ~/.ssh/id_rsa.pub
    ```
    - Create the .ssh directory (if it doesn't exist):
    ```sh
    mkdir -p ~/.ssh
    ```
    - Open the authorized_keys
    ```sh
    nano ~/.ssh/authorized_keys
    ```
    - Paste your public key into the file and save
    - Set the correct permissions:
    ```sh
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys
    ```
    If everything is set up correctly, you should be able to log in without being prompted for a password.
- Update GitHub Actions Workflow
    - Go to the repo Settings
    - Click on Secrets and variables > Actions
    - Create a secret with the name CONTABO_KEY and paste your private key:
    ``sh
    cat ~/.ssh/id_rsa
    ```
    Copy the output and paste it into the secret field.
- Change something in submodule to test Actions Workflow