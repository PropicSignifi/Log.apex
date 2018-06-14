---
title: "Log Information"
description: "Log Information"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 3
---

## {$page.title}

Log.apex supports these log levels:

- Error
- Warn
- Info
- Debug
- Trace

You can use any of these logging levels to print the log information.

```javascript
logger.debug('Debug message');
```

Or you can pass in parameters:

```javascript
logger.debug('Debug {0}', 'message');
```

Or you can check it for performance's sake.

```javascript
if(logger.isDebugEnabled()) {
    logger.debug('Debug {0}', 'message');
}
```

However, with logging level Error, you need to provide the exception.

```javascript
try {
    // ...
}
catch(Exception ex) {
    logger.error('some error', ex);
}
```
