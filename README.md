# bibliophilly_randomizer
Web page and data to display random page images from BiblioPhilly manuscripts

View the working page at https://tinyurl.com/bibliophilly-randomizer

Process generate_data.xsl against BiblioPhilly TEI manuscript descriptions to create data/data.xml 

The javascript (in index.html) reads data.xml

Each time index.html is refreshed, a different image + caption is displayed. Images link to the manuscript browse page on OPenn.
