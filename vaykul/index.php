<?php get_header(); ?>

	<main role="main" class="konten">
		<section>

			<h1 class="sayfa-baslik"><?php _e( 'Blog', 'html5blank' ); ?></h1>
			<div class="fifth-blog">
			<?php get_template_part('loop'); ?>
			<?php get_template_part('pagination'); ?>
			</div>

		</section>
	</main>
	<div class="yuksek"></div>
<?php get_footer(); ?>
