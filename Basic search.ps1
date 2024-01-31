get-childitem E:\Lasernet\Grab_VWBLUC002 | 
where-object {$_.name | select-string 'KBC'} |
 select-string 'POST.REST:   13' | 
Set-Content blob2.txt