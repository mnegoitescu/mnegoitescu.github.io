#!/usr/bin/env bash
# Quick and dirty way to update the blog/ folder and index.html

# Store all entries in a variable
bloglist=""
# Updated
updated=$(date +"%d %B %Y (%A)")

## Blog posts
# We use `sort -r` to put them in the correct chronolical order
for f in $(ls -1 ./posts/ | sort -r); do
    # Grab title, date, etc.
    title="$(echo $f | sed 's/.*_//')"
    # Replace the dashes ('-') with spaces
    titlu="$(echo $title | sed 's/-/ /g')"
    # Get the raw date (first part of filename, before `_`)
    titledate="$(echo $f | sed 's/_.*//' )"
    # Convert date to a prettier format
    postdate="$(date -d $titledate '+%d %B %Y')"
    # Grab contents of file
    continut="$(cat ./posts/$f)"

    # Add to bloglist
    bloglist="$bloglist<li><a href=\"./blog/$title\">${titlu%.*}</a><br/>$postdate</li>"

    # Write in blog/
    printf "%s\n" "Writing $title (date: $postdate)..."
    cat > ./blog/$title << EOF
<!DOCTYPE html>
<html lang="ro">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titlu%.*} | Negoițescu Mario</title>
    <link rel="shortcut icon" href="../pics/favicon.ico" />
    <link href="../style.css" rel="stylesheet" type="text/css" media="all">
  </head>
  <body>
  <div class="menu">
	<p>negoițescu mario | <a href="../#blog">acasă</a></p>
  </div>
  <div id="main">
  <h2>${titlu%.*}</h2>
  $continut
  </div>
</body>
</html>
EOF
done

# Start generating index
printf "\n%s\n\n" "Updating index.html..."

# Top-part of the HTML file:
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="ro">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>negoitescu mario</title>
    <link rel="shortcut icon" href="./pics/favicon.ico">
    <link href="./style.css" rel="stylesheet" type="text/css" media="all">
  </head>
  <body>
  <div class="menu">
	<p>negoitescu mario |
	<a href="#blog">blog</a>
 	<a href="./links.html">legături</a>
	<a href="./art.html">artă</a></p>
  </div>
  <div id="main">
  <img class="pic" src="./pics/hello.png">
  <p>Bine ați venit la saitul meu web! Aici puteți citi blogul meu, vedea desenele mele sau accesa alte proiecte personale.</p>
  <p>Welcome to my website! Here you can read my blog, look at my drawings, or browse some of my other personal projects.</p>
  <p>Bienvenue à mon site web ! Ici vous pouvez lire mon blog, regarder mes dessins, ou voir quelques-uns de mes projets.</p>

  <h2 class="center" id="blog">blog</h2>
  <ul>
  $bloglist
  </ul>

  <hr/>
  <p>Mă puteți contacta prin email la: <code>negoitescu [arond] tutamail [punct] com</code></p>
  <p><sup>Last updated: $updated &mdash; <a href="https://github.com/mnegoitescu">GitHub</a>.</sup></p>
  </div>
  </body>
</html>
EOF
