---
title: "Loggers"
description: "Loggers"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 2
---

## {$page.title}

We need to create an instance of logger before we start to do logging.

```javascript
private static final Log logger = Log.getLogger(MyClass.class);
```

You can pass in the current class to get the logger instance. Alternatively, you can pass in a unique string to get the logger.

```javascript
private static final Log logger = Log.getLogger('MyClass');
```
