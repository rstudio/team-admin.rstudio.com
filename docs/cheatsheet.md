---
cheatsheet: true
---

# RStudio Team System Admin :: <b>CHEATSHEET</b>

<!-- ribbon from https://codepo8.github.io/css-fork-on-github-ribbon/ -->

<span id="forkongithub">
  <a href="https://github.com/sol-eng/sys-admin-cheatsheet">Fork me on GitHub</a>
</span>

<!-- Include iframeResizer library (https://github.com/davidjbradshaw/iframe-resizer) -->
<script src=https://rstudio-cdn.s3.amazonaws.com/pro-admin/iframeResizer/iframeResizer.contentWindow.min.js></script>




## Documentation

Topic                               | Link
:----                               | :-------------
General                             | https://docs.rstudio.com/
Installing R                        | https://docs.rstudio.com/resources/install-r/
Installing Python                   | https://docs.rstudio.com/resources/install-python/
RStudio Server admin guide          | https://docs.rstudio.com/ide/server-pro/
RStudio Connect admin guide         | https://docs.rstudio.com/connect/admin/
RStudio Package Manager admin guide | https://docs.rstudio.com/rspm/admin/
Pro Drivers                         | https://docs.rstudio.com/pro-drivers/


Pre-requisites:

* [Supported platforms](https://rstudio.com/about/platform-support)
* [Product requirements](https://support.rstudio.com/hc/en-us/articles/360015177453-RStudio-professional-product-requirements)

## Installing R

### Install R from pre-compiled binaries

Recommended best practise is to install R from pre-compiled binaries

https://docs.rstudio.com/resources/install-r/

For example, on Ubuntu 18.04 for R version 3.6.1.

```sh
sudo sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list
sudo apt-get update
sudo apt-get install gdebi-core

export R_VERSION=3.6.1

curl -O https://cdn.rstudio.com/r/ubuntu-1804/pkgs/r-${R_VERSION}_1_amd64.deb
sudo gdebi r-${R_VERSION}_1_amd64.deb
```

This script installs into `/opt/R/...`

Verify installation:

```sh
/opt/R/${R_VERSION}/bin/R --version
```


## RStudio Server Pro

Admin guide: https://docs.rstudio.com/ide/server-pro/

### Starting, stopping and restarting

Running the verify installation command:

```sh
sudo rstudio-server stop
sudo rstudio-server verify-installation
sudo rstudio-server start
```

To restart the RSP service and check its status, run these commands (with `sudo` if necessary):

```sh
sudo rstudio-server restart
sudo rstudio-server status
```

### Status

```sh
rstudio-server status
```


### Error logs

The locations of the various server log files:

```sh
ls /var/log/rstudio-server
```

```sh
cat /var/log/rstudio-server/rserver-http-error.log
```

The server log is at:

```sh
tail /var/lib/rstudio-server/monitor/log/rstudio-server.log
```


## RStudio Connect 

Admin guide: https://docs.rstudio.com/connect/admin/

### Config file

```sh
/etc/rstudio-connect/rstudio-connect.gcfg
```

### Systemd vs upstart

Distributions using systemd include Red Hat/CentOS 7, Red Hat/CentOS 8, SUSE 12, Ubuntu 16.04, and Ubuntu 18.04.

* `systemctl start rstudio-connect`


Distributions using Upstart include Red Hat/CentOS 6 and Ubuntu 14.04.

* `start rstudio-connect`

### Starting and stopping

```sh
sudo systemctl start rstudio-connect
sudo systemctl stop rstudio-connect
sudo systemctl restart rstudio-connect
sudo systemctl reload rstudio-connect
```

### Checking status

```sh
sudo systemctl status rstudio-connect
```


### Log files

```sh
sudo tail /var/log/rstudio-connect.log
```


### Get the diagnostics script

```sh
/opt/rstudio-connect/scripts/run-diagnostics.sh
```

## RStudio Package Manager 

Admin guide: https://docs.rstudio.com/rspm/admin/

```sh
sudo systemctl status rstudio-pm
```

### The rspm command

Try running the `rspm` command on the server instance where RSPM is installed:

```sh
/opt/rstudio-pm/bin/rspm
```

To save keystrokes when typing RSPM commands, create a command alias for the
`rspm` command:

```sh
echo "alias rspm='/opt/rstudio-pm/bin/rspm'" >> ~/.bashrc
```

Run the `rspm` command with no arguments for a list of available commands:

```sh
$ rspm
Available Commands:
add          Add packages to sources
air-gap      Print help for setting up an air-gapped RStudio Package Manager service
archive      Archive packages in sources
clear-cran   Purge CRAN metadata. Cannot be used if any repos subscribe to CRAN.
create       Create entities
delete       Delete entities
edit         Edit repo name and description
fetch        Initiate eager package fetching
help         Help about any command
import       Import SSH keys
info         Print information about sources and repos
list         List entities.
logs         Retrieve logs for package builds
remove       Remove packages from sources
reorder      Reorder repo subscriptions to sources
rerun        Rerun git-builders
run          Run git-builders
subscribe    Subscribe repos to sources
sync         Initiate an ad-hoc sync of the default cran source
unsubscribe  Unsubscribe repos from sources
update       Update curated-cran sources
```

### Working with CRAN

```sh
sync         Initiate an ad-hoc sync of the default cran source
clear-cran   Purge CRAN metadata. Cannot be used if any repos subscribe to CRAN.
```

### Manage repositories and sources

```sh
create       Create entities
delete       Delete entities
list         List entities
update       Update curated-cran sources
```

### Manage packages

```sh
add          Add packages to sources
archive      Archive packages in sources
remove       Remove packages from sources
```

### Working with repositories

```sh
edit         Edit repo name and description
reorder      Reorder repo subscriptions to sources
subscribe    Subscribe repos to sources
unsubscribe  Unsubscribe repos from sources
```

### Utilities

```sh
air-gap      Print help for setting up an air-gapped RStudio Package Manager service
fetch        Initiate eager package fetching
help         Help about any command
import       Import SSH keys
info         Print information about sources and repos
logs         Retrieve logs for package builds
```

### System health check

You have various methods to check the health of your RSPM instance:

1. View the RSPM application logs:

    ```sh
    sudo cat /var/log/rstudio-pm.log
    ```

2. View the RSPM access logs:

    ```sh
    sudo cat /var/log/rstudio-pm.access.log
    ```

3. Check the status of your RSPM license:

    ```sh
    sudo /opt/rstudio-pm/bin/license-manager status
    ```

4. Run RSPM diagnostics:

    ```sh
    sudo /opt/rstudio-pm/bin/run-diagnostics
    ```

5. View diagnostics output:

    ```sh
    cat rspm_diagnostics-report.txt
    ```

## License manager

### View license status

```sh
sudo /opt/rstudio-pm/bin/license-manager status
```

Activate license:

```sh
sudo /opt/rstudio-pm/bin/license-manager activate LICENSE_KEY
```

List of available commands:

```sh
sudo /opt/rstudio-pm/bin/license-manager
```

Supported commands: 

```sh
acquire-lease, acquire-lease-verbose, activate,
activate-offline, activate-offline-request, 
begin-evaluation-offline, ...
```

### Expired license

Things to try:

- Check time and time zone  `timedatectl`
- Resync if needed, e.g. `sudo hwclock -w`
- Restart

### Deactivating a license
    
Deactivation tool: http://apps.rstudio.com/deactivate-license/



## Pro Drivers 

Documentation overview: https://docs.rstudio.com/pro-drivers/

Driver locations:

```sh
cat /etc/odbc.ini 
cat /etc/odbcinst.ini
```



## Troubleshooting

### Troubleshooting R

Almost all RStudio products depend on R being installed successfully to run.
  
* Look for errors related to R in the server logs
  
Can R be launched manually and can the user's code be run in R without any errors?

How was R installed? 

* From source or [pre-compiled binaries](https://docs.rstudio.com/resources/install-r/)? If so, were all correct flags and capabilities set?  

```sh
grep configure R_HOME/etc/Makeconf
```


Are all necessary dependencies installed? 

```sh
apt-get build-dep r-base
yum-builddep R
```

Are the permissions set correctly to allow `r-x` by all?      

```sh
namei -l /path/to/R
```

Are there multiple versions of R on the system?

```sh
apt-get install mlocate
updatedb
locate libR.so
```


### Troubleshooting configuration

Look for any errors in the startup.  You can view the live log during startup using:
  
```sh
tail -f /path/to/log
```

Read through the admin guides and make sure you have the correct formatting

Make sure you're on the right version of the product compared to the admin guide!


### Troubleshooting authentication

It is difficult for RStudio Support to troubleshoot as it depends on external configuration values unknown to us.

Does it work outside of the RStudio product?

* Often possible to copy over working setup from other systems or services.
* For RStudio Server Pro, the`pamtester` utility lets you test outside RStudio systems.
  
```sh
sudo /usr/lib/rstudio-server/bin/pamtester \
--verbose rstudio <username> authenticate
```
  
Check server log files including `access.log` files.

Check connections to any external authentication providers

* Kerberos, Active Directory, etc.


## General Linux tips 

### Operating system version

What OS are you using?

```sh
cat /etc/*-release
```

or

```sh
uname -a
```

### Export environment variable to PATH

```sh
export PATH=$PATH:/opt/R/3.5.0/bin
```

### Persist changes on startup in .bashrc

You can run scripts and define variables on startup by adding lines to your `.bashrc` file:


```sh
echo "alias rspm='/opt/rstudio-pm/bin/rspm'" >> ~/.bashrc
```



<!-- Open all external links in a new tab (https://yihui.org/en/2018/09/target-blank/) -->
<script>
(function() {
  var links = document.getElementsByTagName('a');
  for (var i = 0; i < links.length; i++) {
    if (/^(https?:)?\/\//.test(links[i].getAttribute('href'))) {
      links[i].target = '_blank';
    }
  }
})();


// Add cheatsheet to md-typeset class, to use cheatsheet.css
(function() {
  var el = document.getElementsByClassName('md-typeset')[0];
  if (el) {
  el.className += el.className ? ' cheatsheet' : 'cheatsheet';
  }
})();
</script>
