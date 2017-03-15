# Copyfrom

Copyfrom is a simple bash function for OSX that attempts to copy a directory and it's sub directories into the current working directory.

## TLDR

Create a directory to store your packages under` `~/Desktop/packages`, create a `demo-package` directory containing some files, then run the following from your project:

````
cpfrom demo-package
````

* * *

This was created to simplify merging common files & directories into projects. Most likely the same functionality can be achieved with `rsync` but that wouldn't have been quite as fun.

## Installation

You can copy the `cpfrom` function from [cpfrom.sh](cpfrom.sh) and add to your `.bash_profile`. If you would like tab completions, you can also copy the contents of [completions.sh](completions.sh) into your `.bash_profile`.

You will need to `source ~/.bash_profile`, or re-open your Terminal to load these changes.

## Usage

First you must define a directory to act as a package repository. For example we can store our packages inside `~/Desktop/packages`.

Packages should be self-contained within a subdirectory. Below we have a package which can be identified by the unique directory name `demo-package`.

* `~/Desktop/packages/demo-package/css/demo.css`
* `~/Desktop/packages/demo-package/css/demo-theme.css`
* `~/Desktop/packages/demo-package/src/Controllers/DemoController.php`

To merge this package into your project, you can run `cpfrom demo-project` which will attempt to copy the `demo-project` into your current working directory.

## Conflicts

Packages can only be installed if the target directory does not already contain the files you wish to install. If any of those files exist, then the file will be compared against the source using `cmp`. If the files are identical it considers it safe to overwrite, however if a difference is found it's marked as "cannot be copied", and no files will be installed.

## Disclaimer

By running this code, you're choosing to do so at your own risk. I accept no responsibility for any damages caused as a result of this software.

## License

There is no license.