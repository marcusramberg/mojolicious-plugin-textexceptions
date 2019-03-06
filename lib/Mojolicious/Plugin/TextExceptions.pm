package Mojolicious::Plugin::TextExceptions;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.1';

sub register {
  my ($self, $app, $config) = @_;

  $app->hook( before_render => sub {
      my ($c, $args) = @_;

      return unless my $template = $args->{template};
      return unless $template eq 'exception';

      if($c->req->headers->user_agent =~ /Mojolicious|curl|Wget/) {
        @$args{qw(text format)} = ($c->stash->{exception}, 'txt');
      }
  });
}

1;

=encoding utf8

=head1 NAME

Mojolicious::Plugin::TextExceptions - Render exceptions as text in command line user agents

=head1 SYNOPSIS

  plugin 'TextExceptions';

=head1 DESCRIPTION

This plugin looks for curl/wget/mojo user agent and renders exceptions as text instead of html.


=head1 METHODS

=head2 register

Sets up a before_render hook to look for text based user agents and render exceptions as text.


Currently supports Mojo::UserAgent, curl and wget

=head1 SEE ALSO

L<Mojolicious>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019, Marcus Ramberg

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 AUTHOR

Marcus Ramberg <mramberg@cpan.org>

=head1 cut

1;
=cut
