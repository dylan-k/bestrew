CREATE TABLE "submissions" (
	 "sub_id" INTEGER PRIMARY KEY NOT NULL,
	 "venue_nbr" INT NOT NULL,
	 "work_nbr" INT NOT NULL,
	 "cover_letter" TEXT DEFAULT 'No Cover Letter Entered',
	 "send_date" DATE DEFAULT NULL,
	 "reply_date" DATE DEFAULT NULL,
	 "sub_status" TEXT DEFAULT NULL,
	 "sub_note" TEXT DEFAULT NULL,
	 "sub_file" blob DEFAULT NULL,
	PRIMARY KEY("sub_id"),
	FOREIGN KEY ("venue_nbr") REFERENCES "venues" ("venue_id") ON UPDATE CASCADE,
	FOREIGN KEY ("work_nbr") REFERENCES "works" ("work_id") ON UPDATE CASCADE
);

CREATE TABLE "main"."venues" (
	 "venue_id" INTEGER PRIMARY KEY NOT NULL,
	 "venue_title" TEXT NOT NULL,
	 "venue_url" TEXT DEFAULT NULL,
	 "venue_medium" TEXT DEFAULT NULL,
	 "venue_genre" TEXT DEFAULT NULL,
	 "venue_address" TEXT DEFAULT NULL,
	 "venue_person" TEXT DEFAULT NULL,
	 "venue_simul" BOOLEAN DEFAULT 0,
	 "venue_paid" BOOLEAN DEFAULT 0,
	 "venue_note" TEXT DEFAULT NULL,
	PRIMARY KEY("venue_id"),
	CONSTRAINT "Titles" UNIQUE (venue_title COLLATE NOCASE ASC),
	CONSTRAINT "URLs" UNIQUE (venue_url COLLATE NOCASE ASC)
);


CREATE TABLE "works" (
	 "work_id" integer PRIMARY KEY NOT NULL,
	 "work_title" text DEFAULT NULL,
	 "work_type" text DEFAULT NULL,
	 "work_status" text DEFAULT NULL,
	 "pub_date" text DEFAULT NULL,
	 "venue_nbr" integer DEFAULT NULL,
	 "work_file" blob DEFAULT NULL,
	PRIMARY KEY("work_id"),
	FOREIGN KEY ("venue_nbr") REFERENCES "venues" ("venue_id")
);
