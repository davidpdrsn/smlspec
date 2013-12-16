class FormatsLines
  attr_reader :lines

  def self.format(lines)
    new(lines).tap do |f|
      f.remove_comments!
      f.remove_leading_whitespace!
      f.join_broken_lines!
    end.lines
  end

  def initialize(lines)
    @lines = lines
  end

  def remove_comments!
    @lines.gsub!(/\(\*.*?\*\)\n/m, "")
    self
  end

  def remove_leading_whitespace!
    @lines.gsub!(/^\s+/, "")
    self
  end

  def join_broken_lines!
    lines = @lines.split("\n")

    each_in_reverse!(lines) do |i|
      join_lines!(lines, i, i-1) if broken_line(lines[i])
    end

    @lines = lines.join("\n")
    self
  end

  private

  def broken_line(line)
    not(line =~ (/^(fun|val|local|in|end)/))
  end

  def join_lines!(lines, from, to)
    lines[to] = lines[to] + " " + lines.delete_at(from)
  end

  def each_in_reverse!(array, &block)
    (0..array.length-1).to_a.reverse.each do |i|
      block.call(i)
    end
  end
end
