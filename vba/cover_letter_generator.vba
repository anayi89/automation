'(c) IG Tech. 2018.
Sub coverLetterGenerator()
    Dim firstPrompt, lastPrompt, phonePrompt, emailPrompt, jobTitlePrompt, companyPrompt, sourcePrompt As String

    namePrompt = InputBox("Enter your name.")
    phonePrompt = InputBox("Enter your phone number.")
    emailPrompt = InputBox("Enter your email address.")
    jobTitlePrompt = InputBox("Enter the title of the job that you're applying for.")
    companyPrompt = InputBox("Enter the name of the company.")
    sourcePrompt = InputBox("Enter where you found the job posting.")

    'Handle errors related to the styles
    On Error Resume Next
        ActiveDocument.Styles("Name in the Header").Delete
        ActiveDocument.Styles("Contact Info in the Header").Delete
        ActiveDocument.Styles("Pick the Date").Delete
        ActiveDocument.Styles("Text in the Cover Letter").Delete
    On Error GoTo 0

    'Format the text of the cover letter
    Set nameHeader = ActiveDocument.Styles.Add(Name:="Name in the Header", Type:=wdStyleTypeParagraph)
    Set contactHeader = ActiveDocument.Styles.Add(Name:="Contact Info in the Header", Type:=wdStyleTypeParagraph)
    Set datePicker = ActiveDocument.Styles.Add(Name:="Pick the Date", Type:=wdStyleTypeParagraph)
    Set coverLetter = ActiveDocument.Styles.Add(Name:="Text in the Cover Letter", Type:=wdStyleTypeParagraph)

    With nameHeader
        .Font.AllCaps = True
        .Font.Name = "Helvetica Neue"
        .Font.Size = 22
        .Font.Spacing = 4.5
        .ParagraphFormat.Alignment = wdAlignParagraphCenter
        .ParagraphFormat.LineSpacing = LinesToPoints(1)
    End With

    With contactHeader
        .Font.Name = "Garamond"
        .Font.Size = 12
        .ParagraphFormat.Alignment = wdAlignParagraphCenter
        .ParagraphFormat.LineSpacing = LinesToPoints(1)
    End With

    With datePicker
        .Font.AllCaps = True
        .Font.Name = "Helvetica Neue"
        .Font.Size = 11
        .Font.Spacing = 5.9
        .ParagraphFormat.Alignment = wdAlignParagraphRight
        .ParagraphFormat.SpaceBefore = 10
    End With

    With coverLetter
        .Font.Name = "Garamond"
        .Font.Size = 12
        .ParagraphFormat.LineSpacing = LinesToPoints(1)
        .ParagraphFormat.Alignment = wdAlignParagraphJustify
    End With

    ' Insert text into the header
    With ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary)
        With .Range
            .Text = namePrompt & Chr(10) & phonePrompt & " " & Chr(149) & " " & emailPrompt
            .Style = "Contact Info in the Header"
            ' Format the name
            .Words(1).Style = "Name in the Header"
        End With
    End With

    ' Insert text into the body of the document
    With ActiveDocument.Paragraphs(1)
        With .Range
            ActiveDocument.ContentControls.Add(wdContentControlDate).DateDisplayFormat = "dddd, MMMM d, yyyy"
            .InsertAfter (Chr(10) & _
                "To Whom It May Concern" & _
                Chr(10) & _
                Chr(9) & _
                "My name is " & namePrompt & " and I am interested in applying for the " & jobTitlePrompt & " position at " & companyPrompt & ". " & _
                "I found your job post via " & sourcePrompt & ". I am applying for this position because..." & _
                Chr(10) & _
                "I am a good fit for this position because I have:" & _
                Chr(10) & _
                "- " & _
                Chr(10) & _
                "- " & _
                Chr(10) & _
                "- " & _
                Chr(10) & _
                Chr(9) & _
                "After reviewing my resume, I hope you will agree that I am a good fit for the " & jobTitlePrompt & " position. " & _
                "I look forward to elaborating on how my specific skills and abilities will benefit " & companyPrompt & ". " & _
                "Please contact me via phone at " & phonePrompt & " or via email at " & emailPrompt & " to arrange for a convenient meeting time." & _
                Chr(10) & _
                "Thank you for your consideration, and I look forward to hearing from you soon." & _
                Chr(10) & _
                "Regards," & _
                Chr(10) & _
                namePrompt)
            .Style = "Text in the Cover Letter"
        End With
        'Format the date
        With ActiveDocument.Content.Find
            .Text = "Click or tap to enter a date."
            .Forward = True
            .Execute
                If .Found = True Then
                    .Parent.Style = "Pick the Date"
                End If
        End With
    End With
End Sub
