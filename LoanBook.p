DEFINE VARIABLE vlAns    AS LOGICAL NO-UNDO INITIAL TRUE.
DEFINE VARIABLE viChoice AS INTEGER NO-UNDO.
 
DO WHILE vlAns:
    
    DISPLAY SKIP 
        "1. Add Book being loaned" SKIP
        "2. Book return" SKIP
        "3. Report of all
books lent out to clients with deadlines" SKIP.
        
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
                END.
            END.
        WHEN 2 THEN
            DO:
                DEFINE VARIABLE del AS LOGICAL NO-UNDO FORMAT "y/n".
                REPEAT:
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
        WHEN 3 THEN
            DO:
                define query q1 for Loan.
                Open Query q1 for each Loan Where Loan.ClientId>=1.
                get  first q1.

                DO WHILE NOT QUERY-OFF-END('q1'):          
    
                    DISPLAY Loan.LoanId Loan.BookId Loan.ClientId Loan.DateDue WITH FRAME frame1 10 DOWN.
  
                    DOWN WITH FRAME frame1.

                    GET NEXT q1.
                END.

                DISPLAY NUM-RESULTS('q1') LABEL "Number of records".

                CLOSE QUERY q1.   
            END.
  
      
    END CASE.
    MESSAGE "DO You Want To Continue(Yes/No)" VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO SET vlAns.
END.