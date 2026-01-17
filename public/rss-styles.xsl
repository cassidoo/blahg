<?xml version="1.0" encoding="utf-8"?>
<!--

# Pretty Feed

Styles an RSS/Atom feed, making it friendly for humans viewers, and adds a link
to aboutfeeds.com for new user onboarding. See it in action:

	 https://interconnected.org/home/feed


## How to use

1. Download this XML stylesheet from the following URL and host it on your own
	 domain (this is a limitation of XSL in browsers):

	 https://github.com/genmon/aboutfeeds/blob/main/tools/pretty-feed-v3.xsl

2. Include the XSL at the top of the RSS/Atom feed, like:

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="/PATH-TO-YOUR-STYLES/pretty-feed-v3.xsl" type="text/xsl"?>
```

3. Serve the feed with the following HTTP headers:

```
Content-Type: application/xml; charset=utf-8  # not application/rss+xml
x-content-type-options: nosniff
```

(These headers are required to style feeds for users with Safari on iOS/Mac.)

## Limitations

- Styling the feed *prevents* the browser from automatically opening a
	newsreader application. This is a trade off, but it's a benefit to new users
	who won't have a newsreader installed, and they are saved from seeing or
	downloaded obscure XML content. For existing newsreader users, they will know
	to copy-and-paste the feed URL, and they get the benefit of an in-browser feed
	preview.
- Feed styling, for all browsers, is only available to site owners who control
	their own platform. The need to add both XML and HTTP headers makes this a
	limited solution.


## Credits

pretty-feed is based on work by lepture.com:

	 https://lepture.com/en/2019/rss-style-with-xsl

This current version is maintained by aboutfeeds.com:

	 https://github.com/genmon/aboutfeeds

The styles in this template come from Cassidy Williams (aka cassidoo):

	 https://cassidoo.co/


## Feedback

This file is in BETA. Please test and contribute to the discussion:

		 https://github.com/genmon/aboutfeeds/issues/8

-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
								xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
			<head>
				<title>Your Web Feed</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
				<style type="text/css">
					:root {
						--white: #faf5f6;
						--transwhite: rgba(250, 245, 246, 0.7);
						--moretranswhite: rgba(239, 239, 239, 0.1);
						--black: #252525;
						--transblack: rgba(37, 37, 37, 0.7);
						--moretransblack: rgba(37, 37, 37, 0.1);
						--gray: #6b6b6b;
						--highlight: #e5ffc3;
						--red: #e4002b;
						--green: #24d05a;
						--pink: #eb4888;
						--blue: #10a2f5;
						--yellow: #e9bc3f;
					}

					::selection {
						background-color: var(--highlight);
						color: var(--black);
					}
					html,
					body {
						margin: auto;
						padding: 20px;
						max-width: 70ch;
						background-color: var(--white);
						word-wrap: break-word;
						overflow-wrap: break-word;
						color: var(--black);
						line-height: 1.6;
					}

					html,
					body,
					button,
					code,
					input {
						font-family: monospace;
					}

					h2, h3,	h4,	h5, h6 {
						color: var(--gray);
					}

					a {
						color: var(--pink);
						text-decoration-thickness: 0.3ex;
						text-underline-offset: 0.3ex;
					}
				</style>
			</head>
			<body>
				<nav>
					<a class="head_link" target="_blank">
						<xsl:attribute name="href">
							<xsl:value-of select="/rss/channel/link"/>
						</xsl:attribute>
						&#x2190; Go back to your website
					</a>
					<p>
						<strong>This is a web feed,</strong> also known as an RSS feed. You can <strong>subscribe</strong> by copying the URL from the address bar into your newsreader.
					</p>
					<p>
						Visit <a href="https://aboutfeeds.com">About Feeds</a> to get started with newsreaders and subscribing. It’s free!
					</p>
				</nav>

				<hr />

				<div>
					<header>
						<h1>
							<!-- https://commons.wikimedia.org/wiki/File:Feed-icon.svg -->
							<svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="vertical-align: text-bottom; width: 1.2em; height: 1.2em;" class="pr-1" id="RSSicon" viewBox="0 0 256 256">
								<defs>
									<linearGradient x1="0.085" y1="0.085" x2="0.915" y2="0.915" id="RSSg">
										<stop  offset="0.0" stop-color="#E3702D"/><stop  offset="0.1071" stop-color="#EA7D31"/>
										<stop  offset="0.3503" stop-color="#F69537"/><stop  offset="0.5" stop-color="#FB9E3A"/>
										<stop  offset="0.7016" stop-color="#EA7C31"/><stop  offset="0.8866" stop-color="#DE642B"/>
										<stop  offset="1.0" stop-color="#D95B29"/>
									</linearGradient>
								</defs>
								<rect width="256" height="256" rx="55" ry="55" x="0"  y="0"  fill="#CC5D15"/>
								<rect width="246" height="246" rx="50" ry="50" x="5"  y="5"  fill="#F49C52"/>
								<rect width="236" height="236" rx="47" ry="47" x="10" y="10" fill="url(#RSSg)"/>
								<circle cx="68" cy="189" r="24" fill="#FFF"/>
								<path d="M160 213h-34a82 82 0 0 0 -82 -82v-34a116 116 0 0 1 116 116z" fill="#FFF"/>
								<path d="M184 213A140 140 0 0 0 44 73 V 38a175 175 0 0 1 175 175z" fill="#FFF"/>
							</svg>

							Web Feed Preview
						</h1>
						<h2><xsl:value-of select="/rss/channel/title"/></h2> <!-- This comes from settings.json and can be edited in Tina -->
						<p><xsl:value-of select="/rss/channel/description"/></p> <!-- This too -->
						<a class="head_link" target="_blank">
							<xsl:attribute name="href">
								<xsl:value-of select="/rss/channel/link"/>
							</xsl:attribute>
							&#x2190; Go back to your website
						</a>
					</header>

					<h2>Recent Items</h2>
					<xsl:for-each select="/rss/channel/item">
						<div>
							<h3>
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:value-of select="link"/>
									</xsl:attribute>
									<xsl:value-of select="title"/>
								</a>
							</h3>
							<small>
								Published: <xsl:value-of select="pubDate" />
							</small>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>