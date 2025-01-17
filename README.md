# DEVOPS Assignment

## Overview
This project is a requirement for completion of the DEVOPS class taught by instructor Kheang KimAng.

## Acknowledgement

## Assignment Instruction and Requirement
Given fronten and backend repository, fork them
- Frontend: https://github.com/tfd-ed/tfd-nest-boilerplate
- Backend: https://github.com/tfd-ed/tfd-nuxt-tailwind-boilerplate

What to do:
1. Create a new Github repository that submodule forked fronten and backend
2. Create docker compose that combine fronten and backend (also DB and Nginx and other services)
3. Deploy the repository in VPS and map the domain appropriately (last-day.***)
4. Build CI/CD pipeline to trigger redeployment upon push to the forked repository on VPS

## Setup Instructions (for starting project from scratch)
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
- docker-compose.yml
- Dockerfile-backend
- Dockerfile-frontend
- Dockerfile-nginx
- .gitmodules
- .env.backend.example
- .env.frontend.example
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