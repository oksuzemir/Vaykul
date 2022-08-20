<?php get_header(); ?>

	<main role="main" class="konten">



			<h1 class="sayfa-baslik"><?php the_title(); ?></h1>

		<?php if (have_posts()): while (have_posts()) : the_post(); ?>

			<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

				<?php the_content(); ?>

			</article>

		<?php endwhile; ?>

		<?php else: ?>

			<article>

				<h2><?php _e( 'Sorry, nothing to display.', 'html5blank' ); ?></h2>

			</article>
		<?php endif; ?>

	</main>
<div class="yuksek"></div>

<?php get_footer(); ?>
