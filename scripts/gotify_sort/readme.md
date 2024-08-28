Before starting, If you have some applications with a first letter that is upper-case and some that are lower-case, and wish to have the sorting done correctly, all of the cases need to match. Otherwise, Upper-case A-Z will be first and lower-case a-z will be second.

Please read through these steps first before continuing. I take no responsability from damage or issues after running this script and something breaks. 

**Backup your files before you start!**

1. copy the contents of this file or download it to the folder where gotify's sqlite database is.
2. install sqlite3 on your host machine, VM, or LXC where docker and the gotify container data is located.
3. stop the gotify container as running this with the database active will wipe the contents.
4. make a copy of your current database file and save it either in a different folder or give it a new name or download it for safe keeping.
5. navigate to the gotify folder where the sqlite and script are located.
6. run "chmod +x {script_name}.sh". If you get an error, re-run the command by using "sudo!!"
7. run "sudo ./{script_name}.sh"
8. You should get a message stating "Applications table IDs updated successfully" upon completion.
9. re-start the gotify container and verify that the applications have ben re-ordered into alphabetical order.
10. If the applications are blank or missing, just stop the container and replace the database file with the one you backed up earlier.

As you add more applications, they will be out of order. You will need to re-run this script each time you add a new application to re-sort them correctly.


Thanks to [samcro1967](https://github.com/samcro1967) for providing his script on [this](https://github.com/gotify/server/issues/358#issuecomment-2316326913) thread. I only verified that it works and created a write-up. I am putting it here to share with others I converse with to make it easy for them to replicate.
