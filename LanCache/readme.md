# **LanCache Setup for AdGuardHome w/Unbound**

I installed LanCache on a VM that has a small “internal” storage and a large cache storage using a pair of 3TB drives in a mirror. I followed the basic steps to deploy LanCache using their script and configuring the .env file. Once deployed, I started working on adding everything to work with AdGuard. If you haven't worked with LanCache before, it will require good resources for it to run smoothly. I gave my LanCache server decent resources and it is using as much as I give it.
![image](https://github.com/user-attachments/assets/bd0487ff-5e1b-4351-a6c1-9dbfa6d806bb)
![image](https://github.com/user-attachments/assets/df755e0c-afe8-4a38-8f7c-182a78e27ac5)
![image](https://github.com/user-attachments/assets/4ca38af1-7582-44f1-818f-f38673b4691a)

1. You will need to deploy the prefill if you want to pre-load the cache with games. Chose one or any combo you wish:
  - [https://tpill90.github.io/steam-lancache-prefill/install-guides/Linux-Setup-Guide/]
  - [https://tpill90.github.io/epic-lancache-prefill/install-guides/Linux-Setup-Guide/]
  - [https://tpill90.github.io/battlenet-lancache-prefill/install-guides/Linux-Setup-Guide/]
2. Download and configure the cache-domains setup from [https://github.com/uklans/cache-domains/tree/master/scripts] and follow thier instructions to get started. I customized mine a little as shown below.
  - *If you are running AdGuardHome in an LXC or VM and not in Docker, you can download and run the scripts there to make it easier to copy the scripts output files*
  - *If you are running AdGuardHome in Docker, you will have to get access to the folders and files needed to complete this (not within this scope as I do not have a Docker instance to test with*
  - *If you are running AdGuardHomeSync, it will not sync the files needed to complete the setup on 2 or more instances. You will have to do the steps listed below for each AdGuardHome server you are running*
3. Locate the scripts folder and edit the config.json file to match the below:

![image](https://github.com/user-attachments/assets/1e40ac9b-cd64-4198-87ab-d12eb6fb4b3c)

4. Run the create-unbound.sh script for it to create a folder and file in the “/output/unbound” folder.
5. Follow the directions to send the file to the unbound folder as shown in the CLI after it completes. Do this for each AdGuard server setup on the network.
6. After this is done on all AdGuard servers, reboot them to allow the configuration changes to take effect in unbound (or restart the unbound service).
7. In the AdGuard interface, verify that the upstream DNS server is “127.0.0.1:5335” to utilize unbound and follow the DNS rewrites for unbound and LanCache.
8. Once that is done, you will need to verify that everything works on the computer or LAN.
  - First, you will want to “flush” your DNS cache. In windows it is `ipconfig /flushdns`.
  - Then, do an nslookup to lancache.steamcontent.com `nslookup lancache.steamcontent.com`.
  - You should see a result where it locates the entry in your DNS (AdGuardHome) and then points to the LanCache server IP.
    ![image](https://github.com/user-attachments/assets/0ccbeb5b-3fba-4ccc-a00a-3f96132218c7)


9. Run a prefill test to verify that it can successfully connect to the Steam server. If you are using other prefill scripts for other services, you will need to or want to test those as well.
10. Once you have verified that LanCache is working with AdGuard, you can start downloading and caching games and Windows updates.



==**Bonuses**==

I deployed a webui using this repo: [https://github.com/devedse/DeveLanCacheUI_Backend?tab=readme-ov-file#how-to-run-this](https://github.com/devedse/DeveLanCacheUI_Backend?tab=readme-ov-file#how-to-run-this)
I added an entry in each AdGuardHome DNS Rewrite section to point "steam.cache.lancache.net" to my LanCache server so that both will resolve locally.
I completed the tasks of setting up a timer and a service for each prefill (Steam, Epic, and BattleNet) as described on the wiki for each listed below.



==**Resources used:**==

[https://lancache.net/docs/useful-commands/](https://lancache.net/docs/useful-commands/)

[https://github.com/uklans/cache-domains/tree/master/scripts](https://github.com/uklans/cache-domains/tree/master/scripts)

[https://tpill90.github.io/steam-lancache-prefill/install-guides/Linux-Setup-Guide/](https://tpill90.github.io/steam-lancache-prefill/install-guides/Linux-Setup-Guide/)

[https://tpill90.github.io/epic-lancache-prefill/install-guides/Linux-Setup-Guide/](https://tpill90.github.io/epic-lancache-prefill/install-guides/Linux-Setup-Guide/)

[https://tpill90.github.io/battlenet-lancache-prefill/install-guides/Linux-Setup-Guide/](https://tpill90.github.io/battlenet-lancache-prefill/install-guides/Linux-Setup-Guide/)

[https://github.com/devedse/DeveLanCacheUI_Backend](https://github.com/devedse/DeveLanCacheUI_Backend)
