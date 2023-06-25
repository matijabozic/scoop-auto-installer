## What is this:

This is a PowerShell script that automates installation of [Scoop](https://scoop.sh/) applications defined in external json file.

With this script you can backup a list of applications and buckets installed on a system in an external JSON file. And you can automatically install applications and buckets defined in that a JSON file.

## How to use it:

Edit `backup.json` file and add applications and buckets you want `install.ps1` script to install. These can be just application you want installed like `discord` or you can define bucket from which application should be installed like `extras/discord`.

To add buckets you need to provide bucket name and bucket source, one line string separated by space. For "known" Buckets you can provide just the name of the Bucket you want to add and Scoop already knows the source. It works either way.

If you want to backup applications and buckets installed on your system, run `backup.ps1` and it will generate `backup.json`. You can then use that generated backup.json to automatically install all the applications on another system using `install.ps1`. Take note that `backup.ps1` will overwrite existing `backup.json` file.