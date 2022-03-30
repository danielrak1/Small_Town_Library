DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
 
DO WHILE vlAns:
    
    DISPLAY SKIP 
        "1. Add Client" SKIP
        "2. Add Book" SKIP.
    SET viChoice LABEL "Please Choose a Option" WITH SIDE-LABEL.        
    CASE viChoice:
        WHEN 1 THEN
            DO:
                REPEAT:
                    PROMPT-FOR Clients.ClientId.
                    FIND Clients USING Clients.ClientId NO-ERROR.
                    IF NOT AVAILABLE Client THEN 
                    DO:
                        CREATE Clients.
                        ASSIGN Clients.ClientId.  
                    END.
                    UPDATE Clients WITH 1 COLUMNS.
                END.
            END.
        WHEN 2 THEN
            DO:
                REPEAT:
                    PROMPT-FOR Books.BookId.
                    FIND Books USING Books.BookId NO-ERROR.
                    IF NOT AVAILABLE Books THEN 
                    DO:
                        CREATE Books.
                        ASSIGN Books.BookId.  
                    END.
                    UPDATE Books WITH 1 COLUMNS.
                END.
            END.
        
       
      
    END CASE.
    MESSAGE "DO You Want To Continue adding data(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.
