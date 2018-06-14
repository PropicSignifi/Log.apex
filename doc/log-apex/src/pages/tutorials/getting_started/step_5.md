---
title: "Logging Appender"
description: "Logging Appender"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 5
---

## {$page.title}

Logging appenders are used to process the log information. For example, the default appender sends the log to `System.debug`.

The default appender supports a prefix pattern, which can customize the prefix of the message.

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

And your logger debugs some messages.

```javascript
logger.debug('message');
```

The output will be like 'CurrentClassName - CurrentMethodName - CurrentLineNumber - CurrentColumnNumber - message'.
