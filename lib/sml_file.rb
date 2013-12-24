require 'fileutils'

class SmlFile
  class NotCompiled < Exception; end
  class CannotCompile < Exception; end
  class NotSaved < Exception; end
  class InvalidFormatterInterface < Exception; end

  attr_reader :contents, :path

  def initialize(path, options={})
    @path = path
    @contents = options[:content] || File.read(@path)
    @formatters = options[:formatters] || []

    unless @formatters.all? { |f| f.respond_to?(:format) }
      raise InvalidFormatterInterface
    end
  end

  def save_as!(new_path)
    if File.write(new_path, @contents)
      @path = new_path
    end
  end

  def prepare_tests
    formatted_content = @formatters.inject(@contents) do |acc, formatter|
      formatter.format(acc)
    end

    self.class.new(nil, content: formatted_content, formatters: @formatters)
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
