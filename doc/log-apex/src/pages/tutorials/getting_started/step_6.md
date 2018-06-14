---
title: "Custom Appender"
description: "Custom Appender"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 6
---

## {$page.title}

You can create your own appenders. All appenders should implement the interface `Log.Appender`. To make things simple, most of the time you can directly extend `Log.DefaultAppender` to create a custom appender.

```javascript
public class CustomAppender extends Log.DefaultAppender {
    public override void append(Log.Context ctx) {
        String message = ctx.message;
        String pattern = (String)this.options.get('pattern');
        // Custom code
    }
}
```

Then you can add it to the configuration file.

```JSON
[
    {
        "patterns": [ ".*" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "CustomAppender",
                "options": {
                    "pattern": "YOUR PATTERN"
                }
            }
        ]
    }
]
```

You can set options to your custom appender like this.
