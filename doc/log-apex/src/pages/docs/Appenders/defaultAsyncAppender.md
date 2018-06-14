---
title: "Default Async Appenders"
description: "Default Async Appenders"
layout: "guide"
icon: "cloud"
weight: 5
---

###### {$page.description}

<article id="1">

## Default Appender

Log.apex has a default async appender, `Log.DefaultAsyncAppender`, which outputs logging information to
`System.debug` asynchronously in a queueable job.

The default async appender has similar behavior as the default appender except that it runs asynchronously.

Here is how you configure it.

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

</article>

<article id="2">

## Options

The default async appender shares the same options as the default appender.

</article>
