

Bestrew is a database for tracking submissions
===============================================================================

This is a tool intended to help writers (or other artists) to keep track of their submissions, venues they'd like to submit to, and the works that they would like to publish. It's called "bestrew" as in, "to spread around." 

This project is a testbed for rapidly iterating on several ideas. For now, the project is an experiment designed to learn as much as possible.

Eventual Goals:

- ***Incredibly high performance***. As creatives, we want to keep track of what's happening with our work, fast, so we can back to the real task of creating the work.

- ***Simplicity***. Bestrew should be easy to learn and use. It should be anticipatory and avoid redundancy.
 
- ***Flexibility***. It should be easy to manage information about, for exmaple, any venue/publication without any limitations. With some other tools, you're limited by what's available within a system or marketplace.

- ***Reliability***. Crashing, hanging, or losing work should never happen.

To request new features, ask questions or to discuss, have a look at <a href="https://github.com/dylan-k/bestrew/issues">the issues page</a>


Bestrew: What Does it Do?
-------------------------------------------------------------------------------

Bestrew is a simple database designed to track submissions, publications, and details about them. 

Bestrew should help you to know:

  - which works are currently submitted for publication?
  - which works have been published?
  - which submissions were accepted/ or not?
  - how long have submissions been open?

This is a simple overview of what Bestrew is designed to track.

1. **Works**. What have you created?
  - title
  - type
  - status
  - is the work published? if so...
    - publication venue
    - publication date
  - a recent copy of the work
2. **Venues**. Where have you sent your work or where _might_ you send it?
  - title
  - type
  - contact info.  
  - submission guideline details
3. **Submissions**. Which works went to which venues and what happened?
  - which works have been sent out?
  - to which venues?
  - how long have they been out?
  - what was the result of the submission?
  - (poets) include multiple manuscripts as part of a single submission?
4. **Portfolio**. Which works were published/displayed/performed and where?
  - this is a work in progress. suggestions welcome.

You'll find much more detailed information in the create script, `create-bestrew.sql`.


Getting Started with Bestrew
-------------------------------------------------------------------------------

At the moment, Bestrew is a very simple database, built with [SQLite](https://www.sqlite.org). SQLite is a command line tool, so you may prefer to use a graphical interface such as [SQLiteMan](http://sqliteman.yarpen.cz/) which is free software available for [Windows, Linux](http://sqliteman.com/page/4.html) and [Mac](http://brewformulas.org/Sqliteman); or a commercial app like Navicat.

1. [Install SQLite Software on your Linux, Mac, or Windows machine](https://www.tutorialspoint.com/sqlite/sqlite_installation.htm).
2. Tell SQLite to make a database ``sqlite3 bestrew.db``.
3. Run  ``.read create-bestrew.sql`` script to build the database.
4. Enter works, venues, and submissions into the database tables.
5. Explore the views to see various reports.


Notes
-------------------------------------------------------------------------------

This project is based on several sources. 

- [Writer's Database by Dmitri Popov](http://www.linux-magazine.com/w3/issue/103/084-086_workspace.pdf), part of [The Writer's Tools Extension for OpenOffice.org and LibreOffice](https://code.google.com/p/writertools/)
- My [notes about submission tracking tools for writers](https://nocategories.net/ephemera/writing-submission-tools), overview of existing methods, feature wish list, etc.
- [a write-up of the database design](https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md)
- [other applications and scripts designed for submission tracking](http://nocategories.net/ephemera/writing/writing-submission-tools/#apps)
- [Types of Database in SQL](https://www.scaler.com/topics/sql/types-of-database-in-sql/)

This project is growing!

- see also: [Python Flask UI for Bestrew](https://github.com/preston-stone/bestrew-flask)


Changelog
-------------------------------------------------------------------------------

**This version is for use with SQLite**. 

Previous versions used [LibreOffice Base](https://github.com/dylan-k/bestrew/tree/v0.6) and [Tiddlywiki](https://github.com/dylan-k/bestrew/tree/v0.7)
