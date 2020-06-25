
<!-- README.md is generated from README.Rmd. Please edit that file -->

# team-admin-training <img src='https://cdn.rstudio.com/pro-admin/pres/include/r-admins-button-small.png' align="right" height="139" />

The goal of this course is to teach the fundamentals of administering
RStudio Team. This target audience for this course is system
administrators at RStudio Full Service Certified Partners (FSPs) and
customers.

The course covers installation, configuration, integration and usage of:

  - RStudio Server Pro
  - RStudio Connect
  - RStudio Package Manager

## Getting Started

Start by cloning the repo and then you can use the supplied
`mkdocs-docker` command to build and serve the site.

This approach improves reproducibility and ensures that
you have the correct version of the tool and any plugins.

**Note:** This tool will most likely be replaced with a `Makefile` at
some point in the future.

The `mkdocs-docker` wrapper essentially wraps a containerised version of
the `mkdocs` command line tool. All of the same options are available
and running the command without any parameters displays the `mkdocs`
help.

To build the site from the mkdocs assets:

    ./mkdocs-docker build

To serve the site locally for development:

    ./mkdocs-docker serve

You can then view the rendered site at http://localhost:8000

Press Ctrl+c to end the serve.

## Clean up

This version of the docs currently has a lot of things left over in the
repo that are not used and a thorough tidy-up is required.

## Creating content

More info coming soon, but this version uses more-or-less standard
[mkdocs](https://www.mkdocs.org) and all of the files for the site are
in the `docs` folder.


## Using images on the RStudio content distribution network (CDN)

The template contains png images that are being distributed via the
RStudio CDN.

  - To put images on the CDN, add to the [rstudio-cdn S3
    bucket](https://s3.console.aws.amazon.com/s3/buckets/rstudio-cdn/?region=us-west-2&tab=overview)
  - Then use the Cloudfront URL, in the form
    `https://cdn.rstudio.com/pro-admin/<filename.png>`
