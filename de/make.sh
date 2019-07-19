PATH=$PATH:/Library/TeX/texbin:/usr/texbin:/usr/local/bin

pandoc lernOS-Guide-for-Organizations-de.md -o lernOS-Guide-for-Organizations-de.docx

pandoc -s --toc -o lernOS-Guide-for-Organizations-de.html lernOS-Guide-for-Organizations-de.md

pandoc lernOS-Guide-for-Organizations-de.md metadata/metadata.yaml -o lernOS-Guide-for-Organizations-de.pdf --template eisvogel

magick -density 300 lernOS-Guide-for-Organizations-de.pdf[0] images/ebook-cover.png
pandoc -s --epub-cover-image=images/ebook-cover.png -o lernOS-Guide-for-Organizations-de.epub lernOS-Guide-for-Organizations-de.md
