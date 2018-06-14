---
title: "Custom Async Appender"
description: "Custom Async Appender"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 8
---

## {$page.title}

To create a custom async appender, you can implement `Log.AsyncAppender` or extend `Log.DefaultAsyncAppender`.

```javascript
public class CustomAsyncAppender extends Log.DefaultAsyncAppender {
    public override void flush() {
        for(Log.Context ctx : this.contexts) {
            String message = ctx.message;
            // Custom code
        }
    }
}
```
