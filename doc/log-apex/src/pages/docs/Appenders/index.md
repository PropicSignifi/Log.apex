---
title: "Appenders"
description: "Appenders"
layout: "guide"
icon: "cloud"
weight: 4
---

###### {$page.description}

<article id="1">

## Logging Appenders

Logging appenders are used to append the logging information to somewhere. For example, `Log.DefaultAppender`
sends logs to `System.debug`.

We may apply different implementation in custom logging appenders, so that we can extend Log.apex.

Check default appenders and custom appenders for details.

</article>

<article id="2">

## Async Appenders

Log.apex supports async logging by the use of async appenders.

Differently from default appenders, async appenders will collect the logging information(Log.Context)
and process all in one batch during the flush.

Check the async appenders for details.

</article>
