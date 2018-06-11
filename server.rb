this_dir = File.expand_path(__dir__)
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'sample_services_pb'

# SampleServer defines sample service.
class SampleServer < Sample::Greeter::Service
  def hello(_req, _unused_call)
    Sample::HelloResponse.new(greet: "Hello #{_req.name}, OK.")
  end
end

# serve starts an RpcServer.
def serve
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:7831', :this_port_is_insecure)
  s.handle(SampleServer)
  s.run_till_terminated
end

serve
