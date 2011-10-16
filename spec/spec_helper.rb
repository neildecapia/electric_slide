$:.push File.join(File.dirname(__FILE__), '..', 'lib')
Thread.abort_on_exception = true

%w{
  adhearsion
  adhearsion/component_manager/spec_framework
  ahn_queue
  ahn_queue/queued_call
  ahn_queue/queue_strategy
  ahn_queue/round_robin
  rspec/core
  flexmock
  flexmock/rspec
}.each { |r| require r }

RSpec.configure do |config|
  config.mock_framework = :flexmock
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color_enabled = true
end

def dummy_call
  Object.new
end

component_name = "ahn_queue"

AHN_QUEUE = ComponentTester.new(component_name, File.dirname(__FILE__) + "/../..", "/#{component_name}/lib/#{component_name}.rb")