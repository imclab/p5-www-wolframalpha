package WWW::WolframAlpha::Sounds;

use 5.008008;
use strict;
use warnings;

require Exporter;

use WWW::WolframAlpha::Sound;

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
    @{$self->{'sound'}} = ();

    my ($count,$sound);

    if ($xmlo) {
	$count = $xmlo->{'count'} || undef;
	$sound = $xmlo->{'sound'} || undef;

	$self->{'count'} = $count if defined $count;

	if (defined $sound) {
	    foreach my $value (@{$sound}) {
		push(@{$self->{'sound'}}, WWW::WolframAlpha::Sound->new($value));
	    }
	}
    }


    return(bless($self, $class));
}

sub count {shift->{'count'};}
sub sound {shift->{'sound'};}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

WWW::WolframAlpha::Sounds - Perl object returned via $pod->sounds

=head1 SYNOPSIS

    if ($pod->sounds->count) {
      foreach my $sound (@{$pod->sounds->sound}) {
        ...
      }
    }

=head1 DESCRIPTION


=head2 ATTRIBUTES

$sounds->count


=head2 SECTOINS

$sounds->sound - array of L<WWW::WolframAlpha::Sound> elements


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
