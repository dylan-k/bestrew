bestrew
=======

bestrew  
verb (literary)  
to cover or partly cover with scattered objects 

This is a tool intended to help writers (or other creatives) to keep track of their submissions, venues they'd like to submit to, and the works that they would like to publish. 

## Features

the SQLite version now comes closest to what I have in mind for this.
Although it doesn't have much of a "front end" it is able to do
many of the things on [the wish list](https://github.com/dylan-k/bestrew#features-wishlist).

Lots of good stuff with this version. I had to learn SQL to do it!

- adding a submission record, via a view, creates new works and venues
- changing submission status also updates work status
- able to auto-count number of times a work has been submitted
- quick view of all published/active/available works
- able to store files (as BLOB data)

## Usage

**This version is a database file for use with SQLite**. You'll need to [install SQLite](http://www.sqlite.org/download.html) at least and may also prefer a graphical interface such as [SQLiteMan](http://sqliteman.com/) which is free software available for [Windows, Linux](http://sqliteman.com/page/4.html) and [Mac](http://brewformulas.org/Sqliteman).

Further documentation to come.
