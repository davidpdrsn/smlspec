class FormatsTests
  def self.format(lines)
    lines = lines.split("\n")

    lines.each.with_index do |line, i|
      match = line.match(/val (.*?_test\d) = (.*?)$/)

      if match
        lines[i] = "val #{match[1]} = assert \"#{match[1]}\" (#{match[2]})"
      end
    end

    # TODO: make this a little nicer
    'fun assert desc condition = print(desc^" "^Bool.toString(condition)^"\n")' + "\n" + lines.join("\n")
  end
end
