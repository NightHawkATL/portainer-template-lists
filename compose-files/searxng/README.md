This was built to include gluetun as a VPN encapsulator for searxng to allow for searching to only go through a VPN to further obfuscate searching through any of the providers that searxng supports for search aggregation.

I have added links to most of the relevant pages on the Gluetun GitHub page to provide more information about the different settings and options. 

Gluetun works best with paid VPN providers as there is great documentation on most of the popular services. They also have documentation on using custom providers and even an option for using Wireguard with PIA, but it is not supported within the project yet.

Link to SearxNG settings file: https://github.com/searxng/searxng-docker/blob/master/searxng/settings.yml

Link to SearxNG limiter file: https://github.com/searxng/searxng-docker/blob/master/searxng/limiter.toml

Project is based on a culmination from the SearxNG Docker deployment: https://github.com/searxng/searxng-docker and MrWazaby's original compose for SearxNG with Gluetun: https://github.com/MrWazaby/searxng-vpn-docker. I just wanted to provide my spin to make sure that there are no issues with startup and restarting using dependencies.

I also learned about Gluetun from this video when it came out from NovaSpirit Tech: https://youtu.be/IWj1-j2QWvo?si=DYdgtngZu4_Jy7S5. He also covers the SOCKS5 and HTTP proxy connectivity.

**If you choose to use the HTTP proxy or the ShadowSOCKS proxy and restart the stack, you may get an error stating that the stack could not be stopped or similar errors when working on the container. THis is because you are connected to the proxy and once it goes down, it will appear that you do not have an internet connection. Just disable your proxy connection either on your browser or your network connection to fix this error before stopping or restarting the services.

When using the proxy for your browser, you will need to locate the network settings for your browser and put in the relevant information:

![image](https://github.com/user-attachments/assets/245e90d4-227b-49a6-8358-0d27312cbc64)
