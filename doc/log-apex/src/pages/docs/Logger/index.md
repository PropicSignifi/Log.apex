---
title: "Logger"
description: "Logger"
layout: "guide"
icon: "flash"
weight: 1
---

###### {$page.description}

<article id="1">

## Loggers

Log.apex use logger objects to print logging information.

```javascript
private static final Log logger = Log.getLogger(MyClass.class);

logger.debug('Debug message');
```

</article>

<article id="2">

## Logger Creation

We have two ways to create loggers.

- Create By Class
We can pass in a class to create a logger.

```javascript
private static final Log logger = Log.getLogger(MyClass.class);
```

- Create By Name
We can pass in a name to create a logger.

```javascript
private static final Log logger = Log.getLogger('MyClass');
```

Methods are below:

| Method | Description |
| ------ | ----------- |
| Log getLogger(Type) | Get the logger from the type |
| Log getLogger(String) | Get the logger from the name |

</article>

<article id="3">

## Log Levels

We support these logging levels in Log.apex.

| Level | Description |
| ----- | ----------- |
| None | No log |
| Error | Error log |
| Warn | Warning log |
| Info | Info log |
| Debug | Debug log |
| Trace | Trace log |

</article>

<article id="4">

## Print Logs

We can print logs in the following ways:

- Simple message
We output a simple message using the logger.

```javascript
logger.debug('Debug message');
```

- Parameterized message
We show a parameterized message, with parameters passed in.

```javascript
logger.debug('Debug {0}', 'message');
```

Users should avoid concatenating strings in the logging method. Instead, use the parameterized
messages, as the actual interpolation of the message is only triggered when the logging is enabled.
So this will avoid unnecessary performance penalty.

- Controlled logging
We can even check if the logging is enabled before we do the logging.

```javascript
if(logger.isDebugEnabled()) {
    logger.debug('Debug {0}', getComplexResult());
}
```

This will help avoid complicated computation for the parameter values if the logging is actually disabled.

Available methods are below:

| Method | Description |
| ------ | ----------- |
| Boolean isTraceEnabled() | Check if Trace is enabled |
| void trace(String) | Print the Trace log |
| void trace(String, Object) | Print the Trace log with one parameter |
| void trace(String, Object, Object) | Print the Trace log with two parameters |
| void trace(String, Object, Object, Object) | Print the Trace log with three parameters |
| void trace(String, List&lt;Object&gt;) | Print the Trace log with parameters |
| Boolean isDebugEnabled() | Check if Debug is enabled |
| void debug(String) | Print the Debug log |
| void debug(String, Object) | Print the Debug log with one parameter |
| void debug(String, Object, Object) | Print the Debug log with two parameters |
| void debug(String, Object, Object, Object) | Print the Debug log with three parameters |
| void debug(String, List&lt;Object&gt;) | Print the Debug log with parameters |
| Boolean isInfoEnabled() | Check if Info is enabled |
| void info(String) | Print the Info log |
| void info(String, Object) | Print the Info log with one parameter |
| void info(String, Object, Object) | Print the Info log with two parameters |
| void info(String, Object, Object, Object) | Print the Info log with three parameters |
| void info(String, List&lt;Object&gt;) | Print the Info log with parameters |
| Boolean isWarnEnabled() | Check if Warn is enabled |
| void warn(String) | Print the Warn log |
| void warn(String, Object) | Print the Warn log with one parameter |
| void warn(String, Object, Object) | Print the Warn log with two parameters |
| void warn(String, Object, Object, Object) | Print the Warn log with three parameters |
| void warn(String, List&lt;Object&gt;) | Print the Warn log with parameters |
| Boolean isErrorEnabled() | Check if Error is enabled |
| void error(Exception) | Print the Error log |
| void error(String, Exception) | Print the Error log |
| void error(String, Object, Exception) | Print the Error log with one parameter |
| void error(String, Object, Object, Exception) | Print the Error log with two parameters |
| void error(String, Object, Object, Object, Exception) | Print the Error log with three parameters |
| void error(String, List&lt;Object&gt;, Exception) | Print the Error log with parameters |

</article>
