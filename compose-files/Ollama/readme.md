In order to get this and Invoke-AI to run as expected, you need to have a VM setup with docker and also have the nvidia drivers installd, along with the nvidia cuda toolkit.
You also need to have blacklisted the nouveau drivers on Proxmox and setup GPU passthrough correctly.

If this is a fresh VM, you will need to follow these steps. (this is assuming that you are running the VM on Proxmox) 

1. Shut down the VM.
2. Go to the Proxmox shell and type "cd /etc/pve/qemu-server"
3. Look for the XXX.conf file for the VM number of the one that you are working with.
4. Open the conf file with the editor of your choice.
5. Look for the CPU line and set it to look like this: "cpu: host,hidden=1".
6. Save and exit the editor.
7. 
