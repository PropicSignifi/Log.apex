---
title: "Configuration"
description: "Configuration"
layout: "guide"
icon: "code-file"
weight: 2
---

###### {$page.description}

<article id="1">

## Logging Configuration

We use a static resource containing a single JSON file to configure Log.apex.

```JSON
[
    {
        "patterns": [ "test" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "Log.DefaultAppender"
            }
        ]
    }
]
```

</article>
