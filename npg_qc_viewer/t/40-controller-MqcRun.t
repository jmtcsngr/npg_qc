use strict;
use warnings;
use Test::More tests => 14;
use Test::Exception;
use Cwd;
use File::Spec;
use JSON;

use t::util;

my $util = t::util->new();
local $ENV{CATALYST_CONFIG} = $util->config_path;

my $schema;
my $test;
my $test_id_run = 3500;

use_ok 'Catalyst::Test', 'npg_qc_viewer';
use_ok 'npg_qc_viewer::Controller::MqcRun';
lives_ok { $schema = $util->test_env_setup()} 'test db created and populated';

{ #Testing POST
  my $response;
  lives_ok { $response = request(HTTP::Request->new('POST', '/mqc/mqc_runs' )) }
    'has a reponse for POST request';
  ok($response->is_error, q[update response is error for POST]);
  is( $response->code, 405, 'error code is 405' );
}

{ #Testing PUT
  my $response;
  lives_ok { $response = request(HTTP::Request->new('PUT', '/mqc/mqc_runs' )) }
    'has a reponse for PUT request';
  ok($response->is_error, q[update response is error for PUT]);
  is( $response->code, 405, 'error code is 405' );
}

{ #Testing GET without credentials
  my $response;
  lives_ok { $response = request(HTTP::Request->new('GET', '/mqc/mqc_runs/5500' )) }
    'has a response for GET request';
  ok($response->is_error, q[get response is error without credentials]);
  is( $response->code, 401, 'error code is 401' );
}

{
  #Testing GET with credentials
  my $response;
  lives_ok { $response = request(HTTP::Request->new('GET', '/mqc/mqc_runs/5500?user=cat&password=secret' )) }
    'has a response for GET request when passing credentials';
}

{
  #Testing GET with credentials and checking for data returned
  my $response;
  lives_ok { $response = request(HTTP::Request->new('GET', '/mqc/mqc_runs/3500?user=cat&password=secret' )) }
    'has a response for GET request when passing credentials';
  my $response_parse = from_json($response->content, {utf8 => 1});
  use Data::Dumper;
  print(Dumper($response_parse));
}

1;