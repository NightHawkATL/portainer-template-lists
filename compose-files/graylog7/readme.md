Complete docs are here: https://go2docs.graylog.org/current/downloading_and_installing_graylog/docker_installation.htm


1. Use the following command to create your GRAYLOG_PASSWORD_SECRET:
   `< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-96};echo;`

3. Then, create your GRAYLOG_ROOT_PASSWORD_SHA2:
   `echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1`

3. Now, open the env file and add the output from the previous steps to your environment file for the `GRAYLOG_PASSWORD_SECRET` and `GRAYLOG_ROOT_PASSWORD_SHA2` values respectively.

4. Open and inspect the Compose YAML file. You can make any changes to the configuration settings as necessary at this time. For more information on this file and how to adjust configuration settings, see [Graylog and Docker](https://go2docs.graylog.org/current/downloading_and_installing_graylog/graylog_and_docker.htm#Graylog2).

5. Deploy the Graylog application with Docker Compose:
