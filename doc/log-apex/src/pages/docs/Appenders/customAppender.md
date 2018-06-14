---
title: "Custom Appenders"
description: "Custom Appenders"
layout: "guide"
icon: "cloud"
weight: 3
---

###### {$page.description}

<article id="1">

## Custom Appender

You can create a custom appender in two ways:

- Implement `Log.Appender`
Example:

```javascript
public class CustomAppender implements Log.Appender {
    private Map<String, Object> options;

    public void setOptions(Map<String, Object> options) {
        this.options = options;
    }

    public void append(Context ctx) {
        // Custom code
    }
}
```

- Extend `Log.DefaultAppender`
Example:

```javascript
public class CustomAppender extends Log.DefaultAppender {
    public override void append(Log.Context ctx) {
        String message = ctx.message;
        String pattern = (String)this.options.get('pattern');
        // Custom code
    }
}
```

</article>
