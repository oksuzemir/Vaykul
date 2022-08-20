<?php get_header(); ?>

	<main role="main" class="konten ayarla">
		<!-- section -->
		<section>

			<h1 class="sayfa-baslik"><?php  single_cat_title(); ?></h1>

			<?php get_template_part('loop-cat'); ?>

			<?php get_template_part('pagination'); ?>

		</section>
		<!-- /section -->
	</main>

	<div class="yuksek"></div>

<?php get_footer(); ?>
