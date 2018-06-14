---
title: "Async Logging"
description: "Async Logging"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 7
---

## {$page.title}

Sometimes when you have database operations in your appender, this will have impact on the performance of your normal code. In this case, we need to use async logging, which moves the logging execution into a queueable job and thus will not affect the current code.

To enable async logging, we need to use async appenders. Here is how we use the default async appender.

```JSON
[
    {
        "patterns": [ "testAsync" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "Log.DefaultAsyncAppender"
            }
        ]
    }
]
```

We use the system default asyn appender configured in this way.

The note is that at the end of our execution context, we need to explicitly **flush** our log information, otherwise they will get discarded.

```javascript
logger.debug('message');

// ...

Log.flush();
```
