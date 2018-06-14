---
title: "Configure Logging"
description: "Configure Logging"
layout: "guide"
icon: "code-file"
weight: 3
---

###### {$page.description}

<article id="1">

## Configure Logging

We can configure logging before we create any loggers like this:

```javascript
Log.configureFromFile('otherLogging');
```

Log.apex supports the following logging sources.

| Method | Description |
| ------ | ----------- |
| configureDefault() | Load the config from 'logging' static resource |
| configureFromFile(String) | Load the config from the static resource specified by the name |
| configureFromJSON(String) | Load the config from the JSON string |
| configure(List&lt;Log.Rule&gt;) | Load the config from the list of rules |

</article>
