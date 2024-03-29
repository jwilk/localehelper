#!/usr/bin/env perl

# Copyright © 2014-2019 Jakub Wilk <jwilk@jwilk.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the “Software”), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

no lib '.';

use strict;
use warnings;

use v5.10;

use Test::More;

use Perl::MinimumVersion ();

use FindBin ();

if (defined $ENV{LOCALEHELPER_TEST_TARGET}) {
    plan skip_all => '$LOCALEHELPER_TEST_TARGET is set';  ## no critic (RequireInterpolation)
}
plan tests => 1;

my $exe = "$FindBin::Bin/../localehelper";

my $mv = Perl::MinimumVersion->new($exe);
cmp_ok(
    $mv->minimum_explicit_version,
    'ge',
    $mv->minimum_syntax_version,
    'explicit version >= syntax version',
);

# vim:ts=4 sts=4 sw=4 et
