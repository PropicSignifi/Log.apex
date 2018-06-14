---
title: "Async Logging"
description: "Async Logging"
layout: "guide"
icon: "cloud"
weight: 4
---

###### {$page.description}

<article id="1">

## Async Logging

Log.apex implements async logging by buffering all logging requests into a queue, and flush
the queue in a queueable job to finally complete the logging.

Therefore, a very important thing is that you are forced to call `flush` at the end of the execution context.
Otherwise, all the buffered logging requests are discarded.


```javascript
logger.debug('message');

// ...

Log.flush();
```

Usually you put `Log.flush()` at the end of remote action calls, visualforce page controller actions, web service actions and so on.

</article>
