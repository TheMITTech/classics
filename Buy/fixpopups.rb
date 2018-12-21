require 'English'
require 'date'
longfileName = $ARGV[0]

webPage = File.read(longfileName)
webPage.gsub!('onClick="openPopup(); return true;"', '')
a = File.new(longfileName, "w")
a.write(webPage)
a.close
