
## Permissions errors

!!! tip "You encounter 'Warning: Permission denied' when running a command"

    Symptom: you get a `Warning: Permission denied` 

    This means you tried to do something and the system thinks you have insufficient permissions.

    Since you have root permissions on the VM, but are logged in as `admin-user`, you should use `sudo` to gain elevated privileges.

    For example, if the following instruction throws an error and warning,

    ```sh
    curl ...
    ```

    Then use:

    ```sh
    sudo curl ...
    ```

    Consult a good linux resource for help.  For example, see [Linux Commands For Beginners: SUDO](https://linuxacademy.com/blog/linux/linux-commands-for-beginners-sudo/).

    This will also help you understand the evergreen [XKCD sandwich joke](https://xkcd.com/149/):

    <a href='https://xkcd.com/149/'>
    <img src='https://imgs.xkcd.com/comics/sandwich.png' />
    </a>


## 502 Bad gateway error

!!! tip "After claiming your VM, you get a '502 Bad Gateway error'"

    Symptom: you get a `502 Bad Gateway error` when clicking on the RStudio product buttons

    You’re getting a bad gateway error because you’ve not yet configured and installed the products on the VM.  Your task is to install the products and then these links will function.  This is described on the previous page in the sequence (the page where you claimed your VM).
 

    ![](assets/faq/bad-gateway.jpg)
