$|=1;

sub f {
	return 1 if $_[0] == 1;
	return $m{$_[0]} if exists $m{$_[0]};
	$m{$_[0]} = 1+f($_[0] % 2 ? 3*$_[0] + 1 : $_[0]/2);
	return $m{$_[0]} 
}

$m = 0;

for (1..999999) {
	if (f($_) > $m) {
		$m = f($_);
		$n = $_;
		print "$m $n\n"
	}
}

print $m,$n,"\n";
