# Bestrew, for spreading your work around

This is a tool intended to help writers (or other artists) to keep track of their submissions, venues they'd like to submit to, and the works that they would like to publish. I called it "bestrew" because it's a funny literary word, rarely used, but which means "to spread around." I made this because, after trying [a lot of different submissions tracking methods](http://nocategories.net/ephemera/writing/writing-submission-tools/),  none of them were just right for my needs. 

I'm just a writer looking for tools to help other writers do more powerful things with their text. As a humble HTML/CSS developer, I'm new to GitHub, SQLite and to application/database development in general, so I could use any input at all. I consider this project to be a fun excuse to learn new things. 


## What Does it Do?

This simple database is designed to help writers track three things, and details about them:

1. What have you created? ("works")
    - title
    - type
    - status
    - is the work published? if so...
        - publication venue
        - publication date
    - a recent copy of the work
2. Where have you sent your work or where might you send it? ("venues")
    - title
    - type
    - contact info.  
    - submission guideline details
3. Which works have you sent to which venues and what happened? ("submissions")
    - which works have been sent out?
    - to which venues?
    - how long have they been out?
    - what was the result of the submission?
    - (poets) include multiple manuscripts as part of a single submission?

This is just a simple overview of what Bestrew is designed to track. For a more detailed overview, take a look at <a href="https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md">the data model.</a> To request new features, ask questions or to discuss, have a look at <a href="https://github.com/dylan-k/bestrew/issues">the issues page</a>.


## Usage

**This version is a database file for use with SQLite**. 

1. Install SQLite Software

At the bare minimum, you'll need to [install SQLite](http://www.sqlite.org/download.html) in order to use Bestrew. SQLite, by itself, is a command line tool however, so you may prefer to use one of the many <a href="https://www.sqlite.org/cvstrac/wiki?p=ManagementTools">graphical interface apps available for SQLite</a>: such as [SQLiteMan](http://sqliteman.com/) which is free software available for [Windows, Linux](http://sqliteman.com/page/4.html) and [Mac](http://brewformulas.org/Sqliteman); or Navicat which is an excellent, paid, cross-platform database app for which the cheap-o version is only around $10.

2. Open the ``bestrew.sqlite3`` database file
3. begin entering works, venues and submissions into the appropriate database tables.


## Links

This project is based on several sources. 

- [Writer's Database by Dmitri Popov](http://www.linux-magazine.com/w3/issue/103/084-086_workspace.pdf), part of [The Writer's Tools Extension for OpenOffice.org and LibreOffice](https://code.google.com/p/writertools/)
- My [notes about submission tracking tools for writers](http://nocategories.net/ephemera/writing/writing-submission-tools/), overview of existing methods, feature wish list, etc.
- [a write-up of the database design](https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md)
- [other applications and scripts designed for submission tracking](http://nocategories.net/ephemera/writing/writing-submission-tools/#apps)
