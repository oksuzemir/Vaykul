<?php get_header(); ?>

	<main role="main" class="konten">
	<!-- section -->
	<section>

	<?php if (have_posts()): while (have_posts()) : the_post(); ?>



			<h1 class="sayfa-baslik">
			<?php the_title(); ?>
			</h1>

			<div class="post-ayarla">
				<?php the_content(); // Dynamic Content ?>
			</div>
			
	<?php endwhile; ?>

	<?php else: ?>

		<article>

			<h1><?php _e( 'Sorry, nothing to display.', 'html5blank' ); ?></h1>

		</article>

	<?php endif; ?>

	</section>
	<!-- /section -->
	</main>

		<div class="yuksek"></div>
<?php get_footer(); ?>
