asciinema SharePoint
====================

Tools to embed recordings of terminal sessions from [asciinema recorder](https://github.com/asciinema/asciinema) using the self-hosting [asciinema player](https://github.com/asciinema/asciinema-player) within SharePoint web pages.

About
-----

Embedding asciinema recordings is an effective way of showing how a command-line application works or providing example terminal output. With the release of asciinema player 2.0, websites and blogs could self-host their own content, whether private or public. However, the requirement to insert JavaScript and custom CSS within the `<head>` of the web page make it a difficult challenge for SharePoint site users to take advantage of the new capabilities. The asciinema SharePoint tools create a simplified way for SharePoint users to embed asciinema recordings through the use of HTML iframes and JavaScript.

Getting Started
---------------

To insert an asciinema recording into a SharePoint page, follow the following steps:

1.	Upload the files for asciinema SharePoint to your SharePoint document library.
2.	View the page you wish to add the recording, and select "EDIT".
3.	Place the cursor in the location where you wish to insert the recording.
4.	Select the "Insert" tab on the ribon, then choose "Embed Code"
5.	Enter the code to embed asciinema SharePoint and options in the content window, then click "Insert"
6.	Click "Save"

A code sample for embedding into SharePoint is shown below:

```
<script src="asciinema-sharepoint.js" id="asciicast-example" data-file="example.ajson"></script>
```

Requirements
------------

The files for both [asciinema SharePoint](https://github.com/mbrancato/asciinema-sharepoint/releases) as well as [asciinema player](https://github.com/asciinema/asciinema-player/releases) must be uploaded to the SharePoint document library, or must be referenced via URL to another server which is accessible by users of the SharePoint site.

By default, **SharePoint will not serve files with a `.json` file extension.** Any suitable file extension will do, all the examples here use the extension `.ajson`. When the file source is some other web server which does properly serve `.json` files, this should not be an issue.

Usage
-----

As a wrapper to the asciinema player tools, all [options](https://github.com/asciinema/asciinema-player/blob/master/README.md#Options) are passed to the asciinema player via HTML tag attributes and parameter parsing. All options are specified using their name prefixed with the string `data-`. For example, to specify the `speed` option, the `<script>` tag would contain an attribute such as `data-speed="2"`.

### Required Attributes

**id**

Each recording requires an identifier specified by the `id` attribute in the calling `<script>` tag. All identifiers should be unique strings and must be prefixed with `asciicast-` in the `id` attribute value. For example, the identifier `demo` would be in a `<script>` tag as `id="asciicast-demo"`

The `id` attribute is the only attribute used by asciinema SharePoint that is not prefaced by the `data-` string.

**file**

The asciinema recorder saves recordings into a JSON file format. A URL, full path or relative path to the JSON file must be provided to the recording.

Examples
--------

**Basic example using full paths**

```
<script src="/DocumentLibrary/asciinema-sharepoint/asciinema-sharepoint.js" id="asciicast-example" data-file="/DocumentLibrary/recordings/example.ajson"></script>
```

**Specify advanced options**

```
<script src="asciinema-sharepoint.js" id="asciicast-example" data-file="example.ajson" data-speed="2" data-poster="npt:15" data-theme="tango" data-title="This is an example"></script>
```

Credit
------

Credit is due to [Marcin Kulik](http://ku1ik.com/), the creator of [asciinema.org](http://asciinema.org) and the [asciinema](https://github.com/asciinema) tools. The asciinema SharePoint tools were both inspired by and use code directly from these other projects.

License
-------

Some files contain code copyright © 2011-2016 Marcin Kulik.

The included jQuery components are licensed under the [MIT License](https://www.tldrlegal.com/l/mit).

All remaining code is licensed under the GPL, v3 or later. See LICENSE file for details.
