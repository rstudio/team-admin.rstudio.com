# Security

## Authentication


RStudio Server Pro works with your existing authentication service

1. PAM

    * System user database
    * Active Directory
    * LDAP

2. Proxied Authentication

    * Single sign-on
    * Web based authentication

3. Google OAuth





### PAM

The most common authentication mode for RStudio Server Pro is **PAM** (pluggable authentication module).  You can configure PAM with **LDAP** or **Active Directory**.

* LDAP

    - Lightweight Directory Access Protocol
    - Industry standard directory service

* Active Directory

    - Directory service for Windows
    - Leverages LDAP and Kerberos

!!! note
    * Your organization most likely already have a PAM configuration.
    * This session has exercises for configuring RStudio Server Pro using PAM with LDAP.



### Proxied authentication

If you are not using PAM, LDAP or Active Directory, you should use **Proxied Auth**.

* In proxied auth mode, RStudio Server Pro trusts the users sent by your existing authentication system (e.g. Shibboleth). 

* Configure your authentication system to add a special HTTP header for requests sent to RStudio Server Pro.

* Take precautions to prevent unauthorized traffic from accessing RStudio Server Pro.

    - This will be defined by your firewall and [VPC](https://en.wikipedia.org/wiki/Virtual_private_cloud) (virtual private cloud) settings.



### Token based authentication (SAML)

RStudio Server Pro does not natively support token based auth today.  However, we intend to support **SAML** for many of these auth providers in the future:

Cloud based: 

* Okta, Azure AD, Duo, Centrify, Google Apps

On premises:

* ADFS, PingIdentity, WSO2, Shibboleth, Auth0, Sailpoint


!!! note
    [RStudio Connect v1.7.4 and later supports SAML](https://blog.rstudio.com/2019/05/14/introducing-saml-in-rstudio-connect/)



## Kerberos

Kerberos is a [protocol](https://en.wikipedia.org/wiki/Kerberos_%28protocol%29) that uses tickets to communicate over a network.  It uses secret-key cryptography to provide secure communications over a non-secure network.


The benefits of Kerberos are:

* strong encryption
* single sign-on (SSO)

With Kerberos single sign-on, users are only prompted once for their user ID and password.


!!! note "Fun fact" 
    Kerberos is name after the mythological three-headed dog, Cerberus, who guarded the gates of Hades
    ![image](assets/cerberus-blake.jpg)
    Painting of [Cerberus](https://en.wikipedia.org/wiki/Cerberus), by Blake






### Kerberos tickets

Ticket creation

* Kerberos tickets can be created at time of authentication.
* These are sometimes referred to as **pass-through credentials**.

Database authentication

* Kerberos is frequently used by an application to **authenticate users against a database**.
* For example, Hadoop clusters often require the user to authenticate with a Kerberos ticket.

RStudio integration

* Use **PAM** to initialize and destroy Kerberos tickets
* Note: Kerberos tickets __can not__ be auto-generated with proxied auth, but users can generate their own Kerberos tickets via the terminal



!!! info "More information"
    For more information about Kerberos with RStudio, refer to the [admin guide](https://docs.rstudio.com/ide/server-pro/r-sessions.html#kerberos).

    For database integration, see

    * [Run As the Logged-in User (Kerberos)](https://db.rstudio.com/best-practices/deployment/#run-as-the-logged-in-user-kerberos)
    * This is part of the [database best practises](https://db.rstudio.com/best-practices/) at [db.rstudio.com](https://db.rstudio.com/)

    Also, read the support articles:

    * [How to pass authentication credentials to a database using Kerberos](https://support.rstudio.com/hc/en-us/articles/115000259268-How-to-pass-authentication-credentials-to-a-database-using-Kerberos).
    * [Handling long-running sessions in RStudio Server Pro with Kerberos](https://support.rstudio.com/hc/en-us/articles/115013500128-Handling-long-running-sessions-in-RStudio-Server-Pro-with-Kerberos-)



## Local system accounts


Every R user must have a **local system accounts** regardless of the authentication method you use.

* This requirement comes from R.
* Like many programming languages (Python, Scala, etc), R gives user direct access to the operating system on Linux servers.

R programmers can:

* Issue shell commands from the R console
* Access files and file mounts
* Download files from the Internet
* Run apps and authenticate as themselves to databases and other services



### Provisioning local system accounts

You must provision local accounts in one of two ways:

* You should set up local system accounts **manually** and then map authenticating users to these accounts. 
* You can also use **PAM Sessions** to mount users' home directories to the server.


!!! note 
    Not all RStudio products require local system accounts.
    * RStudio Connect serves end users, not R developers, so it can be configured without local system accounts.




## Security

RStudio Team products run these open source tools:

* Linux
* R programming language
* Community R packages

RStudio Team products run on premises and in the cloud using:

* Complex networks and firewalls
* File shares and other storage
* Databases and other data stores
* Browser and other end user connections

This implies that many security issues pertain to these systems, not to RStudio!

Typical security concerns:

* How are local system accounts provisioned on the server?
* What permissions / privileges do those local system accounts have?
* How does the user authenticate using their browser?
* How to secure browser communications?

The next section dicusses security features of RStudio Server Pro



### RStudio Server Pro Security features

* Clickjacking
    - Will not load inside a browser frame
* Cookies
    - HTTP only cookies except for the CSRF cookie. 
* SSL
    - TLS v1, TLS v1.1, TLS v1.2
    - SSL v2, SSL v3
    - Secure Cookies
    - HSTS Header
* Cross Site Request Forgery (CSRF):
    - Protection with the R session includes a double submit cookie

Note: Also refer to the support article [Security features in RStudio Server Pro](https://support.rstudio.com/hc/en-us/articles/221682007-Security-features-in-RStudio-Server-Pro)



### SSL Certificates

Transport layer security (TLS) is a mechanism to establish secure browser communications between a client (e.g. browser) and server (RStudio Server Pro) over an insecure channel.

The technology to achieve this a combination of SSL, TLS, and HTTPS.

Having transport layer security:

* Keeps information secure
* Builds trust
* Best practice

To enable SSL, TLS and HTTPS requires a **certificate**.

You can create a certificate yourself, or obtain a certificate from a trusted authority. 

* Self-signed certificate

    * Server generates its own certificate
    * Easy to generate, but every client has to be configured manually
    * **Your server will not automatically be trusted by other clients**

* Certified authority

    * Trusted authority generates certificate
    * Configuration at the network level
    * **Your server will be trusted by all clients in your network** 

Your organisation most likely have a formal process for obtaining trusted certificates.  Talk to your IT team to provide a certificate for your RStudio products.



### Running behind a proxy

RStudio Server Pro is commonly run behind a [reverse proxy](<https://en.wikipedia.org/wiki/Reverse_proxy>)

* A proxy provides a firewall between RStudio Server Pro and other servers on the network

* Common proxies include

    * [Apache](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html)
    * [Nginx](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)


For more information, see the support articles:

* [Running RStudio Server with a Proxy](https://support.rstudio.com/hc/en-us/articles/200552326-Running-RStudio-Server-with-a-Proxy)
* [Running (Connect) with a  Proxy](https://docs.rstudio.com/connect/admin/proxy/)
* [Running RStudio Package Manager behind a Proxy](https://support.rstudio.com/hc/en-us/articles/360009983293-Running-RStudio-Package-Manager-behind-a-Proxy)


![image](assets/apache-reverse-proxy-arch.png)
*Apache reverse proxy architecture*





### Disabling access to some features

You can selectively disable some features of RStudio Server Pro. The [feature limits](https://docs.rstudio.com/ide/server-pro/r-sessions.html#feature-limits) section of the admin guide describes these limits.

If your organisation operates a secure environment, you may want to limit:

* Shell access
* File uploads
* Publishing to the cloud

In addition, you can also limit:

* Git access
* Package installation
* Package repository selection
* WebSockets
* File downloads

(Note that you specify these settings in `/etc/rstudio/rsession.conf`.)



### Why root access?

* RStudio needs root access to provision sessions on behalf of other users
* The RStudio Server Pro runs under the `rstudio-server` user in the normal course of operations.

!!! quote "From the docs"
    RStudio Server runs as the system root user during startup and then drops this privilege and runs as a more restricted user. RStudio Server then re-assumes root privilege for a brief instant when creating R sessions on behalf of users (the server needs to call `setresuid` when creating the R session, and this call requires root privilege).
    
    - https://docs.rstudio.com/ide/server-pro/access-and-security.html#server-permissions



### Security of open source software

R is open source software with oversight by the [R Foundation](https://www.r-project.org/foundation/)

* All versions of R are equally secure
* We recommend you [install R from pre-compiled binaries](https://docs.rstudio.com/resources/install-r/)

R packages (10,000+) are open source and community driven

* RStudio contributes only a small percentage of all packages
* Indemnification of R packages is very rare
* RStudio offers a package manager to help curate and manage packages




## RStudio Database drivers


There are many ways to access data with R.  One of these mechanisms is to use ODBC to connect to databases from R.


The RStudio [Pro database drivers](https://www.rstudio.com/products/drivers/) supports some of the most common data sources:

![image](assets/pro_drivers.png)



!!! tip "Database best practises"
    To find recommended best practise for database connections, storing credentials, etc:
    * Visit https://db.rstudio.com/
    ![images](assets/connections-pane.png)



## Your turn

Next complete the exercise.

Signs of success:

* You have created a new user `jen`
* You can authenticate against sssd as `jen`
* You have logged in as `jen` on RStudio Server Pro
