
# team-admin-training <img src='https://cdn.rstudio.com/pro-admin/pres/include/r-admins-button-small.png' align="right" height="139" />

The goal of this course is to teach the fundamentals of administering
[RStudio Team](https://rstudio.com/products/team/). The target audience for 
this course is system administrators at 
[RStudio Full Service Certified Partners (FSPs)](https://rstudio.com/certified-partners/) 
and customers.

The course covers installation, configuration, integration and usage of:

  - RStudio Server Pro
  - RStudio Connect
  - RStudio Package Manager

## Course scope

The idea behind this course is to provide a solutions-first introduction to 
running RStudio products in professional enterprise envinronments. 

We intentionally do not cover more advanced topics such as high-availability 
or kubernetes integration, preferring instead to focus on topics with the 
broadest appeal. If you're interesting in going beyond the topics covered in
the course, please see the [RStudio documentation site](https://docs.rstudio.com)
for more info.

## Contributing to this repo

Start by cloning the repo and then you can use the `make` command to build, 
serve and test the site while you're making changes to it.

You will need `make` and a working [Docker](https://www.docker.com) installation.


### Creating content

The site uses [mkdocs](https://www.mkdocs.org) with the 
[mkdocs material theme](https://squidfunk.github.io/mkdocs-material/) and 
all of the files for the site are in the `docs` folder. The site is created 
primarily using markdown, but the mkdocs site has full instructions if you 
need them.

In addition to the standard mkdocs content, we also have custom theme
overrides (eg the footer) in the `overrides` directory. See the 
[documentation](https://www.mkdocs.org/user-guide/styling-your-docs/#using-the-theme-custom_dir)
for more info.


### Local development

mkdocs provides tooling for local builds and running the site on a local
web server so you can view content changes locally. For convenience and 
consistency we use a dockerised version of mkdocs.

The development server automatically refreshes content in your broswer
as the underlying file is edited.

To run a local development server:

```
make serve
```

The site can then be viewed at https://localhost:8000. Use ctrl+c to quit.

And it's not usually necessary, but if you need to perform a local build:

```
make build
```

The build will be created in a `site` directory which git will ignore.


### Using content on the RStudio content distribution network (CDN)

This site contains content -- such as video -- that is being distributed 
via the RStudio CDN and is not present in this repo.

* To put files on the CDN, add to the [rstudio-cdn S3
  bucket](https://s3.console.aws.amazon.com/s3/buckets/rstudio-cdn/?region=us-west-2&tab=overview)
* Then use the Cloudfront URL, in the form
  `https://cdn.rstudio.com/pro-admin/<filename.png>`


### Testing

It's helpful to be able to tell if any links are broken on the site.

The `Makefile` gives us two commands for doing this. One for local
development and one for the production site.

To test links locally run:

```
make serve
```

and then, in a separate session:

```
make test-local-links
```

The output will indicate if there are any problems with the links on the site.

To run against the production site:

```
make test-prod-links
```


### Deployment to Netlify

The site is hosted on Netlify which will build and serve the site 
automatically when changes occur in the `master` branch.

The Netlify build is currently controlled by two files, `runtime.txt`
and `requirements.txt`.

* `runtime.txt` contains the Python version used to build the site.
* `requirements.txt` is a standard python requirements file

Since local development uses docker, it's important to ensure the versions
of python, mkdocs and any other dependencies are aligned.

## License

Copyright [RStudio, PBC](https://rstudio.com) and licensed under a 
[Creative Commons Attribution-NonCommercial 4.0 International License](license.md).
