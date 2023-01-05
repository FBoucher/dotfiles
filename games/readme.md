Ubuntu
------

(source: https://github.com/cmatsuoka/asciiquarium )

Out-of-the-box ubuntu doesn't satisfy the Requirements below, so
here's how to get them:
1) Get perl's curses package which is available from apt:
    sudo apt-get install libcurses-perl
2) Run
    cpan
    at the shell.  Agree to the defaults for everything.
    To leave cpan, type 
    quit
3) Type
sudo cpan Term::Animation