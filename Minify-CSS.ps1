# Initializing Paths

$javaPath   = "C:\Program Files\Java\jre6\bin\java.exe"
$yuiPath    = "D:\lib\yui-compressor\yuicompressor-2.4.7\build\yuicompressor-2.4.7.jar"
$outputPath = "D:\Output\yourfile-min.css"

# Concatenating Files

New-Item $outputPath -type file -force | out-null

$files =
"D:\Repository\source1.css",
"D:\Repository\source2.css",
"D:\Repository\source3.css"

foreach ($file in $files) {
    Write-Host $file
    $item = Get-Item $file
    $fileContent = Get-Content $item
    Add-Content $outputPath $fileContent
}

# Minifying Files

& $javaPath -jar $yuiPath --type css $outputPath -o $outputPath

$outputFile = Get-Item $outputPath
Write-Host "`r`n"
Write-Host Output:
Write-Host $outputFile