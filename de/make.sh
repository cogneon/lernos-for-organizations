PATH=$PATH:/Library/TeX/texbin:/usr/texbin:/usr/local/bin
PATH=$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS
f="lernOS-for-Organizations-Guide-de"

rm -f $f.docx $f.html $f.pdf $f.epub $f.mobi

pandoc $f.md metadata/metadata.yaml -o $f.docx

pandoc $f.md metadata/metadata.yaml -s --toc -o $f.html

pandoc $f.md metadata/metadata.yaml --template lernos -o $f.pdf

magick -density 300 $f.pdf[0] images/ebook-cover.jpg
mogrify -size 2500x2500 -resize 2500x2500 images/ebook-cover.jpg
mogrify -crop 1563x2500+102+0 images/ebook-cover.jpg
pandoc $f.md metadata/metadata.yaml -s --epub-cover-image=images/ebook-cover.jpg -o $f.epub
ebook-convert $f.epub $f.mobi
