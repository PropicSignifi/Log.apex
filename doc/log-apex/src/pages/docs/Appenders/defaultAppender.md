---
title: "Default Appenders"
description: "Default Appenders"
layout: "guide"
icon: "cloud"
weight: 2
---

###### {$page.description}

<article id="1">

## Default Appender

Log.apex has a default appender, `Log.DefaultAppender`, which outputs logging information to
`System.debug`.

The default appender outputs messages with current class name, current method name, current line number and
current column number.

```
11:18:39.50 (103576326)|USER_DEBUG|[984]|DEBUG|AnonymousBlock.(unknown method) Line 2 Column 1 - debug message
```

</article>

<article id="2">

## Options

We can customize how the prefix message looks like:

```JSON
[
    {
        "patterns": [ "test" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "Log.DefaultAppender",
                "options": {
                    "prefixPattern": "%t - %m - %l - %c - "
                }
            }
        ]
    }
]
```

And debug like this:

```javascript
logger.debug('message');
```

The output will be like 'CurrentClassName - CurrentMethodName - CurrentLineNumber - CurrentColumnNumber - message'.

</article>
