---
title: "Custom Async Appenders"
description: "Custom Async Appenders"
layout: "guide"
icon: "cloud"
weight: 6
---

###### {$page.description}

<article id="1">

## Custom Appender

You can create a custom async appender in two ways:

- Implement `Log.AsyncAppender`
Example:

```javascript
public class CustomAsyncAppender implements Log.AsyncAppender {
    private Map<String, Object> options;
    private List<Log.Context> contexts = new List<Log.Context>();

    public void setOptions(Map<String, Object> options) {
        this.options = options;
    }

    public void append(Context ctx) {
        this.contexts.add(ctx);
    }

    public void flush() {
        // Custom code
    }
}
```

- Extend `Log.DefaultAsyncAppender`
Example:

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

</article>
