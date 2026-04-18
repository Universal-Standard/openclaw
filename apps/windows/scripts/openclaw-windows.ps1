param(
  [string]$Url = "http://127.0.0.1:18789"
)

$ErrorActionPreference = "Stop"

function Start-FallbackBrowser {
  param([string]$TargetUrl)
  Write-Host "WinForms WebBrowser host unavailable; opening default browser: $TargetUrl"
  Start-Process $TargetUrl | Out-Null
}

try {
  Add-Type -AssemblyName System.Windows.Forms
} catch {
  Start-FallbackBrowser -TargetUrl $Url
  exit 0
}

try {
  Add-Type -AssemblyName System.Drawing
} catch {
  Start-FallbackBrowser -TargetUrl $Url
  exit 0
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "OpenClaw Desktop (Windows)"
$form.Width = 1200
$form.Height = 800
$form.StartPosition = "CenterScreen"

$browser = New-Object System.Windows.Forms.WebBrowser
$browser.Dock = [System.Windows.Forms.DockStyle]::Fill
$browser.ScriptErrorsSuppressed = $true
$browser.Navigate($Url)

$form.Controls.Add($browser)
[void]$form.ShowDialog()
