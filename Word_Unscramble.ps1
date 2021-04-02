<#
 .Synopsis
  Basic script to complete HackThisSite Programming mission #1

 .Description
  Save the wordlist to "C:\Temp" and create "C:\Temp\scrambled.txt".  Paste the wordlist from the mission in "C:\Temp\scrambled.txt" and save the file.  Then run the script.
  Copy paste the output into the text field and hit submit on the mission page.
#>

#Create empty array for the correct words, even though it's actually a string output.  This just made it easier when troubleshooting.
$CorrectWords = @()

#import dictionary
$wordlist = Get-Content C:\temp\wordlist.txt

#import scrambled word list
$ScrambledWords = Get-Content C:\temp\scrambled.txt

#Main foreach scrambled word
foreach ($Scramble in $ScrambledWords) {
    
    #Grab the length of the scrambled word
    $PossibleWords = $wordlist | Where-Object { $_.Length -eq $Scramble.Length }
    
    #foreach to compare possible words with the current scrambled word
    foreach ($Word in $PossibleWords) {   
    
        #turn both strings to arrays and compare them for only matches  
        $Compare = Compare-Object -ReferenceObject $Word.ToCharArray() -DifferenceObject $Scramble.ToCharArray() -IncludeEqual -ExcludeDifferent
    
        #Grab only words that have the same amount of matched letters as the scrambled word
        if ($Compare.Length -eq $Scramble.Length) {
            $CorrectWords += "$word, "
        }
    }
}

Write-host $CorrectWords