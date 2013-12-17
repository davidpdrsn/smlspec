require 'fileutils'

class SmlFile
  class NotCompiled < Exception; end
  class CannotCompile < Exception; end
  class NotSaved < Exception; end

  attr_reader :contents, :path

  def initialize(path, contents=nil)
    @path = path
    @contents = contents || File.read(@path)
  end

  def save_as!(new_path)
    if File.write(new_path, @contents)
      @path = new_path
    end
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

  def delete!
    FileUtils.rm_f(@path)
    @path = nil
  end
end
