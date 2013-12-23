def clean_tmp
  Dir.glob("tmp/*").each {|f| FileUtils.rm_f(f) }
end

