$Working_Directory = Read-Host -Prompt "Enter the working directory: "

Set-Location $Working_Directory

$DSD_Tracks = get-childitem -path "*" -recurse -filter "*.dsf"

foreach ($song in $DSD_Tracks) {
    $outputSong = [System.IO.Path]::ChangeExtension($song.FullName, ".m4a")
    ffmpeg.exe -i $song.FullName -acodec alac -ar 88200 $outputSong
}