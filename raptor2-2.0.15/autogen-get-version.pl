use File::Basename;
my $prog=basename $0;
die "$prog: USAGE PATH PROGRAM-NAME\n  e.g. $prog /usr/bin/foo-123 foo\n"
  unless @ARGV==2;

my($path,$name)=@ARGV;
exit 0 if !-f $path;
die "$prog: $path not found\n" if !-r $path;

my $mname=$name; $mname =~ s/^g(libtoolize)$/$1/;

my(@vnums);
for my $varg (qw(--version -version)) {
  my $cmd="$path $varg";
  open(PIPE, "$cmd 2>&1 |") || next;
  while(<PIPE>) {
    chomp;
    next if @vnums; # drain pipe if we got a vnums
    next unless /^$mname/i;
    my($v)=/(\S+)$/i; $v =~ s/-.*$//;
    @vnums=grep { defined $_ && !/^\s*$/} map { s/\D//g; $_; } split(/\./, $v);
  }
  close(PIPE);
  last if @vnums;
}

@vnums=(@vnums, 0, 0, 0)[0..2];
$vn=join('', map { sprintf('%02d', $_) } @vnums);
print "$vn\n";
exit 0;
