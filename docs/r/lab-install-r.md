
## Task: Install R (v4.0.0) from pre-compiled binaries

RStudio recommended best practice is to install R from pre-compiled binaries on a Linux server.

Refer to [https://docs.rstudio.com/resources/install-r/](https://docs.rstudio.com/resources/install-r/)

Your task is to install R (version 4.0.0) from the pre-compiled binaries, following these instructions.

For your convenience, we repeat the instructions here.  If in doubt. follow the advice in the official documentation.

```sh
sudo apt update
sudo apt install gdebi-core
```

Specify the R version as an environment variable:

```sh
export R_VERSION=4.0.0
```

Download and install R

```sh
curl -O https://cdn.rstudio.com/r/ubuntu-1804/pkgs/r-${R_VERSION}_1_amd64.deb
sudo gdebi r-${R_VERSION}_1_amd64.deb
```

<asciinema-player src="../../asciicast/install_r.cast"></asciinema-player>



## Success!!

How do you know you've done it?

Verify your installation:

```sh
/opt/R/${R_VERSION}/bin/R --version
```

Your output should be similar to this:

```
R version 4.0.0 (2019-04-26) -- "Planting of a Tree"
```

