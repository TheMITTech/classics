require 'English'
require 'date'
longfileName = $ARGV[0]

if longfileName != "index.html" 

webPage = File.read(longfileName)

webPage.gsub!(/Search for the following names in.*?online bookstores:/im, 'Search for the following names in the <a href="http://www.amazon.com/gp/redirect.html?ie=UTF8&location=http%3A%2F%2Fwww.amazon.com%2Fbooks-used-books-textbooks%2Fb%3F%255Fencoding%3DUTF8%26node%3D283155%26pf%5Frd%5Fm%3DATVPDKIKX0DER%26pf%5Frd%5Fs%3Dleft-nav-1%26pf%5Frd%5Fr%3D1K9REB5CBZW3ZB0XSB2Q%26pf%5Frd%5Ft%3D101%26pf%5Frd%5Fp%3D328655101%26pf%5Frd%5Fi%3D507846&tag=theinteclasar-20&linkCode=ur2&camp=1789&creative=9325">Amazon.com online bookstore</a><img src="http://www.assoc-amazon.com/e/ir?t=theinteclasar-20&amp;l=ur2&amp;o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />:')
webPage.gsub!(/Search for the following titles in.*?online bookstores:/im, 'Search for the following titles in the <a href="http://www.amazon.com/gp/redirect.html?ie=UTF8&location=http%3A%2F%2Fwww.amazon.com%2Fbooks-used-books-textbooks%2Fb%3F%255Fencoding%3DUTF8%26node%3D283155%26pf%5Frd%5Fm%3DATVPDKIKX0DER%26pf%5Frd%5Fs%3Dleft-nav-1%26pf%5Frd%5Fr%3D1K9REB5CBZW3ZB0XSB2Q%26pf%5Frd%5Ft%3D101%26pf%5Frd%5Fp%3D328655101%26pf%5Frd%5Fi%3D507846&tag=theinteclasar-20&linkCode=ur2&camp=1789&creative=9325">Amazon.com online bookstore</a><img src="http://www.assoc-amazon.com/e/ir?t=theinteclasar-20&amp;l=ur2&amp;o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />:')
webPage.gsub!(/<BR><BR>If you can.*book directories<\/A>./im, '<BR><BR>If you can\'t find a book in print, you may want to consult <a href="http://www.abebooks.com/">AbeBooks</a> or <a href="http://www.alibris.com/">Alibris</a>, two popular listers of used books.<br>')
webPage.gsub!(/<A HREF="http:\/\/barnesandnoble.bfast.com\/booklink.*?oble<\/A> \//im, '')
webPage.gsub!('Barnes and Noble may not carry some of the books.', '')
webPage.gsub!(' and CD-ROMs', '')

puts webPage
a = File.new(longfileName, "w")
a.write(webPage)
a.close

end