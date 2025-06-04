## Basics
For the Arrs stack, I have used variables to make it easy to set things up so it follows the TRaSH Guides correctly. https://trash-guides.info/
You will need to eihter create a .env file (I may add this myself later) to configure the variables for Docker Compose or add environmental variables in portainer.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/f3277094-f36a-4561-b3d9-074d78fb8eec)

## Connecting SABnzbd
Within each "Arr" app, you will need to add a connection for SAB following the steps below.
  1. Open an Arr app (SOnarr, Radarr, etc.) and go to Settings > Download Clients and click the add (+) button.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/b495f2a7-bc97-451d-9178-12767c46a53c)

  2. Select SASBnzbd from the list.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/d4772f17-7b80-4b6f-a66c-e9f2020d41f4)

  3. Fill in the required information and then "Test" and "Save" if you get a green check/tick.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/c2ec9c34-a901-4b05-a9e3-c3ec92954bf1)


## Connecting Media & Plex/Jellyfin/Emby in the Arrs
  1. Under Settings > Media Management, you will need to point to the ("${NET_SHARE}") location provided in the stack and conencted to the container via the host OS.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/78103b0e-f597-46f3-affe-ab233865a30a)

  2.  In Settings > Connect, click the plus (+) button and choose the connections you want to add. I would suggest at least the main service (Plex/Jellyfin/Emby) but there are also others that you can choose from. Just follow the directions that are porvided within each to make the connections active.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/1e2b4882-3e41-49c9-9790-466aa5d48899)


## Connecting Indexers
Indexers are controlled with Prowlarr. You will need to add the indexers from the list for the type of indexer you want to use (Torrent/NZB) then continue below (this is not covered as to keep me from telling you how to obfuscate the laws that may be in your country.
  1. Open Prowlarr and go to Settings > Apps and click the plus (+) button.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/3b5321e4-2daa-4fc0-82a5-3a14a6dfe278)

  2. Choose the specific other Arr that you wish to connect with to allow the Arrs to access and search the indexers you have listed.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/ac63d285-2dd9-4d52-838d-45f683598da1)

  3. Once you have them all added, test the connections one last time and then sync them.
![image](https://github.com/NightHawkATL/portainer-template-lists/assets/8395658/2a6c593d-c85c-4078-86cd-9516d9e31edc)

After following all of this, you should be able to search and trigger downloads from the Arrs with SAB.


## Overseerr https://overseerr.dev/ https://github.com/sct/overseerr
Overseerr is a great app to make it easy to find shows and movies and track requests and issues. I will not cover the configuration of it here but there are a few video oan Youtube covering this and a few writeups as well. 
