-- ANSI style
SELECT * FROM childtable JOIN parenttable p on childtable.CHILDTABLE_PARENT_KEY = p.PARENTTABLE_KEY;

-- ANSI style
SELECT * FROM childtable JOIN parenttable USING (parenttable_key);

-- Theta style
SELECT * FROM childtable, parenttable WHERE parenttable.PARENTTABLE_KEY = childtable.CHILDTABLE_PARENT_KEY;