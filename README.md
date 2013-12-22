bestrew
=======

bestrew  
verb (literary)  
to cover or partly cover with scattered objects 

This is a tool intended to help writers (or other creatives) to keep track of their submissions, venues they'd like to submit to, and the works that they would like to publish. 

**note**: I'm just a writer looking for tools to help other writers do more powerful things with their text. As a humble HTML/CSS developer, I'm new to GitHub and to application development in general, so I could use any input at all. I consider this project to be a fun excuse to learn new things. 

I've tried [a lot of different submissions tracking methods](http://nocategories.net/ephemera/writing/writing-submission-tools/), but they each gave me a sense of the goldilocks problem: none of them were just right. 


## Features

This simple database is designed to help writers track three things, and details about them:

    1. What have you created? ("works")
        - title
        - type
        - status
        - publication date
        - publication venue
        - a copy of the manuscript(s), as submitted
    2. Where have you submitted? ("venues")
        - title
        - type
        - contact info.  
        - submission guideline details
    3. What is the status of those submissions?
        - how long have they been out?
        - which manuscripts have been sent to which venues?
        - (poets) include multiple manuscripts as part of a single submission?

##Features Wishlist

Beyond simple entry of data into a good structure, the writer would like to have an application to help keep track of what's going on. Here are some useful features that I can think of:

    - **submission count** — each time a work is listed as part of a submission record, add 1 to the submission count. if a work has been submitted many times, but status remains unpublished, that's notable. Likewise, it is useful to count how many times you've submitted to a particular venue, to help avoid overdoing it.
    - **simultaneous submission monitoring** — some venues accept simultaneous submissions. Most do not. This can get tricky to watch over, without some help. If a work is already part of an active submission, alert the user if it is entered again. Similarly, if the user already has an active submission with any venue, an alert should appear if they try to send an additional submission to that venue.
    - **submitting multiple works** — not all writers are submitting one short story at a time. For example, poets send submissions that can include 5-10 works as part of a single submission. This does not count as a "simultaneous submission" as described above.
    - **smart updates** — if the user marks a submission as "accepted" or "published" then mark the published work as published, accordingly, note the venue and date of publication, and remove the work from circulation so that it isn't available to be submitted again.
    - **combo box** — the user is likely to use the "submissions" form most often. Here, there's a place to make note of the work submitted. Also, there's a place to make note of the venue that work was submitted to. Both works and venues are described in detail elsewhere, so it would be useful to have a thing called a "combo box" ( http://en.wikipedia.org/wiki/Combo_box ). By default, the combo box would show all existing names, either of works or of venues. If you need to add one, just type it in the combo box, which will automatically associate the entry both with the submission record and also with a new record or either a work or a venue.
    - **days out** — a fairly standard feature of submissions trackers is to compare date sent to either date replied, or to the current date, to determine the number of days the submission has been active. Useful for determining whether up a followup e-mail is needed.
    - **import/export** — probably a more advanced feature than I know how to build, but most other apps and spreadsheets and databases can export at least a `.csv` file. It would be useful to be able to import/export these.

## Versions 

During my experiments to build this application, I have tried to build it on several different platforms. I am indebted to the user communities for each of these, for their support.  

## Usage

This is still an experimental application and may not be suitable for reliable use. There are three different versions in this repository, each with its own `README` file for further details.

1. A database file for use with [LibreOffice](http://www.libreoffice.org/) Base or [OpenOffice](http://www.openoffice.org/) Base. Base is a desktop application, free to install on Mac, Linux or PC.
2. A wiki built with TiddlyWiki5. The wiki version is just an HTML file that will run on any browser, even off-line.
3. A database file for use with SQLite. You'll need to [install SQLite](http://www.sqlite.org/download.html) at least and may also prefer a graphical interface such as [SQLiteMan](http://sqliteman.com/) which is free software available for [Windows, Linux](http://sqliteman.com/page/4.html) and [Mac](http://brewformulas.org/Sqliteman).


## Links

This project is based on several sources. 

- [Writer's Database by Dmitri Popov](http://www.linux-magazine.com/w3/issue/103/084-086_workspace.pdf), part of [The Writer's Tools Extension for OpenOffice.org and LibreOffice](https://code.google.com/p/writertools/)
- Uses [Split_HSQLDB_Wizard_v3c.odb](http://forum.openoffice.org/en/forum/viewtopic.php?f=83&t=61183) for Base
- My [notes about submission tracking tools for writers](http://nocategories.net/ephemera/writing/writing-submission-tools/), overview of existing methods, feature wish list, etc.
- [a write-up of the database design](https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md)
- [ongoing conversation about the development of this database](http://en.libreofficeforum.org/node/6787)
- [other applications and scripts designed for submission tracking](http://nocategories.net/ephemera/writing/writing-submission-tools/#apps)
