
## Task: Deploy sample API

Deploy the sample API in the folder `05_api`.

You can deploy using either:

* Push button deployment
* The `rsconnect` package:


```r
setwd("05_api") 
rsconnect::deployAPI(".", server = ..., account = ...)
```

Try out the Swagger Docs for the API.


## Task: Make an authenticated request

Your task is to restrict access to the published API, then make an authenticated request from the linux terminal.

* First, restrict access to the sample API to authenticated users only.
* Then, generate an API key in Connect
    - Make sure you save the API key in a safe place.  Treat it like a password!
* Make a request from `bash`, filling in `YOUR_BASE_URL` and `YOUR_AUTH_KEY`
    - Hint: you get get the base URL for your API by looking at the Swagger docs panel

```sh
curl -X GET "YOUR_BASE_URL/mpg?new_hp=300" -H  "accept: application/json"  -H "Authorization: Key YOUR_AUTH_KEY" 
```



### Video review: Generate an API key

<video height="400px"controls>
  <source src="https://cdn.rstudio.com/pro-admin/videos/connect_api_key.mp4" type="video/mp4">
</video>


### Video review: Making an authenticated request

<video height="400px"controls>
  <source src="https://cdn.rstudio.com/pro-admin/videos/plumber_authenticated_request.mp4" type="video/mp4">
</video>
