require_relative "./output_collector"

module OutputCatcher
  module_function

  def catch_output
    coll = OutputCollector.new
    $stdout = coll
    yield
    $stdout = STDOUT
    unless coll.content.empty?
      return coll.content
    else
      return yield
    end
  end
end
