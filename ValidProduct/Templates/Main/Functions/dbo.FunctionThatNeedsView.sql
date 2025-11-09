DO $$
BEGIN
  IF NOT EXISTS (SELECT * FROM "SchemaSmith"."TestLog" WHERE "Msg" = 'dbo.MyView.sql') THEN
    RAISE EXCEPTION 'VIEW NOT FOUND';
  ELSE
    INSERT INTO "SchemaSmith"."TestLog" ("Msg") VALUES('dbo.FunctionThatNeedsView.sql');
  END IF;
END $$ LANGUAGE plpgsql;  
