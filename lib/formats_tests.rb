class FormatsTests
  def self.format(lines)
    lines = lines.split("\n")

    lines.each.with_index do |line, i|
      match = line.match(/val (.*?_test\d) = (.*?)$/)
      if match
        lines[i] = "val #{match[1]} = test \"#{match[1]}\" (#{match[2]})"
      end
    end

    lines.join("\n")
  end
end
