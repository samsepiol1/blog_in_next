import Footer from '../components/Footer'
import Link from 'next/link';
import { getAllPosts } from '../infra/getAllPosts';

export default function Home({ allPosts }) {
  return (
    <div>
      <header className="headerContainer">
        <h1>
          Lucas Matheus Blog
        </h1>
      </header>

      <section className="postsContainer">
        {allPosts.map((post) => (
          <article key={post.slug} className="postsContainer__post">
            <Link href={`posts/${post.slug}`}>
              <a>
                {post.title}
              </a>
            </Link>
            <p>
              {post.excerpt}
            </p>
            <img src={post.imgsrc} className="image_front"/>
            <br/>
          </article>
        ))}
      </section>
    </div>
  )
}

export async function getStaticProps() {
  const allPosts = await getAllPosts([
    'title',
    'slug',
    'excerpt',
    'imgsrc',
  ])
  return {
    props: { allPosts },
  }
}


