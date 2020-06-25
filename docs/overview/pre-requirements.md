We assume that you are confident in managing Linux (Ubuntu). Specifically, I assume you already know how to:

* Edit configuration files using vim or nano
* Tail a log file
* Stop and start services
* SSH into a remote virtual machine

We will not cover any of these topics in detail:

* Vertical scaling with load balancing
* Docker, kubernetes and launcher
* Authentication methods other than LDAP
* Database configuration, pro drivers
* Setting up proxies or reverse proxies, e.g. using Nginx or Apache
* Automated, scripted deployment, e.g. using Chef, Puppet or Ansible

Hardware requirements:

* You should be working on a laptop with a modern web browser. We have tested on Chrome and Firefox, but any web browser in the [officially supported list](https://support.rstudio.com/hc/en-us/articles/227449447-Supported-browsers-for-RStudio-Connect) is fine.
* Your laptop firewall should allow traffic on websockets (for RStudio Server)
* You should be able to SSH into an AWS virtual machine.

!!! note "Note"
    This means you may have to install an SSH client on your laptop

On Mac OS and Linux this may well be built into your shell

On Windows, you may elect to use PuTTy, or some other SSH client, e.g. SuperPuTTy or MobaXterm, or use the Windows Subsystem for Linux (WSL) to access a Linux shell.

You will not be required to install any software on your laptop (other than the SSH client). We will provide you with an Amazon AWS virtual machine and you will access this VM and do installation there.

If you work in a heavily regulated company, you may have to provide your IT security team with the following information, to ensure you can access all the material:
* You must be able to access these web domains:
    * rstudio.com
    * shinyapps.io
    * rstudio.cloud
    * rstudio-cdn.s3.amazonaws.com
* Your firewall must allow access to the IP address of the virtual machine:
    * The IP address and host name will be allocated dynamically when you claim the machine (once the course starts)
    * At the moment we do not have a mechanism to allocate IP addresses in a pre-defined range
* You will communicate to the services inside this VM via a proxy on port 80, which eventually resolves to ports:
    * 8787 (RStudio Server Pro)
    * 4242 (RStudio Package Manager)
    * 3939 (RStudio Connect)

At the moment we use Google Forms for a pre-course poll as well as a simple post-course questionnaire.

Possible workarounds for companies that don’t allow SSH terminals:

* If you create an account on RStudio Cloud, it is possible to create a workspace and project, then use the built-in terminal in RStudio IDE to start an SSH session.
