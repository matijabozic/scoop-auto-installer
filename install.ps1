# Fetch backup.json
$data = Get-Content backup.json -Raw | ConvertFrom-Json 

# We need these two to add buckets and unpack apps 
scoop install 7zip git

# Loop through bucket's, list and then add them
foreach ($bucket in $data.buckets) {
  if ($bucket -match " ") {
    $bucket = $bucket.split(" ")
    scoop bucket add $bucket[0] $bucket[1]
  }
  else {
    scoop bucket add $bucket
  }
}

# Updated scoop
scoop update

# Loop through application's list and install each application
foreach ($app in $data.apps) {
  scoop install $app
}

# Check status of scoop apps
scoop status

Read-Host -Prompt "Done, press Enter to exit!"
