# Builds index.html (the page Vercel serves) from slot-allocation-desk.html.
# The desk file is written as page content only; this wraps it in a full HTML document.
# Run after every change to slot-allocation-desk.html:  .\build-index.ps1

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $here 'slot-allocation-desk.html'
$out  = Join-Path $here 'index.html'

$body = [IO.File]::ReadAllText($src, [Text.Encoding]::UTF8)
# The site has its own title, so drop the desk file's <title> line.
$body = [regex]::Replace($body, '^\s*<title>.*?</title>\s*', '', 'Singleline')

$head = @'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Cargoflow Mgnt Tool</title>
<style>
:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
body{margin:0;font:14px/1.45 system-ui,-apple-system,"Segoe UI",sans-serif}
img{max-width:100%}
[hidden]{display:none!important}
</style>
</head>
<body>
'@

[IO.File]::WriteAllText($out, $head + $body + "`n</body>`n</html>`n", (New-Object System.Text.UTF8Encoding $false))
Write-Output "Built $out"
