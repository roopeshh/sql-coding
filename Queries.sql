1.	How many copies of 	the book titled The Lost Tribe are owned by the library branch whose 	name is "Sharpstown"?
SELECT BC.No_Of_Copies
FROM BOOK_COPIES BC
INNER JOIN BOOK B ON BC.BookId=B.BookId and B.Title="The Lost Tribe"
INNER JOIN LIBRARY_BRANCH LB ON BC.BranchId=LB.BranchId and LB.BranchName = "Sharpstown";

2.	How many copies of 	the book titled The Lost Tribe are owned by each library branch?
SELECT BC.BranchId, count(BOOK_COPIES.No_Of_Copies)
FROM BOOK_COPIES BC
INNER JOIN BOOK B ON BC.BookId=BOOK.BookId and B.Title="The Lost Tribe"
GROUP BY BC.BranchId;

3.	Retrieve the names 	of all borrowers who do not have any books checked out .
SELECT BR.Name
FROM BORROWER BR
INNER JOIN BOOK_LOANS BL ON BR.CardNo!=BL.CardNo;

4.	For each book that 	is loaned out from the "Sharpstown" branch and whose 	DueDate is today,
retrieve the book title, the borrower's name, and 	the borrower's address.
SELECT B.Title, BR.Name, BR.Address
FROM BORROWER BR
INNER JOIN BOOK_LOANS BL ON BR.CardNo=BL.CardNo and BL.DueDate=CURRENT_DATE()
INNER JOIN BOOK B ON BL.BookId=B.BookId
INNER JOIN LIBRARY_BRANCH LB ON BL.BranchId=LB.BranchId and LB.BranchName="Sharpstown";

5.	For each library 	branch, retrieve the branch name and the total number of books 	loaned out from that branch.
SELECT LB.BranchName, count(*) as TotalBooksLoaned
FROM LIBRARY_BRANCH LB
INNER JOIN BOOK_LOANS BL ON LB.BranchId=BL.BranchId
GROUP BY LB.BranchName;

6.	Retrieve the 	names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
SELECT BR.Name, BR.Address, count(BL.BookId)
FROM BOOK_LOANS BL
INNER JOIN BORROWER BR ON BL.CardNo=BR.CardNo
GROUP BY BR.Name
HAVING count(BL.BookId)>5;

7.	For each book authored (or co-authored) by "Stephen King",
retrieve the title and the number of copies owned by the library branch whose 	name is "Central"
SELECT B.Title, count(*)
FROM BOOK B
INNER JOIN BOOK_AUTHORS BA ON BA.BookId=B.BookId AND BA.AuthorName="Stephen King"
INNER JOIN BOOK_COPIES BC ON BC.BookId=B.BookId
INNER JOIN LIBRARY_BRANCH LB ON LB.BranchId=BC.BranchId and LB.BranchName="Central"
