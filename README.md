# Log.apex
Log.apex is a library to provide easy-to-use logging functionality to your app.

## Why Log.apex?
Log.apex gives you fine control over logging behaviors. You can switch on/off specific logging, apply sync/async logging and even provide your custom logging implementation.

## Getting Started

### Loggers
We need to create an instance of logger before we start to do logging.

```java
private static final Log logger = Log.getLogger(MyClass.class);
```

You can pass in the current class to get the logger instance. Alternatively, you can pass in a unique string to get the logger.

```java
private static final Log logger = Log.getLogger('MyClass');
```

### Log Information
Log.apex supports these log levels:

- Error
- Warn
- Info
- Debug
- Trace

You can use any of these logging levels to print the log information.

```java
logger.debug('Debug message');
```

Or you can pass in parameters:

```java
logger.debug('Debug {0}', 'message');
```

Or you can check it for performance's sake.

```java
if(logger.isDebugEnabled()) {
    logger.debug('Debug {0}', 'message');
}
```

However, with logging level Error, you need to provide the exception.

```java
try {
    // ...
}
catch(Exception ex) {
    logger.error('some error', ex);
}
```

### Configuration
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

```java
private static final Log logger = Log.getLogger('test');
```

And you can get output similar to this:

```
11:18:39.50 (103576326)|USER_DEBUG|[984]|DEBUG|AnonymousBlock.(unknown method) Line 2 Column 1 - debug message
```

Patterns here support regular expressions, and you can set multiple patterns as well.

And the config will enable the 'test' logger to print any information with level no less than 'Debug'(Debug, Info, Warn, Error). Besides, it specifies the appender, which is used to append the log information to somewhere. Here we used the default appender, which uses `System.debug` as the logging output.

`Log.DefaultAppender` is the name of the appender class. If you want to use your custom appender, please set the appender name here.

You can also load configuration files with other names.

```java
Log.configureFromFile('otherLogging');
```

Just make sure to put this code before you create any loggers.

### Logging Appender
Logging appenders are used to process the log information. For example, the default appender sends the log to `System.debug`.

The default appender supports a prefix pattern, which can customize the prefix of the message.

```JSON
[
    {
        "patterns": [ "test" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "Log.DefaultAppender",
                "options": {
                    "prefixPattern": "%t - %m - %l - %c - "
                }
            }
        ]
    }
]
```

And your logger debugs some messages.

```java
logger.debug('message');
```

The output will be like 'CurrentClassName - CurrentMethodName - CurrentLineNumber - CurrentColumnNumber - message'.

### Custom Appender
You can create your own appenders. All appenders should implement the interface `Log.Appender`. To make things simple, most of the time you can directly extend `Log.DefaultAppender` to create a custom appender.

```java
public class CustomAppender extends Log.DefaultAppender {
    public override void append(Log.Context ctx) {
        String message = ctx.message;
        String pattern = (String)this.options.get('pattern');
        // Custom code
    }
}
```

Then you can add it to the configuration file.

```JSON
[
    {
        "patterns": [ ".*" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "CustomAppender",
                "options": {
                    "pattern": "YOUR PATTERN"
                }
            }
        ]
    }
]
```

You can set options to your custom appender like this.

### Async Logging
Sometimes when you have database operations in your appender, this will have impact on the performance of your normal code. In this case, we need to use async logging, which moves the logging execution into a queueable job and thus will not affect the current code.

To enable async logging, we need to use async appenders. Here is how we use the default async appender.

```JSON
[
    {
        "patterns": [ "testAsync" ],
        "level": "Debug",
        "appenders": [
            {
                "name": "Log.DefaultAsyncAppender"
            }
        ]
    }
]
```

We use the system default asyn appender configured in this way.

The note is that at the end of our execution context, we need to explicitly **flush** our log information, otherwise they will get discarded.

```java
logger.debug('message');

// ...

Log.flush();
```

### Custom Async Appender
To create a custom async appender, you can implement `Log.AsyncAppender` or extend `Log.DefaultAsyncAppender`.

```java
public class CustomAsyncAppender extends Log.DefaultAsyncAppender {
    public override void flush() {
        for(Log.Context ctx : this.contexts) {
            String message = ctx.message;
            // Custom code
        }
    }
}
```
