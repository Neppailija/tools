param ( [string]$path, [string]$filemask, [switch]$recurse=$false, [switch]$help=$false, [switch]$del=$false)

if($help){
	write-host 'Usage: file_searcher.ps1 "path" "filemask" -recurse if needed'
	write-host 'Example: file_searcher.ps1 "c:\temp" "movie*.av*" -recurse'
	write-host "To delete the found files after searching run the script again like so file_searcher.ps1 -del"
	exit
}

if($del){
	
	Write-host "Deleting files listed in files.txt..."
	foreach ($f in Get-Content .\files.txt) {
	remove-item $f
	}
	write-host "Files from files.txt have been deleted"
	exit
}

write-host "Path: " $path"\"
write-host "Filemask: " $filemask
write-host "Searching and outputting to .\files.txt ..."

if($recurse){
   cmd /c "dir /a-d /b /s $path\$filemask" | out-file ".\files.txt"}
  else{ cmd /c "dir /a-d /b $path\$filemask" | out-file ".\files.txt"}


  
write-host "Total number of lines aka files:"
$files = Get-Content .\files.txt 
$files | Measure-Object -Line
