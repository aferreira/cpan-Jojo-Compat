
package Jojo::Compat;

# ABSTRACT: Jojo::Base and Jojo::Role for pure Perl environments

use zim 'Module::Spec::V2' => 'try_module', 'need_module';

sub import {

    unless ( try_module('Jojo::Role~0.5.0') ) {
        need_module('Jojo::Role::Compat');
        *Jojo::Role:: = \*Jojo::Role::Compat::;
        $INC{'Jojo/Role.pm'} = $INC{'Jojo/Role/Compat.pm'};
    }

    unless ( try_module('Jojo::Base~0.7.0') ) {
        need_module('Jojo::Base::Compat');
        *Jojo::Base:: = \*Jojo::Base::Compat::;
        $INC{'Jojo/Base.pm'} = $INC{'Jojo/Base/Compat.pm'};
    }
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Jojo::Compat;    # before any code which uses Jojo::Base and/or Jojo::Role

=head1 DESCRIPTION

This is meant to help run code which uses L<Jojo::Base> and L<Jojo::Role>
on installations where L<Sub::Inject> is not available.
L<Sub::Inject> is the module responsible for the magic of lexical imports
and requires a C compiler to build. L<Jojo::Compat> provides an
alternative that uses clean imports via L<Importer::Zim> instead.

=head1 SEE ALSO

L<Jojo::Base>, L<Jojo::Role>.

=head1 ACKNOWLEDGEMENTS

The development of this library has been sponsored by Connectivity, Inc.

=cut
