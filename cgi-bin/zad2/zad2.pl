#!usr/bin/perl -w
use DBI;
use CGI;
use POSIX qw(strftime);
use SOAP::Transport::HTTP;

    SOAP::Transport::HTTP::CGI
        -> dispatch_to('Project')
        -> handle;

        package Project;
        sub list{
            my $db = DBI->connect("dbi:SQLite:dbname=zad2.db","","");
            my $sth = $db->prepare ("select name, value from product");
            $sth->execute();
            my @row;
            my $xml = "<?xml verion \"1.0\" ?><root>";
            while(@row = $sth->fetchrow_array() ){
                $xml .= "<product>";
                $xml .= "<name>".$row[0]."</name>";
                $xml .= "<value>".$row[1]."</value>";
                $xml .= "</product>";
                $xml .= "</root>";
            }
            return $xml;
        }