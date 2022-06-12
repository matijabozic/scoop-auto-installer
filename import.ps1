# Fetch backup.json
$data = Get-Content backup.json -Raw | ConvertFrom-Json 

# We need these two to add buckets and unpack apps 
scoop install git 7zip

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
foreach ($app in $data.applications) {
  scoop install $app
}

# Update all applications in case some of them were already installed
scoop update *

Read-Host -Prompt "Done, press Enter to exit!"
