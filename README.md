# portainer-template-lists

This is a list of all of the portainer template lists that I have found over time that I have used at one point in time for adding apps and containers to my HomeLab. They are in no particular order.

All you have to do is copy the URL and add it to the "App Templates" URL in settings of portainer.



Portainer default: https://raw.githubusercontent.com/portainer/templates/master/templates-2.0.json

Pi-Hosted (ARM32): https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-arm32.json
Pi-Hosted (ARM64): https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-arm64.json
Pi-Hosted (AMD64): https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-amd64.json

LinuxServer: https://raw.githubusercontent.com/technorabilia/portainer-templates/main/lsio/templates/templates-2.0.json

Qballjos: https://raw.githubusercontent.com/Qballjos/portainer_templates/master/Template/template.json

SelfHostedPro: https://raw.githubusercontent.com/SelfhostedPro/selfhosted_templates/master/Template/portainer-v2.json

400+ templates from Lissy93: https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json

MycroftWilde: https://raw.githubusercontent.com/mycroftwilde/portainer_templates/master/Template/template.json

MikeStraney: https://raw.githubusercontent.com/mikestraney/portainer-templates/master/templates.json

NTV-One: https://raw.githubusercontent.com/ntv-one/portainer/main/template.json

Don't forget to check out the compose files I share here: https://github.com/NightHawkATL/portainer-template-lists/tree/main/compose-files

# Compose Files

I have recently put my compose files in their respective folders and the yaml inside is a docker compose file that you should be able to do a git clone from and directly spein up the stack or custom container.

**Please make sure that you either fill in the data needed in the "${DATA_HERE}" locations or you setup environment variables to provide the information.
- If you are using Portainer, you can use the variables section.
- If you are using Docker Compose, you will need to create a ".env" file and reference that in the docker-compose.yaml file.
