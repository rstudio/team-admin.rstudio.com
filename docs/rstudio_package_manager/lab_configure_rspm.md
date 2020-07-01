
## Overview

In the following exercises, you will:

* Configure the RSPM CLI
* Tour the RSPM CLI commands
* Run diagnostics on RSPM

Refer to the  [RSPM Documentation](https://docs.rstudio.com/rspm/admin/) 
throughout the exercises, specifically the 
 [Try out the CLI](https://docs.rstudio.com/rspm/admin/getting-started.html#try-out-the-cli)  section.


## Task: Configure the RSPM CLI

### Try out the RSPM CLI

Try running the `rspm` command on the server instance where RSPM is installed:

```sh
/opt/rstudio-pm/bin/rspm
```

What output do you see?

### Configuring group memberships and permissions

Refer to the [Try out the CLI](https://docs.rstudio.com/rspm/admin/getting-started.html#try-out-the-cli) 
documentation section to add your user to the appropriate group for RSPM.

!!! tip "Hint"
    You can view your current user by typing `whoami` or `echo $USER` in the terminal.

Remember, you will need to log out and back in for the group membership to take
effect.

You can verify that the groups are configured correctly by running:

```sh
/opt/rstudio-pm/bin/rspm
```

which should return a list of available commands.

## Task: RSPM command alias

To save keystrokes when typing RSPM commands, create a command alias for the
`rspm` command:

```sh
echo "alias rspm='/opt/rstudio-pm/bin/rspm'" >> ~/.bashrc
```

Log out and back in for the command alias to take effect.

Now, you can type the shorter command alias to invoke RSPM:

```sh
rspm
```

## Tour RSPM CLI commands

If you run the `rspm` command with no arguments, then you'll see a list of
available commands:

```sh
$ rspm
Available Commands:
add         Command to add packages to sources
air-gap     Command to print help for setting up an air-gapped RStudio Package Manager service
archive     Command to archive packages in sources
clear-cran  Command to purge CRAN metadata. Cannot be used if any repos subscribe to CRAN.
create      Commands to create entities
delete      Commands to delete entities
edit        Commands to edit repo name and description
fetch       Command to initiate eager package fetching
help        Help about any command
import      Command to import SSH keys
info        Command to print information about sources and repos
list        Commands to list entities.
logs        Command to retrieve logs for package builds
remove      Command to remove packages from sources
reorder     Command to reorder repo subscriptions to sources
rerun       Command to rerun git-builders
run         Command to run git-builders
subscribe   Command to subscribe repos to sources
sync        Command to initiate an ad-hoc sync of the default cran source
unsubscribe Command to unsubscribe repos from sources
update      Command to update curated-cran sources
```

Try running the following commands and observing the output:

```sh
rspm list
```

```sh
rspm help sync
```

Let's walk through the commands by functional groups.

### Working with CRAN

```sh
sync        Command to initiate an ad-hoc sync of the default cran source
clear-cran  Command to purge CRAN metadata. Cannot be used if any repos 
              subscribe to CRAN.
```

### Manage repositories and sources

```sh
create      Commands to create entities
delete      Commands to delete entities
list        Commands to list entities
update      Command to update curated-cran sources
```

### Manage packages

```sh
add         Command to add packages to sources
archive     Command to archive packages in sources
remove      Command to remove packages from sources
```

### Working with repositories

```sh
edit        Commands to edit repo name and description
reorder     Command to reorder repo subscriptions to sources
subscribe   Command to subscribe repos to sources
unsubscribe Command to unsubscribe repos from sources
```

### Utilities

```sh
air-gap     Command to print help for setting up an air-gapped RStudio Package
              Manager service
fetch       Command to initiate eager package fetching
help        Help about any command
import      Command to import SSH keys
info        Command to print information about sources and repos
logs        Command to retrieve logs for package builds
```

### Git package builders

```sh
run         Command to run git-builders
rerun       Command to rerun git-builders

```

## Quiz: Using the RSPM CLI

!!! question "Which of the following statements is true regarding the RSPM CLI?"
    
    * Each R user needs access to the RSPM CLI to install R packages
    * Only administrators need access to the RSPM CLI to manage repositories and sources


??? example "Answer:"

    Only administrators need access to the RSPM CLI to manage repositories and sources

!!! question "The RSPM CLI tool can be used to add which types of repositories?"
    
    * Repositories that serve CRAN packages
    * Repositories that serve curated CRAN packages
    * Repositories that serve both CRAN packages and private R packages
    * The RSPM CLI can be used to add any of the above repositories

    
??? example "Answer:"

    The RSPM CLI can be used to add any of the above repositories

## Task: Run diagnostics on RSPM

There are various methods to check the health of your RSPM instance.

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

    View diagnostics output:

    ```sh
    cat rspm_diagnostics-report.txt
    ```
