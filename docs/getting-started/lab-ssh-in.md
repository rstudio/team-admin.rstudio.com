

## Task: SSH in

As part of the joining instructions for this course you will receive the login credentials to access your VM (via email).

The email will contain your user name, password as well as a URL that is the home page for your virtual machine.

Once you follow the URL, your screen should look similar to this:

![image](assets/getting-started-screen.png)



Use the provided credentials to log in

You can do this using your favourite SSH tool, including:

* linux terminal
* git bash
* PuTTy or SuperPutty


In the terminal, use a command like the following (after substituting your own host name):

```sh
ssh admin-user@ec2-99-999-99-999.us-east-2.compute.amazonaws.com
```

This screencast demonstrates how to make the connection:

<asciinema-player src="../../asciicast/ssh.cast"></asciinema-player>


Upon success you should be able to see the Ubuntu initial welcome information:


![image](assets/success.png)



## Task: Explore some folder locations

Make a mental note of the following folder locations

Location              | Contents
------------          | --------------------
`/usr/share/class`    | classroom material
`/usr/local/src`      | contains pre-downloaded source material
`/opt/R`              | installation folder for R


For example:

```sh
ls /usr/share/class
```

```sh
ls /usr/local/src
```
