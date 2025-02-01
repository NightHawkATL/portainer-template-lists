In order to get this and Invoke-AI to run as expected, you need to have a VM setup with docker and also have the nvidia drivers installd, along with the nvidia cuda toolkit.
You also need to have blacklisted the nouveau drivers on Proxmox and setup GPU passthrough correctly.

If this is a fresh VM, you will need to follow these steps. (this is assuming that you are running the VM on Proxmox) 

1. Shut down the VM.
2. Go to the Proxmox shell and type "cd /etc/pve/qemu-server"
3. Look for the XXX.conf file for the VM number of the one that you are working with.
4. Open the conf file with the editor of your choice.
5. Look for the CPU line and set it to look like this: "cpu: host,hidden=1".
6. Save and exit the editor.
7. Follow the steps [here]([https://github.com/user-attachments/assets/e0b5828f-44ad-4431-88e4-d27fe93cd9ec](https://github.com/NightHawkATL/portainer-template-lists/blob/main/compose-files/Ollama/proxmox-steps.txt)) to configure Proxmox to block the GPU drivers.
8. Once this is done, start the VM and login.
9. Run "sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf".
10. Run "sudo bash -c "echo options nouveau modset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf".
11. Run "sudo update-initramfs -u".
12. Reboot the VM.
13. Confirm no drivers running for NVIDIA GPU. Run" sudo lspci -v" Find the NVIDIA GPU. There should be no 'Kernel driver in use:' line.
14. Run "sudo apt update"
15. Run "sudo apt install build-essential libglvnd-dev pkg-config".
16. Locate the latest drivers for your GPU from the NVIDIA website. download them on the VM using "wget {driver URL here}. the driver should be a .run file.
17. Now run "sh ./NVIDIA-{whatever is avter this from the filename}.run.
18. Follow the prompts to install the drivers. Once the build is done, you may get a prompt to load 32-bit libraries and also set it to run when X windows boots.
19. Once that is done, you can run "sudo lspci -v" to make sure that the drivers have installed. You should see:
![image](https://github.com/user-attachments/assets/b3013343-0c20-467f-b7e3-5c4629d526c2)
20. If what you get is similar, you can run "nvidia-smi" to verify that the drivers are running. You should see:
![image](https://github.com/user-attachments/assets/79ed1362-f606-4519-81bf-d583419965b9)
21. Now you will need to install the NVIDIA container toolkit. Visit [https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) to install the cuda toolkit. Follow the "Install with APT" section and then follow-up with the "Configuration" section to setup docker to use it.
22. Reboot just to make sure everthing is setup and running.
23. After the reboot and login, run "nvidia-smi" to make sure tha the drivers loaded at startup and the GPU is still found.

Once all of this is done, you will be able to copy the stack from the compose.yaml to deploy the stack and run Ollama, OpenWebUI and begin using it.
