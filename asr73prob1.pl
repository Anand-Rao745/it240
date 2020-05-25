my $filename='/etc/passwd';
open my $fh, '<', $filename;
chomp(my @lines=<$fh>);
my @matches=eval{
grep /\/bin\/bash/, @lines;
};
my %hash;
my $UID;
my $Account;
foreach(@matches){
if($_ =~ /:(\d+):/){
$UID=$1;
if($_ =~ /(\w+):/){
$Account=$1;
}
$hash{$UID}=$Account;
}
}
print "The following accounts are using bash as their shell:\n";
printf "UID %5s Account\n";
while(($uid, $account) = each (%hash)){
printf "$uid %5s $account\n";
}
