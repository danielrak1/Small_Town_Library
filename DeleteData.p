DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
DEFINE VARIABLE del      AS LOGICAL NO-UNDO FORMAT "y/n".
 
DO WHILE vlAns:
    
    DISPLAY SKIP 
        "1. Delete Client" SKIP
        "2. Delete Book" SKIP.
    SET viChoice LABEL "Please Choose an option to update" WITH SIDE-LABEL.        
    CASE viChoice:
        WHEN 1 THEN
            DO:
                REPEAT:
                    PROMPT-FOR Clients.clientId.
                    FIND Clients USING Clients.clientId.
                    DISPLAY Clients.clientId.
                    del = NO.
                    UPDATE del LABEL "Enter ""y"" to confirm delete".
                    IF del THEN DELETE Clients.
                END.
            END.
        WHEN 2 THEN
            DO:
                REPEAT:
                    PROMPT-FOR Books.BookId.
                    FIND Books USING Books.BookId.
                    DISPLAY Books.BookId.
                    del = NO.
                    UPDATE del LABEL "Enter ""y"" to confirm delete".
                    IF del THEN DELETE Books.
                END.
            END.
      
    END CASE.
    MESSAGE "DO You Want To Continue deleting data(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.

