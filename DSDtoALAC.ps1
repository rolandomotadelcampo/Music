$Working_Directory = Read-Host -Prompt "Enter the working directory: " 
$Output_Directory = Read-Host -Prompt "Enter the output directory: " 

Set-Location $Working_Directory

$DSD_Tracks = get-childitem -path "*" -recurse -filter "*.dsf" # Get all .dsf files in the working directory

foreach ($song in $DSD_Tracks) { #loop through all the tracks
    $outputSong = [System.IO.Path]::ChangeExtension($song.FullName, ".m4a") # create the output file name
    ffmpeg.exe -i $song.FullName -acodec alac -ar 88200 $outputSong # convert the track
}

Get-Item -Path $Working_Directory -Recurse -Filter "*.m4a" | Move-Item -Destination $Output_Directory # move the converted files to the output directory