# JobQuery
*Currently in development*

A simple job search application.

The purpose of this tool is to drive the initial development of application abstractions in **Project Galahad**. 

The evolving **Project Galahad** types are located in the Base folder.

DevExpress is required to build the project, but even without DevExpress, you can run the executable in the Win32\Debug folder, and view the source code.

This demonstration makes use of Adzuna's API to fetch jobs matching search criteria. 

You'll need to register an account with Adzuna (it's free).

After registering, configure the Settings.Xml section accordingly, here's an example for UK:

```xml
  <Adzuna>
    <App id="" key="" />
    <Url>https://api.adzuna.com/v1/api/jobs/gb/search/1</Url>
  </Adzuna>
```

Hopefully, this will be finished shortly, and I'll drop a Blog post with details.
