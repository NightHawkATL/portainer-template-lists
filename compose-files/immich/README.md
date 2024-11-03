This stack is based off of the official Immich stack. I have just added extra safeguards on the server and machine learning containers to wait for all dependencies to be online and healthy before starting the Immich server.

I have found this to be beneficial to the stack starting after a server reboot so that the Immich Server isn't stuck in a startup loop. I have made sure that the postgres server healthchcek works correctlyand have
worked on the timings to make sure that all healthchecks work. There are also watchtower-specific dependencies to allow watchtower to know that other services have to be running before restarting the server after an update.
Watchtower is not a part of this stack so you will need to spin it up yourself, if you don't already. If you don't use watchtower, the extra dependenciy labels won't affect this stack at all.

I have also added the Immich Public Proxy container as a part of this stack. (https://github.com/alangrainger/immich-public-proxy)
