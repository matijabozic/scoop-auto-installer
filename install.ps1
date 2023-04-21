# Fetch backup.json
$data = Get-Content backup.json -Raw | ConvertFrom-Json 

# We need these git and 7zip to add buckets and unpack apps 
scoop install 7zip git

# Loop through bucket's list and add them
foreach ($bucket in $data.buckets) {
  if ($bucket -match " ") {
    $bucket = $bucket.split(" ")
    scoop bucket add $bucket[0] $bucket[1]
  }
  else {
    scoop bucket add $bucket
  }
}

# Updated buckets
scoop update

# Loop through application's list and install them
foreach ($app in $data.apps) {
  scoop install $app
}

# Show scoop status
scoop status

Read-Host -Prompt "Done, press Enter to exit!"
