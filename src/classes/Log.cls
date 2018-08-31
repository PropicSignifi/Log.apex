/**
 * MIT License
 *
 * Copyright (c) 2018 Click to Cloud Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/
/**
 * The object used to do the logging
 *
 * Example:
 * Log logger = Log.getLogger(MyClass.class);
 *
 * logger.debug('Logging {0}', 'test message');
 * */
public class Log {
    // The name of this logger
    private String name;

    // Create a logger instance with a name
    private Log(String name) {
        this.name = name;
    }

    /**
     * Print trace information
     *
     * Example:
     * logger.trace('msg');
     *
     * @param message The message
     * */
    public void trace(String message) {
        this.trace(message, new List<Object>());
    }

    /**
     * Print trace information
     *
     * Example:
     * logger.trace('{0}', 'param1');
     *
     * @param message The message
     * @param param1 The first parameter
     * */
    public void trace(String message, Object param1) {
        this.trace(message, new List<Object>{ param1 });
    }

    /**
     * Print trace information
     *
     * Example:
     * logger.trace('{0}, {1}', 'param1', 'param2');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * */
    public void trace(String message, Object param1, Object param2) {
        this.trace(message, new List<Object>{ param1, param2 });
    }

    /**
     * Print trace information
     *
     * Example:
     * logger.trace('{0}, {1}, {2}', 'param1', 'param2', 'param3');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param param3 The third parameter
     * */
    public void trace(String message, Object param1, Object param2, Object param3) {
        this.trace(message, new List<Object>{ param1, param2, param3 });
    }

    /**
     * Check if trace is enabled
     *
     * Example:
     * if(logger.isTraceEnabled()) {
     *     logger.trace('msg');
     * }
     *
     * @return Boolean
     * */
    public Boolean isTraceEnabled() {
        return this.isEnabled(LevelType.Trace);
    }

    /**
     * Print trace information
     *
     * Example:
     * logger.trace('{0}, {1}, {2}', new List<Object>{ 'param1', 'param2', 'param3' });
     *
     * @param message The message
     * @param params The parameters
     * */
    public void trace(String message, List<Object> params) {
        this.log(LevelType.Trace, message, params, null);
    }

    /**
     * Check if debug is enabled
     *
     * Example:
     * if(logger.isDebugEnabled()) {
     *     logger.debug('msg');
     * }
     *
     * @return Boolean
     * */
    public Boolean isDebugEnabled() {
        return this.isEnabled(LevelType.Debug);
    }

    /**
     * Print debug information
     *
     * Example:
     * logger.debug('msg');
     *
     * @param message The message
     * */
    public void debug(String message) {
        this.debug(message, new List<Object>());
    }

    /**
     * Print debug information
     *
     * Example:
     * logger.debug('{0}', 'param1');
     *
     * @param message The message
     * @param param1 The first parameter
     * */
    public void debug(String message, Object param1) {
        this.debug(message, new List<Object>{ param1 });
    }

    /**
     * Print debug information
     *
     * Example:
     * logger.debug('{0}, {1}', 'param1', 'param2');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * */
    public void debug(String message, Object param1, Object param2) {
        this.debug(message, new List<Object>{ param1, param2 });
    }

    /**
     * Print debug information
     *
     * Example:
     * logger.debug('{0}, {1}, {2}', 'param1', 'param2', 'param3');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param param3 The third parameter
     * */
    public void debug(String message, Object param1, Object param2, Object param3) {
        this.debug(message, new List<Object>{ param1, param2, param3 });
    }

    /**
     * Print debug information
     *
     * Example:
     * logger.debug('{0}, {1}, {2}', new List<Object>{ 'param1', 'param2', 'param3' });
     *
     * @param message The message
     * @param params The parameters
     * */
    public void debug(String message, List<Object> params) {
        this.log(LevelType.Debug, message, params, null);
    }

    /**
     * Check if info is enabled
     *
     * Example:
     * if(logger.isInfoEnabled()) {
     *     logger.info('msg');
     * }
     *
     * @return Boolean
     * */
    public Boolean isInfoEnabled() {
        return this.isEnabled(LevelType.Info);
    }

    /**
     * Print info information
     *
     * Example:
     * logger.info('msg');
     *
     * @param message The message
     * */
    public void info(String message) {
        this.info(message, new List<Object>());
    }

    /**
     * Print info information
     *
     * Example:
     * logger.info('{0}', 'param1');
     *
     * @param message The message
     * @param param1 The first parameter
     * */
    public void info(String message, Object param1) {
        this.info(message, new List<Object>{ param1 });
    }

    /**
     * Print info information
     *
     * Example:
     * logger.info('{0}, {1}', 'param1', 'param2');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * */
    public void info(String message, Object param1, Object param2) {
        this.info(message, new List<Object>{ param1, param2 });
    }

    /**
     * Print info information
     *
     * Example:
     * logger.info('{0}, {1}, {2}', 'param1', 'param2', 'param3');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param param3 The third parameter
     * */
    public void info(String message, Object param1, Object param2, Object param3) {
        this.info(message, new List<Object>{ param1, param2, param3 });
    }

    /**
     * Print info information
     *
     * Example:
     * logger.info('{0}, {1}, {2}', new List<Object>{ 'param1', 'param2', 'param3' });
     *
     * @param message The message
     * @param params The parameters
     * */
    public void info(String message, List<Object> params) {
        this.log(LevelType.Info, message, params, null);
    }

    /**
     * Check if warn is enabled
     *
     * Example:
     * if(logger.isWarnEnabled()) {
     *     logger.warn('msg');
     * }
     *
     * @return Boolean
     * */
    public Boolean isWarnEnabled() {
        return this.isEnabled(LevelType.Warn);
    }

    /**
     * Print warn information
     *
     * Example:
     * logger.warn('msg');
     *
     * @param message The message
     * */
    public void warn(String message) {
        this.warn(message, new List<Object>());
    }

    /**
     * Print warn information
     *
     * Example:
     * logger.warn('{0}', 'param1');
     *
     * @param message The message
     * @param param1 The first parameter
     * */
    public void warn(String message, Object param1) {
        this.warn(message, new List<Object>{ param1 });
    }

    /**
     * Print warn information
     *
     * Example:
     * logger.warn('{0}, {1}', 'param1', 'param2');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * */
    public void warn(String message, Object param1, Object param2) {
        this.warn(message, new List<Object>{ param1, param2 });
    }

    /**
     * Print warn information
     *
     * Example:
     * logger.warn('{0}, {1}, {2}', 'param1', 'param2', 'param3');
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param param3 The third parameter
     * */
    public void warn(String message, Object param1, Object param2, Object param3) {
        this.warn(message, new List<Object>{ param1, param2, param3 });
    }

    /**
     * Print warn information
     *
     * Example:
     * logger.warn('{0}, {1}, {2}', new List<Object>{ 'param1', 'param2', 'param3' });
     *
     * @param message The message
     * @param params The parameters
     * */
    public void warn(String message, List<Object> params) {
        this.log(LevelType.Warn, message, params, null);
    }

    /**
     * Check if error is enabled
     *
     * Example:
     * if(logger.isErrorEnabled()) {
     *     logger.error('msg');
     * }
     *
     * @return Boolean
     * */
    public Boolean isErrorEnabled() {
        return this.isEnabled(LevelType.Error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error(new DmlException());
     *
     * @param error The exception
     * */
    public void error(Exception error) {
        this.error(null, new List<Object>(), error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error('message', new DmlException());
     *
     * @param message The message
     * @param error The exception
     * */
    public void error(String message, Exception error) {
        this.error(message, new List<Object>(), error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error('{0}', 'param1', new DmlException());
     *
     * @param message The message
     * @param param1 The first parameter
     * @param error The exception
     * */
    public void error(String message, Object param1, Exception error) {
        this.error(message, new List<Object>{ param1 }, error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error('{0} {1}', 'param1', 'param2', new DmlException());
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param error The exception
     * */
    public void error(String message, Object param1, Object param2, Exception error) {
        this.error(message, new List<Object>{ param1, param2 }, error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error('{0} {1} {2}', 'param1', 'param2', 'param3', new DmlException());
     *
     * @param message The message
     * @param param1 The first parameter
     * @param param2 The second parameter
     * @param param3 The third parameter
     * @param error The exception
     * */
    public void error(String message, Object param1, Object param2, Object param3, Exception error) {
        this.error(message, new List<Object>{ param1, param2, param3 }, error);
    }

    /**
     * Print error information
     *
     * Example:
     * logger.error('{0} {1} {2}', new List<Object>{ 'param1', 'param2', 'param3' }, new DmlException());
     *
     * @param message The message
     * @param params The parameters
     * @param error The exception
     * */
    public void error(String message, List<Object> params, Exception error) {
        this.log(LevelType.Error, message, params, error);
    }

    private Boolean isEnabled(LevelType level) {
        List<Appender> appenders = Log.findAppenders(this.name, level);
        return !appenders.isEmpty();
    }

    private void log(LevelType level, String message, List<Object> params,  Exception error) {
        if(params == null) {
            params = new List<Object>();
        }

        List<Appender> appenders = Log.findAppenders(this.name, level);

        if(!appenders.isEmpty()) {
            List<String> values = new List<String>();
            for(Object param : params) {
                values.add(String.valueOf(param));
            }

            if(message != null) {
                message = String.format(message, values);
            }

            Context ctx = this.createContext();
            ctx.level = level;
            ctx.message = message;
            ctx.error = error;

            for(Appender appender : appenders) {
                appender.append(ctx);

                if(appender instanceof AsyncAppender) {
                    Log.asyncAppenders.add((AsyncAppender)appender);
                }
            }
        }
    }

    private Context createContext() {
        String stackTraceString = new DmlException().getStackTraceString();
        stackTraceString = stackTraceString.substringAfter('\n');
        stackTraceString = stackTraceString.substringAfter('\n');
        stackTraceString = stackTraceString.substringAfter('\n');
        stackTraceString = stackTraceString.substringAfter('\n');
        stackTraceString = stackTraceString.substringBefore('\n');

        Matcher m = Log.STACKTRACE_PATTERN.matcher(stackTraceString);

        Context ctx = new Context();
        if(m.find()) {
            if(String.isBlank(m.group(3))) {
                ctx.className = m.group(1);
                ctx.methodName = prettifyMethodName(m.group(2));
            } else {
                ctx.className = m.group(1) + '.' + m.group(2);
                ctx.methodName = prettifyMethodName(m.group(3));
            }
            ctx.line = Integer.valueOf(m.group(4));
            ctx.column = Integer.valueOf(m.group(5));
        }
        else {
            ctx.className = 'Unknown';
            ctx.methodName = 'Unknown';
            ctx.line = 0;
            ctx.column = 0;
        }

        return ctx;
    }

    @TestVisible
    private static final List<Rule> rules = new List<Rule>();
    private static final Map<LevelType, Integer> levelWeights = new Map<LevelType, Integer>{
        LevelType.Error => 5,
        LevelType.Warn => 4,
        LevelType.Info => 3,
        LevelType.Debug => 2,
        LevelType.Trace => 1,
        LevelType.None => 0
    };
    private static final Map<AppenderConfig, Appender> appenders = new Map<AppenderConfig, Appender>();
    private static final Map<String, Log> loggers = new Map<String, Log>();
    private static final Set<AsyncAppender> asyncAppenders = new Set<AsyncAppender>();
    private static final Pattern STACKTRACE_PATTERN = Pattern.compile('(?i)^(?:class\\.)?([^.]+)\\.?([^\\.\\:]+)?[\\.\\:]?([^\\.\\:]*): line (\\d+), column (\\d+)$');

    static {
        Log.configureDefault();
    }

    /**
     * Configure Log with the rules
     *
     * Example:
     * Log.configure(new List<Log.Rule>{
     *     new Log.Rule(
     *         new List<String>{ '.*' },
     *         Log.LevelType.Debug,
     *         new List<Log.AppenderConfig>{
     *             new Log.AppenderConfig(
     *                 'LogTest.TestAsyncAppender',
     *                 new Map<String, Object>{
     *                     'prefixPattern' => 'prefix-'
     *                 }
     *             )
     *         }
     *     )
     * });
     *
     * @param rules The logging rules
     * */
    public static void configure(List<Rule> rules) {
        if(rules != null && !rules.isEmpty()) {
            Log.rules.clear();
            Log.rules.addAll(rules);
        }
    }

    /**
     * Configure Log from JSON string
     *
     * Example:
     * Log.configureFromJSON('...');
     *
     * @param jsonStr The JSON string
     * */
    public static void configureFromJSON(String jsonStr) {
        List<Rule> rules = (List<Rule>)JSON.deserialize(jsonStr, List<Rule>.class);

        Log.configure(rules);
    }

    /**
     * Configure Log from the file
     * The file is actually the name of the static resource containing only one file, not a zipped one
     *
     * Example:
     * Log.configureFromFile('customLogging');
     *
     * @param filename The name of the static resource
     * */
    public static void configureFromFile(String filename) {
        if(!String.isBlank(filename)) {
            List<StaticResource> srList = [ SELECT Id, Body FROM StaticResource WHERE Name = :filename LIMIT 1 ];
            if(!srList.isEmpty()) {
                String body = srList[0].Body.toString();
                Log.configureFromJSON(body);
            }
        }
    }

    /**
     * Configure by loading the default file 'logging'
     *
     * Example:
     * Log.configureDefault();
     *
     * */
    public static void configureDefault() {
        Log.configureFromFile('logging');
    }

    /**
     * Get the logger instance by the target class
     *
     * Example:
     * Log logger = Log.getLogger(MyClass.class);
     *
     * @param targetType The target class
     * @return Log
     * */
    public static Log getLogger(Type targetType) {
        return Log.getLogger(targetType.getName());
    }

    /**
     * Get the logger instance by the name
     *
     * Example:
     * Log logger = Log.getLogger('test');
     *
     * @param name The name of the logger
     * @return Log
     * */
    public static Log getLogger(String name) {
        if(!Log.loggers.containsKey(name)) {
            Log logger = new Log(name);
            Log.loggers.put(name, logger);
        }

        return Log.loggers.get(name);
    }

    /**
     * Flush all the async logging information
     *
     * Example:
     * Log.flush();
     *
     * */
    public static void flush() {
        if(!Log.asyncAppenders.isEmpty()) {
            AsyncWorker worker = new AsyncWorker(Log.asyncAppenders);
            System.enqueueJob(worker);
        }

        Log.asyncAppenders.clear();
    }

    private static Appender getAppender(AppenderConfig config) {
        if(!Log.appenders.containsKey(config)) {
            Type appenderType = Type.forName(config.name);
            if(appenderType == null) {
                throw new LogException('Cannot find type ' + config.name);
            }
            Appender appender = (Appender)appenderType.newInstance();
            appender.setOptions(config.options);
            Log.appenders.put(config, appender);
        }

        return Log.appenders.get(config);
    }

    private static List<Appender> findAppenders(String logger, LevelType level) {
        Set<AppenderConfig> configs = new Set<AppenderConfig>();

        for(Rule r : Log.rules) {
            if(r.matches(logger, level)) {
                configs.addAll(r.appenders);
            }
        }

        List<Appender> appenders = new List<Appender>();
        for(AppenderConfig config : configs) {
            Appender appender = Log.getAppender(config);
            appenders.add(appender);
        }

        return appenders;
    }

    private static String prettifyMethodName(String name) {
		return (name == null) ? '(unknown method)' :
		       name.replace('<init>', '(constructor) ').replace('__sfdc_', '(getter/setter) ');
	}

    /**
     * The available logging level
     * */
    public enum LevelType {
        Error,
        Warn,
        Info,
        Debug,
        Trace,
        None
    }

    /**
     * The logging rule
     * */
    public class Rule {
        /**
         * The patterns of the rule, consisting of regular expressions to match the logger names
         * */
        public List<String> patterns = new List<String>();

        /**
         * The logging level
         * */
        public LevelType level;

        /**
         * All associated logging appenders
         * */
        public List<AppenderConfig> appenders = new List<AppenderConfig>();

        /**
         * Create a logging rule with the data
         *
         * @param patterns The logger name patterns
         * @param level The logging level
         * @param appenders The logging appenders
         * */
        public Rule(List<String> patterns, LevelType level, List<AppenderConfig> appenders) {
            this.patterns = patterns;
            this.level = level;
            this.appenders = appenders;
        }

        Boolean matches(String logger, LevelType level) {
            Boolean pass = false;

            for(String ptn : this.patterns) {
                if(Pattern.matches(ptn, logger)) {
                    pass = true;
                    break;
                }
            }

            if(!pass) {
                return false;
            }

            if(this.level == LevelType.None) {
                return false;
            }

            return Log.levelWeights.get(this.level) <= Log.levelWeights.get(level);
        }
    }

    /**
     * The logging appender config, used to create logging appenders
     * */
    public class AppenderConfig {
        /**
         * The class name of the appender
         * */
        public String name;

        /**
         * The options of the appender
         * */
        public Map<String, Object> options = new Map<String, Object>();

        /**
         * Create an instance of appender config
         *
         * @param name The class name of the appender
         * @param options The options of the appender
         * */
        public AppenderConfig(String name, Map<String, Object> options) {
            this.name = name;
            if(options != null) {
                this.options = options;
            }
        }

        /**
         * Create an instance of appender config from appender class name
         *
         * @param name The class name of the appender
         * */
        public AppenderConfig(String name) {
            this(name, null);
        }

        public Boolean equals(Object other) {
            if(other instanceof AppenderConfig) {
                AppenderConfig otherConfig = (AppenderConfig)other;

                return otherConfig.name == this.name &&
                    otherConfig.options == this.options;
            }

            return false;
        }

        public Integer hashCode() {
            Integer ret = 0;

            if(this.name != null) {
                ret += this.name.hashCode();
            }

            if(this.options != null) {
                ret += this.options.hashCode();
            }

            return ret;
        }
    }

    /**
     * The logging context
     * */
    public class Context {
        /**
         * The name of the logger
         * */
        public String logger;

        /**
         * The name of the class, where the logging method is called
         * */
        public String className;

        /**
         * The name of the method, where the logging method is called
         * */
        public String methodName;

        /**
         * The line number where the logging method is called
         * */
        public Integer line;

        /**
         * The column number where the logging method is called
         * */
        public Integer column;

        /**
         * The logging level
         * */
        public LevelType level;

        /**
         * The logging message
         * */
        public String message;

        /**
         * The logging exception
         * */
        public Exception error;
    }

    /**
     * Used to process async logging
     * */
    public class AsyncWorker implements Queueable, Database.AllowsCallouts {
        private Set<AsyncAppender> appenders = new Set<AsyncAppender>();

        public AsyncWorker(Set<AsyncAppender> appenders) {
            this.appenders = new Set<AsyncAppender>(appenders);
        }

        public void execute(QueueableContext context) {
            for(AsyncAppender appender : this.appenders) {
                appender.flush();
            }
        }
    }

    /**
     * Implement this interface to provide a custom synchronous logging appender
     * */
    public interface Appender {
        /**
         * Accept the options of the appender
         *
         * @param options The appender options
         * */
        void setOptions(Map<String, Object> options);

        /**
         * Append the context
         *
         * @param ctx The logging context
         * */
        void append(Context ctx);
    }

    /**
     * Implement this interface to provide a custom asynchronous logging appender
     *
     * 'append' methods for AsyncAppenders should be used to collect contexts and a batch operation
     * will be carried out in the 'flush' method
     * */
    public interface AsyncAppender extends Appender {
        /**
         * Flush all the async logging information
         * */
        void flush();
    }

    /**
     * Extend this class to reuse the default system debug feature
     *
     * Example:
     * public class CustomAppender extends Log.DefaultAppender {
     *     public override void append(Log.Context ctx) {
     *         super.append(ctx);
     *         // custom code
     *     }
     * }
     *
     * */
    public virtual class DefaultAppender implements Appender {
        protected Map<String, Object> options;

        public virtual void setOptions(Map<String, Object> options) {
            this.options = options;
        }

        public virtual void append(Context ctx) {
            String prefixPattern = this.getPrefixPattern();
            String prefix = this.getPrefix(ctx, prefixPattern);

            this.output(ctx.level, prefix + ctx.message, ctx.error);
        }

        private String getPrefix(Context ctx, String prefixPattern) {
            String prefix = prefixPattern;
            prefix = prefix.replaceAll('%t', ctx.className);
            prefix = prefix.replaceAll('%m', ctx.methodName);
            prefix = prefix.replaceAll('%l', String.valueOf(ctx.line));
            prefix = prefix.replaceAll('%c', String.valueOf(ctx.column));

            return prefix;
        }

        private String getPrefixPattern() {
            if(this.options != null && this.options.containsKey('prefixPattern')) {
                return String.valueOf(this.options.get('prefixPattern'));
            }

            return '%t.%m Line %l Column %c - ';
        }

        private void output(LevelType level, String line, Exception e) {
            if(level == LevelType.Error) {
                if(line != null) {
                    System.debug(LoggingLevel.Error, line);
                }

                if(e != null) {
                    System.debug(LoggingLevel.Error, e);
                }
            }
            else if(level == LevelType.Warn) {
                System.debug(LoggingLevel.Warn, line);
            }
            else if(level == LevelType.Info) {
                System.debug(LoggingLevel.Info, line);
            }
            else if(level == LevelType.Debug) {
                System.debug(LoggingLevel.Debug, line);
            }
            else if(level == LevelType.Trace) {
                System.debug(LoggingLevel.Fine, line);
            }
        }
    }

    /**
     * Extend this class to reuse the default system debug feature
     *
     * Example:
     * public class CustomAsyncAppender extends Log.DefaultAsyncAppender {
     *     public override void flush() {
     *         super.flush();
     *         List<Log.Context> contexts = this.contexts;
     *         // custom code
     *     }
     * }
     *
     * */
    public virtual class DefaultAsyncAppender extends DefaultAppender implements AsyncAppender {
        protected List<Context> contexts = new List<Context>();

        public virtual override void append(Context ctx) {
            this.contexts.add(ctx);
        }

        public virtual void flush() {
            for(Context ctx : this.contexts) {
                super.append(ctx);
            }
        }
    }

    public class LogException extends Exception {
    }
}
