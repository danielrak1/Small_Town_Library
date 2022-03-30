DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
 
DO WHILE vlAns:
    
    DISPLAY SKIP 
        "1. Add Book being loaned" SKIP
        "2. Book return" SKIP.
    SET viChoice LABEL "Please Choose a Option" WITH SIDE-LABEL.        
    CASE viChoice:
        WHEN 1 THEN
            DO:
                REPEAT:
                    PROMPT-FOR Loan.LoanId.
                    FIND Loan USING Loan.LoanId NO-ERROR.
                    IF NOT AVAILABLE Loan THEN 
                    DO:
                        CREATE Loan.
                        ASSIGN Loan.LoanId.  
                    END.
                    UPDATE Loan WITH 1 COLUMNS.
/*                    MESSAGE "DO You Want To add another book loan(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.*/
                END.
            END.
        WHEN 2 THEN
            DO:
                DEFINE VARIABLE del      AS LOGICAL NO-UNDO FORMAT "y/n".
                REPEAT:
/*                     Here we have a method to register a book coming in*/
                    REPEAT:
                        PROMPT-FOR Loan.LoanId.
                        FIND Loan USING Loan.LoanId.
                        DISPLAY Loan.LoanId.
                        del = NO.
                        UPDATE del LABEL "Enter ""y"" to confirm return".
                        IF del THEN DELETE Loan.
                    END.
                END.
            END.
  
      
    END CASE.
    MESSAGE "DO You Want To Continue(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.