# JobQuery
*Currently in development*

A simple job search application.

The purpose of this application is solely to drive the initial development of architectural abstractions in **Project Galahad**. It makes job search requests against the Adzuna Rest API, and stores the details in a SQLite database. Data grids interact with this data. It has minimal functionality. 

As mentioned, the focus is not the appliction, but architectural abstractions.

The evolving **Project Galahad** types are located in the Base folder.

DevExpress is required to build the project, but even without DevExpress, you can run the executable in the Win32\Debug folder, and view the source code.

To run the application, you'll need to register an account with Adzuna (it's free).

After registration, configure the Settings.Xml section accordingly, here's an example for UK:

```xml
  <Adzuna>
    <App id="" key="" />
    <Url>https://api.adzuna.com/v1/api/jobs/gb/search/1</Url>
  </Adzuna>
```

Note: If you build the project, the post build event will copy the Settings.Xml file to the debug folder, overriding the existing one. So that's the Xml file to update. However, if you are just running the application, then just edit the Settings.Xml file in the debug folder.

Hopefully, this will be finished shortly, and I'll drop a Blog post with details.
