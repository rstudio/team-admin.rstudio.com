
## In this session


* Understand the different mechanisms for installing R

* Installing R from source and pre-compiled binaries






## Three mechanisms for installing R


You have three different mechanisms for installing R on a Linux machine:

* Install from a Linux package manager

    * For example `yum` (Red Hat) or `apt` (Ubuntu)

* Compile from source

    * Download the R source code and compile using the relevant GCC compiler

* Install from pre-compiled binaries provided by RStudio

    * Download and install the pre-compiled binaries available from RStudio



### Method 1: Installing R using yum or apt

Installing from `yum` or `apt` (or similar) is traditionally the mechanism that most administrators would use.

!!! warning "Alert"
    However, updating the R installation will overwrite previous installations.


For data science work in production, it is important to provide code stability by installing multiple versions of R side-by-side.

This means that using your Linux package manager for installing R in production is not a good idea.

!!! tip "Recommendation"
    We recommend you don't use a Linux package manager to install R.




### Method 2: Compile R from source

For data science work in production, it is important to provide code stability by installing multiple versions of R side-by-side.

You can achieve this by installing R from source.

* Download the source code
* Create a "make" configuration
* Run `make`
* Run `make install`

This offers maximum flexibility, because you can specify the location of the installed package and you can optimize for your hardware.

[Instructions for installing R from source](https://docs.rstudio.com/resources/install-r-source/)

The downside of installing R from source is that it takes some time for the compilation to complete.





### Method 3: Install from pre-compiled binaries

RStudio recommends that in most cases you install R from pre-compiled binaries. 

This gives you the benefit of:

* Side-by-side installation of multiple versions of R
* It is quick, since the compilation step has previously been completed

To install from pre-compiled binaries, follow the instructions at 
[Install R](https://docs.rstudio.com/resources/install-r/)

!!! tip
    Installing from pre-compiled binaries is the recommended option in most cases




## Summary




### Recommendation

Our suggested order for making a choice of R installation is:

1. Install from [pre-compiled binaries](https://docs.rstudio.com/resources/install-r/)

    * to get multiple R versions side-by-side
  
2. Compile from source

    * gives more flexibility but takes longer
  
3. Use `yum` or `apt`

    * Does not allow side-by-side install
    * Do not use for long-term data science stability




## Your turn


Next complete the exercise.

!!! success "Signs of success"

* R is running
