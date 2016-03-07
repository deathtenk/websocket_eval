
class OutputCollector

  attr_reader :content

  def write x
    @content += x.to_s
  end

  def puts x
    write x.to_s + "\n"
  end

  def initialize
    @content = ''
  end

end
