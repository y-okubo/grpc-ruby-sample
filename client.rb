this_dir = File.expand_path(__dir__)
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'sample_services_pb'

def auth
  stub = Sample::Greeter::Stub.new('0.0.0.0:7831', :this_channel_is_insecure)
  resp = stub.hello(Sample::HelloRequest.new(name: 'sample'))
  p "Greet: #{resp.greet}"
end

auth
