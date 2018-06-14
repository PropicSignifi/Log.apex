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
public class LogPackage extends Func.DefaultPackage {
    public override void init() {
        this.export('isTraceEnabled', new IsTraceEnabledFunc());
        this.export('trace', new TraceFunc());
        this.export('isDebugEnabled', new IsDebugEnabledFunc());
        this.export('debug', new DebugFunc());
        this.export('isInfoEnabled', new IsInfoEnabledFunc());
        this.export('info', new InfoFunc());
        this.export('isWarnEnabled', new IsWarnEnabledFunc());
        this.export('warn', new WarnFunc());
        this.export('isErrorEnabled', new IsErrorEnabledFunc());
        this.export('error', new ErrorFunc());
        this.export('flush', new FlushFunc());
    }

    private static Log getLogger(Object arg) {
        if(arg instanceof String) {
            return Log.getLogger((String)arg);
        }
        else if(arg instanceof Type) {
            return Log.getLogger((Type)arg);
        }
        else {
            return null;
        }
    }

    private class IsTraceEnabledFunc extends Func {
        public IsTraceEnabledFunc() {
            super(1);
        }

        public override Object exec(Object arg) {
            Log logger = getLogger(arg);
            return logger.isTraceEnabled();
        }
    }

    private class TraceFunc extends Func {
        public TraceFunc() {
            super(-1);
        }

        public override Object execN(List<Object> args) {
            Log logger = getLogger(args.get(0));
            String message = (String)args.get(1);
            List<Object> params = new List<Object>();
            for(Integer i = 2; i < args.size(); i++) {
                params.add(args.get(i));
            }

            logger.trace(message, params);

            return null;
        }
    }

    private class IsDebugEnabledFunc extends Func {
        public IsDebugEnabledFunc() {
            super(1);
        }

        public override Object exec(Object arg) {
            Log logger = getLogger(arg);
            return logger.isDebugEnabled();
        }
    }

    private class DebugFunc extends Func {
        public DebugFunc() {
            super(-1);
        }

        public override Object execN(List<Object> args) {
            Log logger = getLogger(args.get(0));
            String message = (String)args.get(1);
            List<Object> params = new List<Object>();
            for(Integer i = 2; i < args.size(); i++) {
                params.add(args.get(i));
            }

            logger.debug(message, params);

            return null;
        }
    }

    private class IsInfoEnabledFunc extends Func {
        public IsInfoEnabledFunc() {
            super(1);
        }

        public override Object exec(Object arg) {
            Log logger = getLogger(arg);
            return logger.isInfoEnabled();
        }
    }

    private class InfoFunc extends Func {
        public InfoFunc() {
            super(-1);
        }

        public override Object execN(List<Object> args) {
            Log logger = getLogger(args.get(0));
            String message = (String)args.get(1);
            List<Object> params = new List<Object>();
            for(Integer i = 2; i < args.size(); i++) {
                params.add(args.get(i));
            }

            logger.info(message, params);

            return null;
        }
    }

    private class IsWarnEnabledFunc extends Func {
        public IsWarnEnabledFunc() {
            super(1);
        }

        public override Object exec(Object arg) {
            Log logger = getLogger(arg);
            return logger.isWarnEnabled();
        }
    }

    private class WarnFunc extends Func {
        public WarnFunc() {
            super(-1);
        }

        public override Object execN(List<Object> args) {
            Log logger = getLogger(args.get(0));
            String message = (String)args.get(1);
            List<Object> params = new List<Object>();
            for(Integer i = 2; i < args.size(); i++) {
                params.add(args.get(i));
            }

            logger.warn(message, params);

            return null;
        }
    }

    private class IsErrorEnabledFunc extends Func {
        public IsErrorEnabledFunc() {
            super(1);
        }

        public override Object exec(Object arg) {
            Log logger = getLogger(arg);
            return logger.isErrorEnabled();
        }
    }

    private class ErrorFunc extends Func {
        public ErrorFunc() {
            super(-1);
        }

        public override Object execN(List<Object> args) {
            Log logger = getLogger(args.get(0));

            String message = null;
            Exception error = null;
            List<Object> params = new List<Object>();

            if(args.size() == 2) {
                error = (Exception)args.get(1);
            }
            else {
                message = (String)args.get(1);
                for(Integer i = 2; i < args.size() - 1; i++) {
                    params.add(args.get(i));
                }
                error = (Exception)args.get(args.size() - 1);
            }

            logger.error(message, params, error);

            return null;
        }
    }

    private class FlushFunc extends Func {
        public FlushFunc() {
            super(0);
        }

        public override Object exec() {
            Log.flush();

            return null;
        }
    }
}
