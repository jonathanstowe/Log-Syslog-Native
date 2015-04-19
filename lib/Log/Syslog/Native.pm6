use NativeCall;

class Log::Syslog::Native {
    enum LogLevel <Emergency Alert Critical Error Warning Notice Info Debug>;
    enum LogFacility (  :Kern( 0 +< 3),
                        :User( 1 +< 3),
                        :Mail( 2 +< 3),
                        :Daemon( 3 +< 3),
                        :Auth( 4 +< 3),
                        :Syslog( 5 +< 3),
                        :Lpr( 6 +< 3),
                        :News( 7 +< 3),
                        :Uucp( 8 +< 3),
                        :Cron( 9 +< 3),
                        :Authpriv( 10 +< 3),
                        :Ftp( 11 +< 3),
                        :Local0( 16 +< 3),
                        :Local1( 17 +< 3),
                        :Local2( 18 +< 3),
                        :Local3( 19 +< 3),
                        :Local4( 20 +< 3),
                        :Local5( 21 +< 3),
                        :Local6( 22 +< 3),
                        :Local7( 23 +< 3) );

    enum LogOptions (   :Pid(0x01), 
                        :Console(0x02), 
                        :ODelay(0x04), 
                        :NDelay(0x08),
                        :NoWait(0x10),
                        :Perror(0x20));

    has Str $.ident    = $*PROGRAM_NAME;
    has Int $.option   = Pid +| ODelay;
    has Int $.facility = Local0;

    sub _syslog(Int, Str) is native is symbol('syslog') { ... }
    sub _openlog(Str, Int, Int) is native is symbol('openlog') { ... }
    sub _closelog() is native is symbol('closelog') { ... }

    submethod BUILD(:$!ident, :$!option, :$!facility) {
        _openlog($!ident, $!option, $!facility);
    }

    method emergency(Str $format, *@args) {
        self.log(Emergency, $format, @args);
    }

    method alert(Str $format, *@args) {
        self.log(Alert, $format, @args);
    }
    
    method critical(Str $format, *@args) {
        self.log(Critical, $format, @args);
    }
    
    method error(Str $format, *@args) {
        self.log(Error, $format, @args);
    }
    
    method warnimg(Str $format, *@args) {
        self.log(Warning, $format, @args);
    }
    
    method notice(Str $format, *@args) {
        self.log(Notice, $format, @args);
    }

    method info(Str $format, *@args) {
        self.log(Info, $format, @args);
    }
    
    method debug(Str $format, *@args) {
        self.log(Info, $format, @args);
    }

    method log(LogLevel $priority, Str $format, *@args ) {
        my $mess = sprintf $format, @args;
        _syslog($priority.Int, $mess);

    }

    submethod DESTROY {
        _closelog();
    }
    
}
