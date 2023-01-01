import rss from "@astrojs/rss";
import { SITE_TITLE, SITE_DESCRIPTION } from "../config";

const posts = Object.values(import.meta.glob("../posts/*.md", { eager: true }));

export const get = () =>
	rss({
		title: SITE_TITLE,
		description: SITE_DESCRIPTION,
		site: import.meta.env.SITE,
		items: posts.map((post) => {
			return {
				link: `/post/${post.frontmatter.slug}`,
				title: post.frontmatter.title,
				pubDate: post.frontmatter.added,
				content: post.compiledContent(),
			};
		}),
	});
