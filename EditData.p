DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
 
DO WHILE vlAns:
    
    DISPLAY SKIP 
        "1. Edit Client" SKIP
        "2. Edit Book" SKIP
        "3. Edit Loan" SKIP.
    SET viChoice LABEL "Please Choose an option to update" WITH SIDE-LABEL.        
    CASE viChoice:
        WHEN 1 THEN
            DO:
                REPEAT:
                    Prompt-for Clients.ClientId.
                    Find Clients USING Clients.ClientId.
                    Update Clients.Forename Clients.Surname 
                        WITH 1 COLUMN 1 DOWN.
                END.
            END.
        WHEN 2 THEN
            DO:
                REPEAT:
                    REPEAT:
                        Prompt-for Books.BookId.
                        Find Books USING Books.BookId.
                        Update Books.Author Books.BookTitle Books.Amount
                            WITH 1 COLUMN 1 DOWN.
                    END.
               end.
            END.
        WHEN 3 THEN
            DO:
                REPEAT:
                    REPEAT:
                        Prompt-for Loan.LoanId.
                        Find Loan USING Loan.LoanId.
                        Update Loan.BookId Loan.ClientId Loan.DateDue Loan.DateOut 
                            WITH 1 COLUMN 1 DOWN.
                    END.
                END.
            END.
      
    END CASE.
    MESSAGE "DO You Want To Continue updating data(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.
