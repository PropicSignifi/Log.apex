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
@isTest
public class LogTest {
    private static Log.Context context;

    @isTest
    private static void jsonTest() {
        String jsonStr =
        '[                                                                     ' +
        '    {                                                                 ' +
        '        "patterns": [ "test" ],                                        ' +
        '        "level": "Debug",                                             ' +
        '        "appenders": [                                                ' +
        '             {                                                        ' +
        '                 "name": "Log.DefaultAppender"                        ' +
        '             }                                                        ' +
        '        ]                                                             ' +
        '    }                                                                 ' +
        ']                                                                     ';

        Log.configureFromJSON(jsonStr);

        System.assert(!Log.rules.isEmpty());
    }

    @isTest
    private static void levelTest() {
        Log.configure(new List<Log.Rule>{
            new Log.Rule(
                new List<String>{ '.*' },
                Log.LevelType.Trace,
                new List<Log.AppenderConfig>{
                    new Log.AppenderConfig(
                        'LogTest.TestAppender',
                        new Map<String, Object>{
                            'prefixPattern' => 'prefix-'
                        }
                    )
                }
            )
        });

        Log logger = Log.getLogger('test');

        if(logger.isDebugEnabled()) {
            logger.debug('{0}', 'debug');
        }
        System.assertEquals('debug', LogTest.context.message);

        if(logger.isTraceEnabled()) {
            logger.trace('{0}', 'trace');
        }
        System.assertEquals('trace', LogTest.context.message);

        if(logger.isInfoEnabled()) {
            logger.info('{0}', 'info');
        }
        System.assertEquals('info', LogTest.context.message);

        if(logger.isWarnEnabled()) {
            logger.warn('{0}', 'warn');
        }
        System.assertEquals('warn', LogTest.context.message);

        if(logger.isErrorEnabled()) {
            logger.error('{0}', 'error', null);
        }
        System.assertEquals('error', LogTest.context.message);
    }

    @isTest
    private static void asyncTest() {
        Log.configure(new List<Log.Rule>{
            new Log.Rule(
                new List<String>{ '.*' },
                Log.LevelType.Debug,
                new List<Log.AppenderConfig>{
                    new Log.AppenderConfig(
                        'LogTest.TestAsyncAppender',
                        new Map<String, Object>{
                            'prefixPattern' => 'prefix-'
                        }
                    )
                }
            )
        });

        Log logger = Log.getLogger('test');

        Test.startTest();
        logger.debug('{0}', 'debug');
        Log.flush();
        Test.stopTest();

        System.assertEquals('debug', LogTest.context.message);
    }

    public class TestAppender extends Log.DefaultAppender {
        public override void append(Context ctx) {
            super.append(ctx);

            LogTest.context = ctx;
        }
    }

    public class TestAsyncAppender extends Log.DefaultAsyncAppender {
        public override void flush() {
            super.flush();

            LogTest.context = this.contexts[0];
        }
    }
}
