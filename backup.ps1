# Placeholder for buckets and applications
$data = @{}
$data["buckets"] = @()
$data["apps"] = @()

# Populate $data with applications
$apps = scoop list 
foreach ($app in $apps) {
  $data["apps"] += $app.Source + "/" + $app.Name
}

# Populate $data with buckets
$buckets = scoop bucket list
foreach ($bucket in $buckets) {
  $data["buckets"] += $bucket.Name + " " + $bucket.Source
}

# Output file as JSON
$data | ConvertTo-Json | Out-File backup.json

Read-Host -Prompt "Scoop buckets and apps are saved in backup.json, press Enter to exit"
