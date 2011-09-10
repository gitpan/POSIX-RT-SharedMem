use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'POSIX::RT::SharedMem',
	  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.028',
    'Test::Exception' => '0',
    'Test::More' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.028'
  },
  'requires' => {
    'Carp' => '0',
    'Const::Fast' => '0',
    'Exporter' => '5.57',
    'Fcntl' => '0',
    'File::Map' => '0',
    'XSLoader' => '0',
    'perl' => '5.008',
    'strict' => '0',
    'warnings' => '0'
  },
	
);

if ($^O eq 'solaris' or $^O eq 'linux') {
	$builder->extra_linker_flags('-lrt');
}

$builder->create_build_script();
