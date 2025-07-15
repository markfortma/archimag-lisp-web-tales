# archimag-lisp-web-tales

## Description

This repository is working code from "Lisp Web Tales" by Pavel Penev.
It works on SBCL v2.5.6, and as of 14 Jul 2025, the code worked on Arch Linux 6.15.5-arch1-1
with sbcl, postgresql, and valkey (pka Redis).

## Special Notes

In "Lisp Web Tales," the author uses <<<module>>>:start-<<<project>>>. My code exports as
<<<module>>>:start-it/<<<module>>>:stop-it because I thought it redundant that the module and start function
would repeat the module name.

## Contents

### blogdemo/

Code from Chapter 2 "The Basics"

### closure-hello/

Code from Chapter 3 "HTML Generation and Templating"

### linkdemo

* linkdemo-postgres.tar.gz - This is the first version of linkdemo with PostgreSQL added, from Chapter 5-6
* linkdemo-redis.tar.gz    - This is the second version of linkdemo with Redis added, from Chapter 7
* linkdemo-authdemo.tar.gz - This is the final version of linkdemo using authdemo, from Chapter 9

### list-dir/

Code inspired by Chapter 8; however, the author doesn't expound on blogapp so this is just
using mount-module and restas-directory-publisher to host content from static/

### authdemo/

Code from Chapter 9 "Modules as reusable components part II: Implementing a Reusable Module"

### system-index.txt

This file is automatically updated by sbcl called via (ql:quickload ...)


## Instructions

1. Install an operating system, such as Windows or Linux
2. Install ```sbcl```, following the platform's recommendations
3. Install [quicklisp](https://www.quicklisp.org/beta/#installation)
4. Install ```git``` and ```git clone``` this repository
5. Copy these directory contents into quicklisp's "local-projects" directory (e.g. ~/quicklisp/local-projects)
6. Execute ```sbcl``` and run (ql:quickload <module-dir>)

## Related GitHub Repositories

* [cl-closure-template](https://github.com/archimag/cl-closure-template)
* [archimag/restas](https://github.com/archimag/restas)
* [archimag/restas-directory-publisher](https://github.com/archimag/restas-directory-publisher)

## Book Reference

[Lisp Web Tales](http://learnpub.com/lispwebtales) by Pavel Penev