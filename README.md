

Bestrew is a database for tracking submissions
==============================================

There's a maxim out there, variously attributed, that says: "serious writers should keep their work in circulation until it either sells or the ink wears off".

This is a tool intended to help writers (or other artists) to keep track of their submissions, venues they'd like to submit to, and the works that they would like to publish. 

I call it "bestrew" because it's a funny word that means "to spread around." I made this after trying [a lot of different submissions tracking methods](https://nocategories.net/ephemera/writing-submission-tools). None of them were just right for me. 

I'm just a writer looking for tools to help other writers do more powerful things with their text. As a humble HTML/CSS developer, I'm new to GitHub, SQLite and to application/database development in general, so I could use any input at all. I consider this project to be a fun excuse to learn new things. 

To request new features, ask questions or to discuss, have a look at <a href="https://github.com/dylan-k/bestrew/issues">the issues page</a>


Bestrew: What Does it Do?
-------------------------------------------------------------------------------

Bestrew is a simple database designed to track submissions, publications, and details about them. This is a simple overview of what Bestrew is designed to track. You'll find much more detailed information in the create script, `create-bestrew.sql`. .

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
4. Where have you performed and what did you perform there ("gigs")
  - this is a work in progress. suggestions welcome.


Getting Started with Bestrew
-------------------------------------------------------------------------------

At the bare minimum, you'll need to [install SQLite](http://www.sqlite.org/download.html) in order to use Bestrew. SQLite is a command line tool, so you may prefer to use one of the many <a href="https://www.sqlite.org/cvstrac/wiki?p=ManagementTools">graphical interface apps available for SQLite</a>: such as [SQLiteMan](http://sqliteman.com/) which is free software available for [Windows, Linux](http://sqliteman.com/page/4.html) and [Mac](http://brewformulas.org/Sqliteman); or Navicat which is an excellent, paid, cross-platform database app for which the cheap-o version is only around $10.

1. [Install SQLite Software on your Linux, Mac, or Windows machine](https://www.tutorialspoint.com/sqlite/sqlite_installation.htm).
2. Tell SQLite to make a database ``sqlite3 bestrew.db``
3. Run  ``.read create-bestrew.sql`` script to build the database:
4. begin entering works, venues and submissions into the appropriate database tables.
5. In addition to the tables, there are several views to help you along your way.


Notes
-------------------------------------------------------------------------------

This project is based on several sources. 

- [Writer's Database by Dmitri Popov](http://www.linux-magazine.com/w3/issue/103/084-086_workspace.pdf), part of [The Writer's Tools Extension for OpenOffice.org and LibreOffice](https://code.google.com/p/writertools/)
- My [notes about submission tracking tools for writers](https://nocategories.net/ephemera/writing-submission-tools), overview of existing methods, feature wish list, etc.
- [a write-up of the database design](https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md)
- [other applications and scripts designed for submission tracking](http://nocategories.net/ephemera/writing/writing-submission-tools/#apps)

This project is growing!

- see also: [Python Flask UI for Bestrew](https://github.com/preston-stone/bestrew-flask)


Changelog
--------------------------------------------------------------------------------

**This version is for use with SQLite**. 

Previous versions used [LibreOffice Base](https://github.com/dylan-k/bestrew/tree/v0.6) and [Tiddlywiki](https://github.com/dylan-k/bestrew/tree/v0.7)


