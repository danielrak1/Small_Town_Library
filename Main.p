Define Variable opt      as integer no-undo.
Define Variable opt2     as integer no-undo.
DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
 

 
DO WHILE vlAns:
    Display "Welcome to our modernized library v1 !".
    Display "Our library can add, edit and delete data and loan out books.".
    DISPLAY SKIP 
        "1. Add data" SKIP
        "2. Edit data" SKIP
        "3. Delete data" SKIP
        "4. Loan book" SKIP.
                 
    SET viChoice LABEL "Please Choose an Option" WITH SIDE-LABEL.
    CASE viChoice:
        WHEN 1 THEN
            DO:
                run AddData.p.
            END.
        WHEN 2 THEN
            DO:
                run EditData.p.
            END.    
        WHEN 3 THEN
            DO:
                run DeleteData.p.
            END.
        WHEN 4 THEN
            DO:
                run LoanBook.p.
            END.
    END CASE.
    MESSAGE "DO You Want To Continue(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.