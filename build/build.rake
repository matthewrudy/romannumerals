require 'roman-numerals'
require 'erb'
require 'date'

namespace :build do
  desc "build all our posts"
  task :posts do
    date = Date.new(2014,10,13)

    template = File.read("./post.markdown.erb")

    1.upto(3999) do |n|
      roman = RomanNumerals.to_roman(n)

      erb = ERB.new(template)

      File.open("../_posts/#{(date+n-1).to_s}-#{n}-in-roman-numerals.markdown", "w") do |f|
        f.puts erb.result(binding)
      end
    end
  end
end
