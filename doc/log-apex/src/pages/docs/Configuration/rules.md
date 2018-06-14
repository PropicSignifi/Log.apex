---
title: "Configuration File"
description: "Configuration File"
layout: "guide"
icon: "code-file"
weight: 2
---

###### {$page.description}

<article id="1">

## Configuration

A configuration file is a JSON file that contains an array of configuration rules.

```JSON
[
    {
        ...
    },
    {
        ...
    }
]
```

</article>

<article id="2">

## Configuration Rule

A configuration rule specifies how the loggers should behave.

```JSON
{
    "patterns": [ "test" ],
    "level": "Debug",
    "appenders": [
        {
            "name": "Log.DefaultAppender"
        }
    ]
}
```

It has following fields.

| Field | Description |
| ----- | ----------- |
| patterns | An array of regular expressions to match the names of the loggers |
| level | The starting level to enable logging |
| appenders | An array of appender configurations |

</article>

<article id="3">

## Appender Configuration

An appender configuration is used to configure each appender, which outputs the logging information.

```JSON
{
    "name": "Log.DefaultAppender",
    "options": {
        "prefixPattern": "..."
    }
}
```

It has following fields.

| Field | Description |
| ----- | ----------- |
| name | The class name of the appender |
| options | The JSON object(map) to hold the option values |

</article>
