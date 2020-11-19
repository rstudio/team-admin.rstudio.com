
## Exercise 1

In this exercise you determine why a new version of R added to the server does not work with RStudio Server Pro. 


### Task: Install pre-compiled version of R

_**Hint:** Use `sudo su` or `sudo -i` to open an interactive root prompt instead of typing `sudo` with every command._

First, add the pre-compiled version of R to the server:

```sh
sudo cp /usr/share/class/class-repo/06_troubleshooting/3.0.0.tar.gz /opt/R/
cd /opt/R
sudo tar xf 3.0.0.tar.gz
ls -la
```

Now, restart RStudio Server for the new version of R to be detected:

```sh
sudo service rstudio-server stop
sudo service rstudio-server start
```

### Task: Review the error log

Do you see any errors?  Review the output of:

```sh
sudo service rstudio-server status -l
sudo journalctl -u rstudio-server
```


!!! warning
    You should see this error in the logs:

```
ERROR R shared library (/opt/R/3.0.0/lib/R/lib/libR.so) not found. 
If this is a custom build of R, was it built with the --enable-R-shlib option?
```

### Task: Investigate

How do you investigate this further?  

Do you have permissions to access `libR.so` if it exists?  
 
```sh
sudo namei -l /opt/R/3.0.0/lib/R/lib/libR.so
```

Does `libR.so` exist anywhere else?

```sh
sudo updatedb
sudo locate libR.so
```

!!! info
    `updatedb` updates the database used by `locate`

What `./configure` flags was this version of R compiled with?  Was it built with the `--enable-R-shlib` option?

```sh
grep configure /opt/R/3.0.0/lib/R/etc/Makeconf
```

### Task: Reset

Once finished, remove the version of R and start the service:

```sh
sudo service rstudio-server stop
sudo rm -rf /opt/R/3.0.0
sudo service rstudio-server start
```

## Exercise 2

### Task: Troubleshoot an existing R version

Next you determine why an existing version of R on the server does not work for users anymore.

First, execute the `existing_R_version` script to begin the scenario:

```sh
cd /usr/share/class/class-repo/06_troubleshooting/
sudo chmod +x existing_R_version
sudo ./existing_R_version
```

Next, restart RStudio Server.

```sh
sudo service rstudio-server stop
sudo service rstudio-server start
```

### Task: Check for errors

Do you see any errors, when you review the output of:

```sh
sudo service rstudio-server status -l
sudo journalctl -u rstudio-server
sudo service rstudio-server stop
sudo rstudio-server verify-installation
sudo service rstudio-server start
```

You should observe this warning:

```
WARNING R version home directory not found: /opt/R/3.5.1/lib/R;
```

### Task: Investigate

How do you investigate this further?  

* Does the home directory exist for R 3.5.1 and are the permissions OK?  
 
```sh
sudo ls -la /opt/R/3.5.1/lib/R
```

* Was it detected by RStudio Server Pro in this internal file?

```sh
cat /var/lib/rstudio-server/r-versions
```

_This undocumented r-versions file contains information regarding the R versions detected by RStudio Server Pro_

* Can you launch that version of R from the command line?

```sh
/opt/R/3.5.1/bin/R
```

* What have you missed?  Was there any command tried when troubleshooting the last R issue?
  
_Hint:  `namei -l /opt/R/3.5.1/bin/R`_

Once you identified the issue, please correct, then restart the service. 
  
### Solution

The permissions on `/opt/R/3.5.1` were restricted to `rwx` by root only.  This is a common oversight when installing additional versions of R.  To resolve, reset permissions to allow `r-x` by all:

```sh
sudo chmod 755 /opt/R/3.5.1/
```

## Exercise 3


In this exercise, your users have reported that after logging into Rstudio Server Pro, the session crashes with an `Unable to connect to service error`.  Maintenance was performed recently by your IT group.

### Task: Simulate an R session crash

To begin the scenario, execute the `r_Session_crash` script:

```sh
cd /usr/share/class/class-repo/06_troubleshooting/
sudo chmod +x r_Session_crash
sudo ./r_Session_crash
```
      
Are you able to reproduce the issue with your `admin-user` by logging into RStudio Server Pro or by starting a new session?

### Task: Investigate

How do you investigate the error, `Unable to connect to service`,  further?

Does the `rstudio-server.log` contain anything relevant?  
 
```sh
tail -n 30 /var/lib/rstudio-server/monitor/log/rstudio-server.log
```

What would cause an inability to find `libR.so`?  



Does disabling the execution of the shell profiles resolve the issue?  To try, edit the `rserver.conf` file:

!!! info
    You can find `rserver.conf` at `/etc/rstudio/rserver.conf`

Set the value of `rsession-no-profile` to 1 (TRUE)

```
rsession-no-profile=1
```

Then restart the service:
      
```sh
service rstudio-server stop
service rstudio-server start
```

Are you still able to reproduce the issue with your `admin-user` by logging into RStudio Server Pro or by starting a new session?

!!! info 
    This option, to disable startup scripts, is a good way to troubleshoot the inability for sessions to launch, as it could indicate a conflict is occuring due to environment variables being set in the shell profiles.

 
To track down the source of the issue, review these common startup files:
 
```
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile
```

Does anything appear inaccurate?


### Solution 

The `/etc/profile` script modified the `LD_LIBRARY_PATH` to an invalid value.  

Remember to modify the `/etc/profile` script to remove the invalid line and comment out `rsession-no-profile=1` in your _/etc/rstudio/rserver.conf_ file.
