## What is this:

This is a PowerShell script that automates installation of [Scoop](https://scoop.sh/) applications defined in json file.

Scoop has `export` function but it's not very useful, as there is no way to export list of installed applications to a file, or to import that file and automatically install applications. In fact, `export` function does the same as `list` function, it just prints installed applications differently.

That's why this script was created. With this script you can backup a list of applications and buckets installed on a system in an external JSON file. And you can automatically install applications and buckets defined in an external JSON file.

## How to use it:

Edit `backup.json` file and add applications and buckets you want `install.ps1` script to install. These can be just application you want installed like `discord` or you can define bucket from which application should be installed like `extras/discord`.

To add buckets you need to provide bucket name and bucket source, one line string separated by space. For "known" Buckets you can provide just the name of the Bucket you want to add and Scoop already knows the source. It works either way.

If you want to backup installed applications and buckets, run `backup.ps1` and it will generate `backup.json` file with applications and buckets installed on your system. You can then use that generated backup.json to automatically install all the applications on another system. You would use `install.ps1` to install these. Take note that `backup.ps1` will overwrite existing `backup.json` file.
