#!/usr/bin/env bash
# Script to automatically generate the art.html file
#
# Feel free to modify and use this for your own website!

# Top-part of the HTML file:
cat <<EOF
<!DOCTYPE html>
<html lang="ro">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>artă | negoitescu mario</title>
    <link rel="shortcut icon" href="./pics/favicon.ico" />
    <link href="./style.css" rel="stylesheet" type="text/css" media="all">
  </head>
  <body>
  <div class="menu">
	<p>artă |
	<a href="./">acasă</a>
	<a href="./#blog">blog</a>
 	<a href="./links.html">legături</a></p>
  </div>
  <div id="main">
	<h2>artă</h2>
EOF

# Start generating HTML list
cd pics/art

## Ilustrations
printf "\t%s\n" "<h2>ilustrații / illustrations</h2>"
printf "\t%s\n" "<div class=\"pic\">"
for f in il*; do
	printf "\t\t%s\n" "<img src=\"./pics/art/$f\">"
done
printf "\t%s\n" "</div>"

## Sketches
printf "\t%s\n" "<h2>schițe / sketches</h2>"
printf "\t%s\n" "<div class=\"pic\">"
for f in sk*; do
	printf "\t\t%s\n" "<img src=\"./pics/art/$f\">"
done
printf "\t%s\n" "</div>"

## Paintings
printf "\t%s\n" "<h2>picturi / paintings</h2>"
printf "\t%s\n" "<div class=\"pic\">"
for f in pt*; do
	printf "\t\t%s\n" "<img src=\"./pics/art/$f\">"
done
printf "\t%s\n" "</div>"

## Wood / Pyrography
printf "\t%s\n" "<h2>pirogravură / pyrography</h2>"
printf "\t%s\n" "<div class=\"pic\">"
for f in ww*; do
	printf "\t\t%s\n" "<img src=\"./pics/art/$f\">"
done
printf "\t%s\n" "</div>"

# Print end of file:
cat << EOF
    </div>
    </body>
</html>
EOF
