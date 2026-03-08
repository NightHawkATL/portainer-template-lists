Complete docs are here: https://go2docs.graylog.org/current/downloading_and_installing_graylog/docker_installation.htm

**By default, Graylog will use UTC time for all logs. If you wish to change this, you will need to set the timezone of the device/server you are running it on.
   `sudo timedatectl set-timezone {timezone-goes-here}` at the command-line prompt.
You can check the current timezone by using `timedatectl` at the command-line prompt.


1. Use the following command to create your GRAYLOG_PASSWORD_SECRET:

   `< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-96};echo;`

3. Then, create your GRAYLOG_ROOT_PASSWORD_SHA2:

   `echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1`

3. Now, open the env file and add the output from the previous steps to your environment file for the `GRAYLOG_PASSWORD_SECRET` and `GRAYLOG_ROOT_PASSWORD_SHA2` values respectively.

4. Open and inspect the Compose YAML file. You can make any changes to the configuration settings as necessary at this time. For more information on this file and how to adjust configuration settings, see [Graylog and Docker](https://go2docs.graylog.org/current/downloading_and_installing_graylog/graylog_and_docker.htm#Graylog2).

5. Deploy the Graylog application with Docker Compose

##############################################################################
If the server/service/device that you wish to add to Graylog does not have an option to directly connect to a syslog server, you will need to take action to install rsyslog (linux) and configure it to send the logs over to Graylog.

1. `sudo apt update`
2. `sudo apt install rsyslog`
3. Open the rsyslog.conf file with `sudo nano /etc/rsyslog.conf`.
4. Add `*.* @{graylog_server_ip}:{port}` to track all logs. Putting each device on its own port will allow you to more easily track and connect to different streams easier. 
##############################################################################

The initial username is admin and the password will be provided in the container logs. You will need to login and start the "pre-flight" steps. The step where you are setting up a cert for the datanode will take some time. Just wait for the indicatoir to show a green label for the instance. Once complete, you will need to sign-in with the username admin and the password that matches the one you used to setup the SHA2 in the .env file. 

- Once logged in, you will need to go to System > Inputs. Here is where you will setup each device, server, or similar for Graylog to bring in the logs. Most inputs will typically use "syslog UDP" from the selection drop-down at the top. Once chosen, click the "Launch new input" button.
<img width="750" height="147" alt="image" src="https://github.com/user-attachments/assets/39c78259-084e-48dd-a5be-25e2bbdeb3d9" />

- Next, you will fill in the name you wish to use for the input (server/service name).
- Set the port you want to use (I pre-loaded ports in the compose that you can rename as used and not have to re-deploy each time you want to add a new port).
- Fill in the "Override name, if you wish. This will show whatever you choose to show up in the logs search view to help distinguish between feeds when viewing everything at once.
<img width="615" height="717" alt="image" src="https://github.com/user-attachments/assets/3a3df342-a3ce-469e-b7cb-a6db2e055805" />

- Decide if you want to "Store full message" or "Expand structured data" and check the boxes or leave them un-checked based on your decision.
- You can change the timezone for the data so that it is strictly tracked to a certain timezone, if you wish. If you choose to keep it blank, it will default to UTC.
- Click "Launch input".
<img width="603" height="591" alt="image" src="https://github.com/user-attachments/assets/bde068c5-72af-4f9a-bdff-0c694b5e547b" />

Once the input is setup, you will have an entry similar to:
<img width="2139" height="378" alt="image" src="https://github.com/user-attachments/assets/cc765632-2e3f-45b5-a9f7-9fc42957fbbf" />

- You will need to click on the yellow "Set-up input" button to setup the input so that Graylog knows how you want to store your data/logs. Anywhere it asks for a title, name, or prefix, I will always use the same name so that the connections for everything make more sense.
- In the new window, you will need to click "Create stream".
  <img width="621" height="534" alt="image" src="https://github.com/user-attachments/assets/1436012a-3cc9-45f2-b168-7edfc130bee4" />

- You will need to give the stream a title and optionally a description.
- You will then need to create a new index set by pressing the button to do so.
  <img width="552" height="816" alt="image" src="https://github.com/user-attachments/assets/da93e84b-a5b3-4945-a7b7-c3529f1c0dbf" />

- You can choose from one of the  three default templates to get started with. the logs do not take up a lot of room but if you wish to store them for longer than the options shown, you will need to create a new template. You will also need to watch the storage location and make sure that your storage isn't filling up too fast. It all depends on how long you wish to have access to the logs and when you want them deleted. Check the Graylog docs for further explination.
  <img width="612" height="738" alt="image" src="https://github.com/user-attachments/assets/759cc7e6-4bf3-4908-9b1b-a7bc857711c4" />

- On the next screen, you will need to set a name, description and a prefix. Please note the highlighted requirements for the prefix.
- after those are set, you can scroll to the bottom to create the index set.
  <img width="1041" height="426" alt="image" src="https://github.com/user-attachments/assets/84c8367e-1d0c-4fc0-9db8-3491e2679d83" />
  <img width="2157" height="759" alt="image" src="https://github.com/user-attachments/assets/dd8bd3cb-ff75-42e0-a341-bd87dafd5141" />

- You can close the tab that opened to create the index set and go back to the strream configuration once you verify the index set is listed.
  <img width="843" height="147" alt="image" src="https://github.com/user-attachments/assets/ffac8438-f1aa-4c35-93dd-10666e2da821" />

- You should see the newly created index listed in the drop-down. Chose this for this stream and then click the "Next" button.
  <img width="474" height="426" alt="image" src="https://github.com/user-attachments/assets/4ab4d05d-5f9e-4e73-ab7b-42f40e21d491" />

- You should now be at the "launch" section. You will need to "Start input" to get things going using the stream, index, and retention policy you have set previously. Once it is started and everytrhing has a green check-mark, you can close the dialog box.
  <img width="498" height="228" alt="image" src="https://github.com/user-attachments/assets/dbc5614f-d1c8-4ef0-af95-94e9d3e273d0" />
  <img width="504" height="411" alt="image" src="https://github.com/user-attachments/assets/c852cc49-9f65-4765-bbab-0dbcde1fb364" />

- Your input should now show as "started" with a green tag next to the name. And the yellow "set-up input" buttoin should now show "stop input". This is a great way to stop inputs that may not be used in the future without deleting them so that if you wish to start it back up, everything is set and ready to go.
- I will then click the "Show received messages" button to be taken to a search where only the messages for the input just setup will show.
  <img width="2151" height="303" alt="image" src="https://github.com/user-attachments/assets/89e58e1c-2d5b-497a-bfdd-7af2cdbe2a0c" />

- This will allow you to see if the logs are being received or not and take you r fist look at the logs and see how they are coming in. If everything looks correct and no strange characters or garbled information, you can then save the search to recall or "load" it up in the future without knowing how to use the search bar. You can pre-set some options like the time-frame you wish for it to start at. I like to use "last 30 minutes" to start off with and then scale up or down from there. You can also be very specific on start and end times.
  <img width="2130" height="483" alt="image" src="https://github.com/user-attachments/assets/4a51928e-0205-4b2c-b567-63eb3e535c68" />
  <img width="138" height="384" alt="image" src="https://github.com/user-attachments/assets/314852df-1229-45c6-8463-7f8d96b09771" />
  <img width="588" height="495" alt="image" src="https://github.com/user-attachments/assets/f4486e95-0a42-4fbe-902f-5a853e26f670" />


You have now sucessfully setup your first input, stream, and index. You will need to do the same thing for each additional input you wish to add.
