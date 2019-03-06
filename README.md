# NAME

Mojolicious::Plugin::TextExceptions - Render exceptions as text in command line user agents

# SYNOPSIS

    use Mojolicious::Lite;

    # Only enable this plugin when running tests
    plugin 'TextExceptions' if $ENV{HARNESS_ACTIVE};

    # Only enable this plugin when developing
    plugin 'TextExceptions' if app->mode eq 'development';

    # Always enabling the plugin can leak sensitive information
    # to the end user
    plugin 'TextExceptions';

    plugin 'TextExceptions', ua_re => qr{^LWP}; # Override the default regex for user agent

# DESCRIPTION

This plugin looks for curl/wget/mojo user agent and renders exceptions as text instead of html.

# METHODS

## register

Sets up a before\_render hook to look for text based user agents and render exceptions as text.

Currently supports Mojo::UserAgent, curl and wget

# SEE ALSO

[Mojolicious](https://metacpan.org/pod/Mojolicious)

# COPYRIGHT AND LICENSE

Copyright (C) 2019, Marcus Ramberg

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

# AUTHOR

Marcus Ramberg <mramberg@cpan.org>

# CONTRIBUTORS

Jan Henning Thorsen <jhthorsen@cpan.org>
