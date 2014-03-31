
# Data Model for Bestrew Submissions Tracker

This simple database is designed to help writers track three things, and details about them.


## 1. What have you created?

TABLE: Works  
DESCRIPTION: Each row describes a unique work that could be submitted  

| FIELD NAME      | DATA TYPE  | DESCRIPTION                                                                     |
|-----------------|------------|---------------------------------------------------------------------------------|
| work_id         | INTEGER    | (Primary Key) for Manuscripts table                                             |
| work_title      | TEXT       | Title of manuscript                                                             |
| work_type       | TEXT       | e.g. 'poem' 'novel' 'screenplay' etc.                                           |
| work_status     | TEXT       | e.g. 'open' 'in-progress' 'trunked' or 'published'                              |
| pub_date        | DATE       | indicates when the manuscript was published                                     |
| venue_nbr       | INTEGER    | (DEPRECATED) (Foreign key) for venue_id to indicate where a work was published  |
| venue_name      | INTEGER    | (Foreign Key) for venue_title to indicate where a work was published            |
| work_file       | BLOB       | stores copy of the work as BLOB data                                            |
| work_filename   | TEXT       | (IN PROGRESS)                                                                   |


## 2. Where have you sent your work or where might you send it? 

TABLE: Venues  
DESCRIPTION: Each row describes a place where a submission could be sent  

| FIELD NAME    | DATA TYPE | DESCRIPTION                                               |
|---------------|-----------|-----------------------------------------------------------|
| venue_id      | INTEGER   | Primary Key for Venues table                              |
| venue_title   | TEXT      | Name of this venue                                        |
| venue_url     | TEXT      | Link to publication or submission guidelines              |
| venue_medium  | TEXT      | e.g. 'print' 'website' 'performance space' etc.           |
| venue_genre   | TEXT      | e.g. 'literary' 'science fiction' 'experimental' etc.     |
| venue_simul   | boolean   | if 'yes,' venue accepts simultaneous submissions          |
| venue_paid    | boolean   | if 'yes,' venue pays its contributors                     |
| venue_person  | TEXT      | Name of person at venue                                   |
| venue_email   | TEXT      | Contact e-mail for venue                                  |
| venue_note    | TEXT      | Notes about deadlines, preferences, etc.                  |


## 3. Which works have you sent to which venues and what happened? 

TABLE: Submissions  
DESCRIPTION: Each row describes a unique submission  

| FIELD NAME      | DATA TYPE  | DESCRIPTION                                          |
|-----------------|------------|------------------------------------------------------|
| sub_id          | INTEGER    | Primary Key for submissions table                    |
| work_name       | TEXT       | Foreign Key, refers to work_title of submitted piece | 
| cover_letter    | TEXT       | contents of submission cover letter                  |
| send_date       | DATE       | Submission date                                      |
| reply_date      | DATE       | Reply date                                           |
| sub_status      | TEXT       | Options like 'pending' 'accepted' or 'declined'      |
| sub_note        | TEXT       | Useful for storing archive of e-mail threads, etc.   |
| sub_file        | BLOB       | Stores the file that was submitted as a data BLOB    |
| sub_filename    | TEXT       | indicates what filename to use for sub_file          |    
