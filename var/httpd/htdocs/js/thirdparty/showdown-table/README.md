Showdown's Table Extension
==========================

[![Build Status](https://travis-ci.org/showdownjs/table-extension.svg)](https://travis-ci.org/showdownjs/table-extension) [![npm version](https://badge.fury.io/js/showdown-table.svg)](http://badge.fury.io/js/showdown-table) [![npm version](https://badge.fury.io/bo/showdown-table.svg)](http://badge.fury.io/bo/showdown-table) 

------

**Add markdown table flavor to [showdown](https://github.com/showdownjs/showdown)**

Adds support for:

    | Col 1   | Col 2                                              |
    |======== |====================================================|
    |**bold** | ![Valid XHTML] (http://w3.org/Icons/valid-xhtml10) |
    | Plain   | Value                                              |



## Installation

### With [npm](http://npmjs.org)

    npm install showdown-table

### With [bower](http://bower.io/)

    bower install showdown-table

### Manual

You can also [download the latest release zip or tarball](https://github.com/showdownjs/table-extension/releases) and include it in your webpage, after showdown:

    <script src="showdown.min.js">
    <script src="showdown-table.min.js">

### Enabling the extension

After including the extension in your application, you just need to enable it in showdown.

    var converter = new showdown.Converter({extensions: ['table']});

## Example

```javascript
var converter = new showdown.Converter({extensions: ['table']}),
    input = '| Col 1   | Col 2                                              |' +
            '|======== |====================================================|' +
            '|**bold** | ![Valid XHTML] (http://w3.org/Icons/valid-xhtml10) |' +
            '| Plain   | Value                                              |';
    html = converter.makeHtml(input);
    console.log(html);
```

This should output the equivalent to:

```html
<table>
  <tr>
    <td>Col 1</td>
    <td>Col 2</td>
  </tr>
  <tr>
    <td><strong>bold</strong></td>
    <td><img alt="Valid XHTML" src="http://w3.org/Icons/valid-xhtml10"></td>
  </tr>
  <tr>
    <td>Plain</td>
    <td>Value</td>
  </tr>
</table>
```

## License
These files are distributed under BSD license. For more information, please check the [LICENSE file](https://github.com/showdownjs/table-extension/blob/master/LICENSE) in the source code.
