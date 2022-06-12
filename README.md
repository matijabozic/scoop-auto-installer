## What is this:

This is a simple PowerShell script that automates installation of [Scoop](https://scoop.sh/) applications defined in json file.

Scoop has `export` function but it's not very useful, as there is no way to export list of installed applications to a file, or to import that file and automatically install applications. In fact, `export` function does the same as `list` function, it just prints installed applications differently.

So that's why this script was created, to automate installation of applications defined in an external json file, and to make it possible to backup buckets and applications installed on the system, for later installation. 

## How to use it:

Edit `backup.json` file and add applications and buckets you want `import.ps1` script to install. These can be just application you want installed like `discord` or you can define bucket from which application should be installed like `extras/discord`.

For buckets you need to provide bucket name and bucket source, one line string separated by space. For "known" Buckets you can provide just the name of the Bucket you want to add and Scoop already knows the source. It works either way.

If you want to backup installed applications and buckets, you can run `export.ps1` and it will generate `backup.json` file with applications and buckets installed on your system.
You can then use `import.ps1` to install these. Take note that `export.ps1` will overwrite existing `backup.json` file.
