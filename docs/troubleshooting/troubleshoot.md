
## Troubleshooting RStudio Team products

In this session you will learn:

* First-hand from the RStudio Support team about common pitfalls
* About tools for identifying the root cause
* Other tips and techniques to stay on the happy path





## Introduction




### General troubleshooting tips

Identify what the error is and where it's coming from

* An error reported in the IDE might arise from:
    - User code, an R package, or R itself
    - The RStudio IDE
* How widespread is this issue? Does it affect one user, the entire server, or the whole cluster?
* Can you reproduce the problem?
* Identify the root cause of the error
    - Any recent changes?
    - Specific users or groups involved?
    - Specific code being run? 

Change **one thing at a time** to try and isolate the issue



### Things RStudio Support looks at (and you should too):  

* Log files
* R   
* Local environment and environment variables 

Common issues:

* Licensing  
* Configuration
* Authentication  
* Network issues  



## Log files




### RStudio log files


Product               | Log file
--------------------  | ------------------
RStudio Server Pro    | `/var/lib/rstudio-server/monitor/log/rstudio-server.log`
Shiny Server Pro      | `/var/log/shiny-server.log`
RStudio Connect       | `/var/log/rstudio-connect.log`
Package Manager       | `/var/log/rstudio-pm.log`



### System log files

Area                 | Log file
-------------------  | ----------------------------------------------------
Server log files     | `/var/log/syslog` <br/> OR <br/> `/var/log/messages`
Authentication logs  | `/var/log/auth.log` <br/> OR <br/> `/var/log/secure`



### For RStudio Connect deployment issues:

* Deployment log generated in the console or retrieved with

```R
library(rsconnect)
rsconnect::showLogs()
```




### Log file example

![image](assets/log_file_example.png)



## Troubleshooting R



### Troubleshooting R

* Almost all RStudio products depend on R being installed successfully to run.
    - Look for errors related to R in the server logs
* Can R be launched manually and can the user's code be run in R without any errors?
* How was R installed? 
    - From source or [pre-compiled binaries](https://docs.rstudio.com/resources/install-r/)? If so, were all correct flags and capabilities set?  

```sh
grep configure R_HOME/etc/Makeconf
```

![image](assets/grep_makeconf.png)
        


### Troubleshooting R (continued)

Are all necessary dependencies installed? 

```sh
apt-get build-dep r-base
yum-builddep R
```

Are the permissions set correctly to allow `r-x` (read and execute) by all?      

```sh
namei -l /path/to/R
```

      
![image](assets/perm_check.png)



### Troubleshooting R (multiple versions)

      
Are there multiple versions of R on the system?

```sh
apt-get install mlocate
updatedb
locate libR.so
```

```
## locate libR.so
/opt/R/3.4.4/lib/R/lib/libR.so
/opt/R/3.5.1/lib/R/lib/libR.so
```



If so, see questions above for all versions in addition to checking that the expected version is loaded.



## Troubleshooting the environment



### Local environment 

What operating system are you running on?

```sh
uname -a

cat /etc/*-release
```

Are you running with load balancing or in a virtual container such as Docker, etc?



### Environment variables

Does your setup rely on specific environment variables to be set correctly?

If so, are those set correctly in R as well as RStudio? 

* Proxy settings
* Java
* Database connections
* System library path issues
    - For example, `LD_LIBRARY_PATH`, `PATH`, etc.
    
R pulls from several startup files

* Refer to the R Views blog article ["Understanding R’s Startup"](https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/)




### Configuration

Look for any errors in the startup.  

* You can view the live log during startup using
  
```sh
tail -f /path/to/log
```

Read through the admin guides and make sure you have the correct formatting

Make sure you're on the right version of the product compared to the admin guide!

![image](assets/connect_error_example.png)



## Expired licenses



### Expired license

![image](assets/license_error.png)



### Expired license

* Things to try:

    - Check time and time zone  `timedatectl`
    - Resync if needed, e.g. `sudo hwclock -w`
    - Restart

* Deactivation tool: http://apps.rstudio.com/deactivate-license/

* Long-term solutions
    - Consider switching to offline setup

* RStudio is working on improvements




## Authentication



### Authentication

* Difficult for RStudio Support to troubleshoot as it depends on external configuration values unknown to us.

* Does it work outside of the RStudio product?

    * Often possible to copy over working setup from other systems or services.
    * For RStudio Server Pro
    * `pamtester` utility lets you test outside RStudio systems.
  
```sh
sudo /usr/lib/rstudio-server/bin/pamtester \
  --verbose rstudio <username> authenticate
```
  
* Check server log files including `access.log` files.
* Check connections to any external authentication providers
    - Kerberos, Active Directory, etc.



## Network issues



### Network issues


Network issues are outsidet the scope of the [RStudio support SLA](https://rstudio.com/about/support-agreement/).

This means we're limited on the help we can provide.

Things to check:

* Connectivity
* SSL / certificate
* Firewall / security / proxy settings


![image](assets/connect_network_error.png)



## Helpful resources



### Helpful resources

RStudio documentation

Document                   | Location
--------------             | ---------------------
Admin guides / user guides | https://docs.rstudio.com
FAQs / articles            | https://support.rstudio.com
Shiny docs                 | http://shiny.rstudio.com/articles/ 

Other resources

Document                   | Location
--------------             | ---------------------
RStudio Community          | https://community.rstudio.com
RViews blog                | https://rviews.rstudio.com/
License deactivation app   | http://apps.rstudio.com/deactivate-license/



## Working with support



### Working with support

Things that help:

* Describe error messages / what users are seeing
* Describe system information
    - OS, R version, product version
* Attach server log files
* Attach configuration files

Getting help:

* Email the support team at [support@rstudio.com](mailto:support@rstudio.com), OR
* File a ticket at [https://support.rstudio.com/hc/en-us/requests/new](https://support.rstudio.com/hc/en-us/requests/new)
  
  
  


### Any questions?

Send an email to [support@rstudio.com](mailto:support@rstudio.com)!



## Your turn






Next complete the exercise.

