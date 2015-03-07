# THIS IS A SANDBOX FILE

require 'pdf-reader'

book = PDF::Reader.new("A Christmas Carol.pdf")
# p book.pages
puts book.inspect
page3 = book.page(3)

puts page3.methods
page3 = page3.to_s
a = page3.split(".")
p a[1]

book_information = book.info
puts book_information[:Title]

#= File.new("page3.txt", "w")

# puts page3.objects.id



# require 'rubygems'
# # require 'pdf/reader'
# book = ""
# #filename = File.expand_path(File.dirname(__FILE__)) + "A Christmas Carol.pdf"

# PDF::Reader.open("A Christmas Carol.pdf") do |reader|
#   reader.pages.each do |page|
#     book << page.text
#   end
# end

# p book.class


# [^.|!|?]+