=begin
如果你在翻译的过程中对英文原文也做了一些修改，
可以用这个脚本，把对英文原文的修改同步回 src 目录的相应文件中，
使用方法，比如要对 05 进行同步：
$ cd tool
$ ruby sync_modify.rb 05
=end
def sync_modify(translate_file)

  if translate_file.nil? || translate_file.empty?
    puts "file name is empty."
    return
  end

  trim_lines = []
  File.open("../translation/#{translate_file}", "r") do |file|
    file.each_line do |line|
      if line.strip.length > 0
        trim_lines.push(line)
      end
    end
  end

  File.open("../src/#{translate_file}", "w") do |file|
    lines = 0
    trim_lines.each do |line|
      if lines % 2 == 0
        # puts line
        # puts ""
        file.puts line
        file.puts ""
      end
      lines += 1
    end
  end

  puts "sync done! please use 'git diff' to check the changes."

end

sync_modify(ARGV[0])