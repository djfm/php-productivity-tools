# php-productivity-tools package

This package aims to provide GUI-like, but lightweight, tools to help with PHP development in Atom.

Currently the package only provides one command: `Insert Namespace`.

What this will do is look for a `composer.json` file in your project, and if found, then insert the appropriate namespace declaration into your current file.

Currently this only works with psr-4 namespaces but why use anything else?
