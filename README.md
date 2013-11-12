bestrew
=======

tiddlywiki edition

This is a tool intended to help writers to keep track of their submissions, publications they'd like to submit to, and the manuscripts that they would like to publish. 

Currently, the database is implemented using LibreOffice Base, although I'm considering a shift to TiddlyWiki5, since it is more lightweight and portable.


## Features

This simple database is designed to help writers track three things, and details about them:

1. What have you written? ("manuscripts")
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


## Usage

This database tool is designed to be free and to run on multiple platforms, so (at least at the moment) it relies on [LibreOffice](http://www.libreoffice.org/) Base, which is also free to install. It is also compatible with [OpenOffice](http://www.openoffice.org/) Base. Install one of those two applications and then open the .odb file to begin. Be sure to enable macros.


## License

This database is licensed under the GNU GPL, as was the source it is derived from.


## Links

This project is based on several sources. 

- [Writer's Database by Dmitri Popov](http://www.linux-magazine.com/w3/issue/103/084-086_workspace.pdf), part of [The Writer's Tools Extension for OpenOffice.org and LibreOffice](https://code.google.com/p/writertools/)
- Uses [Split_HSQLDB_Wizard_v3c.odb](http://forum.openoffice.org/en/forum/viewtopic.php?f=83&t=61183) for Base
- My [notes about submission tracking tools for writers](http://nocategories.net/ephemera/writing/writing-submission-tools/), overview of existing methods, feature wish list, etc.

Here are some useful other links:

- [a write-up of the database design](https://github.com/dylan-k/bestrew/blob/master/writers-database_data-model.md)
- [ongoing conversation about the development of this database](http://en.libreofficeforum.org/node/6787)
- [other applications and scripts designed for submission tracking](http://nocategories.net/ephemera/writing/writing-submission-tools/#apps)


## Changelog

v 0.6 changelog:
- added ability to store local filepaths to describe the file(s) that were submitted

v 0.5 changelog:
- fixed a glitch related to portability to Windows
- created "bestrew" project @ github for hosting and version control

v 0.4 changelog:
- changed sub_file data field. It now only stores filenames rather than the complete binary file. This was done to reduce risk of bloat/instability.
- added buttons to the submissions form. These buttons should help the sub-forms to add new entries for manuscript or venue as needed.
- cosmetic changes, particularly to the submissions form.

v 0.3 changelog:
- additional fields added to 'venues' table
- submissions form adjusted for adding new manuscripts and venues
