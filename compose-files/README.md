# Compose-File

This section houses some of the compose files I use for docker to spin up containers quickly. You will need to edit them to work with your personal storage preferences and provide any passwords that are needed or other specific data or info ("${DATA_HERE}" locations).

I have recently put the "docker-compose.yaml" files into their respective folders to make it a little easier to adopt the stack or conatiner into Docker Compose or Portainer.

## Connecting directly to this repo to grab compose files in portainer

1. Create a new stack and choose "Git Repository"
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/52290c02-be16-482e-8cc1-38fb21f131db)

2. Go to the main page of this repo and click the green "code" button and copy the URL to the ".git file.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/9fd8ef7f-3f00-42c8-a356-210c24b89093)

3. Add the url to the "Repository URL" test box.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/ad5c32cf-bd94-4324-aa22-82cf4d999368)

4. Fill in the "Compose path" relative to the stack you wish to deploy.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/2621153a-3f13-4de1-9a98-c4f323111889)
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/efdf0e3e-2f31-46a1-91bf-18c993a119dc)

5. If there are variables in the stack, you will need to define them within portainer or as a .env using one of these buttons.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/546267fb-2338-4002-8de0-aa47201988db)

6. Once you have satisfied all of the requirements, you can deploy the stack with ease. You will no longer need to copy and paste the stack compose, you will just need to provide the variables referenced.
