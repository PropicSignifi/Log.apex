---
title: "Configuration"
description: "Configuration"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 4
---

## {$page.title}

We can configure the logging behavior by creating a static resource named 'logging', with the content to be a json file.

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

This will control the logger named 'test', created below.

```javascript
private static final Log logger = Log.getLogger('test');
```

Patterns here support regular expressions, and you can set multiple patterns as well.

And the config will enable the 'test' logger to print any information with level no less than 'Debug'(Debug, Info, Warn, Error). Besides, it specifies the appender, which is used to append the log information to somewhere. Here we used the default appender, which uses `System.debug` as the logging output.

`Log.DefaultAppender` is the name of the appender class. If you want to use your custom appender, please set the appender name here.

You can also load configuration files with other names.

```javascript
Log.configureFromFile('otherLogging');
```

Just make sure to put this code before you create any loggers.
