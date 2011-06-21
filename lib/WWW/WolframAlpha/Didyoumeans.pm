package WWW::WolframAlpha::Didyoumeans;

use 5.008008;
use strict;
use warnings;

require Exporter;

use WWW::WolframAlpha::Didyoumean;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use WWW::WolframAlpha ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '1.0';

sub new {
    my $class = shift;
    my $xmlo = shift;

    my $self = {};

    $self->{'count'} = 0;
    @{$self->{'didyoumean'}} = ();

    my ($count,$didyoumean);

    if ($xmlo) {
	$count = $xmlo->{'count'} || undef;
	$didyoumean = $xmlo->{'didyoumean'} || undef;

	$self->{'count'} = $count if defined $count;

	if (defined $didyoumean) {
	    foreach my $value (@{$didyoumean}) {
		push(@{$self->{'didyoumean'}}, WWW::WolframAlpha::Didyoumean->new($value));
	    }
	}
    }


    return(bless($self, $class));
}

sub count {shift->{'count'};}
sub didyoumean {shift->{'didyoumean'};}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

WWW::WolframAlpha::Didyoumeans - Perl objects returned via $query->didyoumeans

=head1 SYNOPSIS

    if ($query->didyoumeans->count) {
        foreach my $didyoumean (@{$query->didyoumeans->didyoumean}) {
          ...
        }
    }



=head1 DESCRIPTION

=head2 ATTRIBUTES

$didyoumeans->count


=head2 SECTOINS

$didyoumeans->didyoumean - array of L<WWW::WolframAlpha::Didyoumean> objects


=head2 EXPORT

None by default.


=head1 SEE ALSO

L<WWW::WolframAlpha>

=head1 AUTHOR

Gabriel Weinberg, E<lt>yegg@alum.mit.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Gabriel Weinberg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
