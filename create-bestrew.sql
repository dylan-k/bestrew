/*
Source Server         : Bestrew Submissions Tracker
Source Server Version : 30808
Source Host           : :0
Target Server Type    : SQLite
Target Server Version : 30808
File Encoding         : 65001
Date: 2016-01-31 13:50:30
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for gigs
-- ----------------------------
DROP TABLE IF EXISTS "main"."gigs";
CREATE TABLE "gigs" (
	 "gig_title" text NOT NULL,
	 "gig_place" text,
	 "gig_date" date NOT NULL,
	 "gig_url" TEXT,
	PRIMARY KEY("gig_title")
);

-- ----------------------------
-- Table structure for gigs_works
-- ----------------------------
DROP TABLE IF EXISTS "main"."gigs_works";
CREATE TABLE "gigs_works" (
	 "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "gig_name" TEXT,
	 "work_name" TEXT,
	 "gig_order" integer,
	CONSTRAINT "gigref" FOREIGN KEY ("gig_name") REFERENCES "gigs" ("gig_title"),
	CONSTRAINT "workref" FOREIGN KEY ("work_name") REFERENCES "works" ("work_title")
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Table structure for sqlite_sp_functions
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_sp_functions";
CREATE TABLE [sqlite_sp_functions]( [name] TEXT, [text] TEXT );

-- ----------------------------
-- Table structure for sqlite_stat1
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_stat1";
CREATE TABLE sqlite_stat1(tbl,idx,stat);

-- ----------------------------
-- Table structure for sqlite_stat4
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_stat4";
CREATE TABLE sqlite_stat4(tbl,idx,neq,nlt,ndlt,sample);

-- ----------------------------
-- Table structure for sqlite_vs_links_names
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_vs_links_names";
CREATE TABLE "sqlite_vs_links_names"( "name" TEXT, "alias" TEXT );

-- ----------------------------
-- Table structure for sqlite_vs_properties
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_vs_properties";
CREATE TABLE "sqlite_vs_properties"( "parentType" TEXT, "parentName" TEXT, "propertyName" TEXT, "propertyValue" TEXT );

-- ----------------------------
-- Table structure for submissions
-- ----------------------------
DROP TABLE IF EXISTS "main"."submissions";
CREATE TABLE "submissions" (
"sub_id"  INTEGER NOT NULL,
"venue_name"  TEXT,
"work_name"  TEXT,
"cover_letter"  TEXT COLLATE NOCASE  DEFAULT NULL,
"send_date"  DATE DEFAULT NULL,
"reply_date"  DATE DEFAULT NULL,
"sub_status"  TEXT COLLATE NOCASE  DEFAULT NULL,
"sub_note"  TEXT DEFAULT NULL,
"sub_file"  BLOB DEFAULT NULL,
"sub_filename"  TEXT,
PRIMARY KEY ("sub_id" ASC),
CONSTRAINT "venue_submission" FOREIGN KEY ("venue_name") REFERENCES "venues" ("venue_title") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "work_submission" FOREIGN KEY ("work_name") REFERENCES "works" ("work_title") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "submission_status_check" CHECK (sub_status IS NULL OR sub_status = 'Draft' OR sub_status = 'Pending' OR sub_status = 'Declined' OR sub_status = 'Withdrawn' OR sub_status = 'Accepted' OR sub_status = 'Published')
);

-- ----------------------------
-- Table structure for venues
-- ----------------------------
DROP TABLE IF EXISTS "main"."venues";
CREATE TABLE "venues" (
	 "venue_id" Integer NOT NULL,
	 "venue_title" Text NOT NULL COLLATE NOCASE,
	 "venue_url" Text DEFAULT NULL COLLATE NOCASE,
	 "venue_medium" Text DEFAULT NULL COLLATE NOCASE,
	 "venue_genre" Text DEFAULT NULL COLLATE NOCASE,
	 "venue_simul" Boolean DEFAULT 0,
	 "venue_paid" Boolean DEFAULT 0,
	 "venue_person" Text DEFAULT NULL COLLATE NOCASE,
	 "venue_email" Text DEFAULT NULL COLLATE NOCASE,
	 "venue_note" Text DEFAULT NULL COLLATE NOCASE,
	PRIMARY KEY("venue_id"),
	CONSTRAINT "Unique Venue Title " UNIQUE ("venue_title" COLLATE NOCASE ASC)
);

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS "main"."works";
CREATE TABLE "works" (
	 "work_id" integer NOT NULL ON CONFLICT IGNORE,
	 "work_title" text NOT NULL DEFAULT NULL COLLATE NOCASE,
	 "work_type" text DEFAULT NULL COLLATE NOCASE,
	 "work_status" text DEFAULT NULL COLLATE NOCASE,
	 "pub_date" text DEFAULT NULL,
	 "venue_nbr" integer DEFAULT NULL,
	 "venue_name" text,
	 "work_file" blob DEFAULT NULL,
	 "work_filename" text,
	PRIMARY KEY("work_id"),
	CONSTRAINT "unique_work_title" UNIQUE ("work_title" COLLATE NOCASE ASC),
	CONSTRAINT "work_status_check" CHECK (work_status IS NULL OR work_status = 'Draft' OR work_status = 'Accepted' OR work_status = 'Available' OR work_status = 'Pending' OR work_status = 'Published' OR work_status = 'Self-Published' OR work_status = 'Trunked')
);

-- ----------------------------
-- View structure for Days Out
-- ----------------------------
DROP VIEW IF EXISTS "main"."Days Out";
CREATE VIEW "Days Out" AS 
-- count the number of days the submissions have been out
SELECT work_name, venue_name, julianday(reply_date) - julianday(send_date) AS DaysOut FROM submissions;

-- ----------------------------
-- View structure for Submissions Pending
-- ----------------------------
DROP VIEW IF EXISTS "main"."Submissions Pending";
CREATE VIEW "Submissions Pending" AS SELECT
	s.sub_id,
	w.work_title,
	v.venue_title,
	s.sub_status,
	julianday(strftime('%Y-%m-%d', datetime('now'))) - julianday(s.send_date) AS DaysOut,
	count(s.work_name) AS SubCount
FROM
	submissions AS s
INNER JOIN venues AS v ON s.venue_name = v.venue_title
INNER JOIN works AS w ON s.venue_name = v.venue_title
AND s.work_name = w.work_title
WHERE s.sub_status IS 'Pending'
GROUP BY
	s.work_name;

-- ----------------------------
-- View structure for Submissions View
-- ----------------------------
DROP VIEW IF EXISTS "main"."Submissions View";
CREATE VIEW "Submissions View" AS SELECT
	s.sub_id,
	w.work_title,
	v.venue_title,
	s.sub_status,
	s.send_date, 
	s.reply_date, 
	CASE WHEN reply_date 
		IS NULL THEN 0 ELSE 1 
	END AS DaysOut,
	count(s.work_name) AS SubCount
FROM
	submissions AS s
INNER JOIN venues AS v ON s.venue_name = v.venue_title
INNER JOIN works AS w ON s.venue_name = v.venue_title
AND s.work_name = w.work_title
GROUP BY
	s.work_name
ORDER BY
	s.send_date DESC;

-- ----------------------------
-- View structure for Works in Progress
-- ----------------------------
DROP VIEW IF EXISTS "main"."Works in Progress";
CREATE VIEW "Works in Progress" AS SELECT w.work_id, 
	w.work_title, 
	w.work_type,
	w.work_status
FROM works AS w
WHERE w.work_status IN ('Pending','Draft');

-- ----------------------------
-- View structure for Works Published
-- ----------------------------
DROP VIEW IF EXISTS "main"."Works Published";
CREATE VIEW "Works Published" AS SELECT
	w.work_title,
	v.venue_title,
w.pub_date,
w.work_type
FROM
	works AS w
INNER JOIN venues AS v ON w.venue_nbr = v.venue_id
WHERE
w.work_status is 'Published';

-- ----------------------------
-- Triggers structure for table submissions
-- ----------------------------
DROP TRIGGER IF EXISTS "main"."Create Via Submissions Table";
DELIMITER ;;
CREATE TRIGGER "Create Via Submissions Table" AFTER INSERT ON "submissions" FOR EACH ROW
BEGIN

--insert a new work
	INSERT INTO "works" (work_title)
	SELECT new.work_name
	WHERE 
	new.work_name NOT IN (SELECT work_title FROM works)
	AND 
	new.work_name NOT NULL;

--insert a new venue
	INSERT INTO "venues" (venue_title)
	SELECT new.venue_name
	WHERE 
	new.venue_name NOT IN (SELECT venue_title FROM venues)
	AND 
	new.venue_name NOT NULL;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS "main"."Update Venue Via Submission Table";
DELIMITER ;;
CREATE TRIGGER "Update Venue Via Submission Table" AFTER UPDATE OF "venue_name" ON "submissions"
BEGIN
  /* Trigger action (UPDATE, INSERT, DELETE or SELECT statements) goes here. */
	UPDATE venues
	SET venue_title = new.venue_name 
	WHERE venue_id  = (SELECT venue_id FROM venues WHERE venue_title = old.venue_name);
END
;;
DELIMITER ;
