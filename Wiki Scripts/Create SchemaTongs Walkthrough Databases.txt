\connect postgres;  -- Depending on your tool you might have to connect manually to the correct database

DROP DATABASE IF EXISTS "TestMain";
CREATE DATABASE "TestMain";

\connect "TestMain"; -- Depending on your tool you might have to connect manually to the correct database

DROP TABLE IF EXISTS public."TestTable";

CREATE TABLE public."TestTable"
  ("TestID" UUID NOT NULL CONSTRAINT "PK_TestTable" PRIMARY KEY,
   "ParentID" UUID CONSTRAINT "FK_SelfReference" REFERENCES public."TestTable",
   "DateCreated" TIMESTAMP,
   "Status" SMALLINT DEFAULT 0 NOT NULL CONSTRAINT "CK_Test" CHECK ("Status" < 20),
    "SomeText" VARCHAR(2000));

CREATE INDEX "CIX_TestTable_DateCreated" ON public."TestTable" ("DateCreated");

DROP DATABASE IF EXISTS "TestSecondary";
CREATE DATABASE "TestSecondary";

\connect "TestSecondary"; -- Depending on your tool you might have to connect manually to the correct database

DROP TABLE IF EXISTS public."TestSecondaryTable";

CREATE TABLE public."TestSecondaryTable"
  ("TestSecondaryID" UUID NOT NULL CONSTRAINT "PK_TestSecondaryTable" PRIMARY KEY,
   "DateCreated" TIMESTAMP NOT NULL,
   "Status" SMALLINT);

CREATE INDEX "CIX_DateCreated" ON public."TestSecondaryTable" ("DateCreated");

