import rss from "@astrojs/rss";
import { SITE_TITLE, SITE_DESCRIPTION } from "../config";

let posts = Object.values(import.meta.glob("../posts/*.md", { eager: true }));

posts = posts.sort(
	(a, b) =>
		new Date(b.frontmatter.updated || b.frontmatter.added).valueOf() -
		new Date(a.frontmatter.updated || a.frontmatter.added).valueOf()
);

export const GET = () =>
	rss({
		title: SITE_TITLE,
		description: SITE_DESCRIPTION,
		site: import.meta.env.SITE,
		items: posts.map((post) => {
			return {
				link: `/post/${post.frontmatter.slug}`,
				title: post.frontmatter.title,
				pubDate: post.frontmatter.added,
				description: post.frontmatter.description,
				content: post.compiledContent(),
				customData: `<updated>${
					post.frontmatter.updated ? post.frontmatter.updated : ""
				}</updated>`,
			};
		}),
	});
