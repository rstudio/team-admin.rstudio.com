
## Overview

In the following exercises, you:

- Install Python from Anaconda
- Verify the installation
- Configure for use with RStudio Connect
- Test installation in RStudio Server Pro with `reticulate` 
- Install an additional version of Python (_optional_)


Refer to the [Python Installation Documentation](https://docs.rstudio.com/resources/install-python/) throughout the exercises, specifically the [Integrating RStudio Connect with Python](https://docs.rstudio.com/rsc/integration/python/) section.

## Quiz: Python integration

### Possible Use Cases

```
{r use_cases}
quiz(
  question(
    "What are some of the possible uses of Python combined with RStudio Server Pro and RStudio Connect?",
    answer("Reticulated Shiny applications", correct = TRUE),
    answer("Publishing Jupyter Notebooks", correct = TRUE),
    answer("Using the `reticulate` package", correct = TRUE),
    answer("Scheduling Python-based ETL scripts", correct = TRUE),
    answer("Deploy Plumber APIs that leverage Python", correct = TRUE),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

### Python version requirements

```
{r minimum_python_version_rsc}
quiz(
  question(
    "What are the minimum Python versions supported in RStudio Connect for Python 2 and Python 3?",
    answer("Python 2.7.9+, Python 3.4.0+", correct = TRUE),
    answer("Python 2.6+, Python 3.0+"),
    answer("Python 2.7.4+, Python 3.7.0+"),
    random_answer_order = TRUE,
    allow_retry = TRUE
  )
)
```

### `reticulate` version requirements

```
{r minimum_python_version_reticulate}
quiz(
  question(
    "What is the minimum Python version supported by the `reticulate` package?",
    answer("Python >= 2.7", correct = TRUE),
    answer("Python >= 3.7.4"),
    answer("Python >= 2.6"),
    random_answer_order = TRUE,
    allow_retry = TRUE
  )
)
```

## Task: Installation and required dependencies

Perform the following tasks on your course instance:

* Install the required dependency (**Ubuntu**)
* Verify the Python version

In the following exercise, you will test Python and ensure that it is installed
correctly.

**Required dependency**

```sh
sudo apt install bzip2
```

**Python**

```sh
sudo curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
sudo bash Anaconda3-5.2.0-Linux-x86_64.sh -bp /opt/python/3.6.5/
```

!!! note "Note"
    For the purposes of these exercises, please remember that the course machine is Ubuntu.

## Task: Verify the Python installation


Check the status of the Python version:

```sh
/opt/python/3.6.5/bin/python --version
```

The output should resemble:

```
Python 3.6.5 :: Anaconda, Inc.
```

## Task: Install additional Python packages (optional)

You can install additional Python packages into the your Python 3.6.5 environment by running a command such as:

```sh
sudo /opt/python/3.6.5/bin/pip install virtualenv pandas matplotlib
```

This command will install [virtualenv](https://virtualenv.pypa.io/en/stable/installation/), [pandas](https://pandas.pydata.org/), and [matplotlib](https://matplotlib.org/).


## Task: Add Python to the system PATH (optional)

You can configure Python on the system `PATH` so that users will be able to use `pip` within a terminal to install packages to their home directory, similar to how R works with `install.packages()`.

The recommended method to add Python to the `PATH` is to append the version of Python that you installed to the system-wide `PATH` variable. For example, this can be defined in a script within the `/etc/profile.d/` directory.

Create a new file `python.sh` in `/etc/profile.d/` that references the location of the Python installation:

```sh
# in /etc/profile.d/python.sh

PATH=/opt/python/3.6.5/bin:$PATH
```

!!! note "Note"
    The above pattern `PATH=/opt/python/<PYTHON_VERSION>/bin:$PATH` can be replicated when configuring a machine with multiple Python installations.


## Task: Test installation in RStudio Server Pro with _reticulate_ 

 // TODO:
 https://support.rstudio.com/hc/en-us/articles/360023654474-Installing-and-Configuring-Python-with-RStudio

## Task: Configure for use with RStudio Connect

// TODO:


## Task: Deploy a Reticulated Shiny application

// TODO:


## Task: Install multiple versions of Python (_optional_)

If you want to install multiple versions of Python on the same server, 
you can repeat these steps to specify, download, and install a different version of Python alongside existing versions to other locations.

```sh
sudo curl -O https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
sudo bash Anaconda3-2019.07-Linux-x86_64.sh -bp /opt/python/3.7.3/
```

And extend `Path` with the additional version as before:

```bash
# in /etc/profile.d/python.sh

PATH=/opt/python/<PYTHON_VERSION>/bin:$PATH
```
