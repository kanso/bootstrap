# Kanso Bootstrap

This package allows you to quickly start using [twitter
bootstrap](http://twitter.github.com/bootstrap/) in your Kanso project.  It
currently packages the 2.0-wip branch.

## Install

Add to your project's kanso.json dependencies setting:

```
"bootstrap": null
```

Run kanso install to install in your packages directory:

```
kanso install
```

## Configure 

You can simply include the bootstrap library as a static library or configure
bootstrap to be compiled with less.


### Compiled CSS

Create a css/less file ```static/css/example.less``` for your site that includes bootstrap:

```css
@import "packages/bootstrap/bootstrap/lib/bootstrap.less";
/* Now use bootstrap and less! */
body { background-color: @pink; }
```

Include the less file in your HTML:

*Note* we refer to the file with a ```.css``` extention because that is what it
compiles to.

```html
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="static/css/example.css" />
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
```

Tell Kanso to compile the less file and create an attachment:

```json
{
    "name": "example-app",
    "version": "0.0.1",
    "description": "The simplest possible app with bootstrap and less support.",
    "attachments": ["index.html", "static"],
    "less": {
        "compress": true,
        "compile": "static/css/example.less",
        "remove_from_attachments": true
    },
    "dependencies": {
        "attachments": null,
        "less-precompiler": null,
        "bootstrap": null
    }
}
```

### Static CSS

If you prefer to include the static file bootstrap.min.css in your project,
simply modify your template:

```html
<link type="text/css" src="packages/bootstrap/bootstrap/bootstrap.min.css" />
```

## Push

Do a kanso push to complete the build:

```
kanso push example
```

## Docs

Until 2.0 is released you can browse the docs locally in the package directory
under ```bootstrap/docs/index.html```.
