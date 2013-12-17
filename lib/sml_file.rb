require 'formats_lines'
require 'formats_tests'

class SmlFile
  class NotCompiled < Exception; end
  class CannotCompile < Exception; end
  class NotSaved < Exception; end

  attr_reader :contents

  def initialize(path, contents=nil)
    @path = path
    @contents = contents || File.read(@path)
  end

  def save_as!(new_path)
    File.write(new_path, @contents)
  end

  def prepare_tests
    formatted_content = FormatsTests.format(FormatsLines.format(@contents))
    self.class.new(nil, formatted_content)
  end

  def compile!(destination)
    raise NotSaved unless @path

    @exe_path = destination

    output = `mosmlc #{@path} -o #{@exe_path}`

    unless output.empty?
      raise CannotCompile, output
    end
  end

  def run
    if @exe_path
      `./#{@exe_path}`
    else
      raise NotCompiled
    end
  end
end
