<?php get_header(); ?>

	<main role="main" class="konten">
		<!-- section -->
		<section>

			<h1 class="sayfa-baslik"><?php echo get_search_query(); ?></h1>
			<div class="fifth-blog">
			<?php if (have_posts()): while (have_posts()) : the_post(); ?>


	<!-- article -->

	<div class="fifth-blog-card">
	<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
            <div class="fifth-blog-card-header">
              <a href="<?php the_permalink(); ?>">

              <?php if ( has_post_thumbnail()) : ?>
          							
				<?php the_post_thumbnail('large')?>
        
                               <?php else: ?>
                      
                      <img width="250" height="72" src="<?php echo get_template_directory_uri(); ?>/img/bos-img.jpg" data-src="<?php echo get_template_directory_uri(); ?>/img/bos-img.jpg" loading="lazy" >
                             <?php endif; ?>

              </a>
              <div class="fifth-blog-date">
                <span> <?php the_time('j'); ?></span>
                <span> <?php the_time('F'); ?></span>
              </div>
            </div>
            <div class="fifth-blog-card-content ciz">
              <div class="fifth-blog-title">
                <h2> <a href="<?php the_permalink(); ?>"> <?php the_title(); ?> </a> </h2>
              </div>
              <div class="fifth-blog-text">
                <p><?php html5wp_excerpt('html5wp_index'); ?></p>
              </div>
            </div>
			</article>
          </div>

	

		  <?php
    endwhile;
    wp_reset_postdata(); // this should be inside if - there is no need to rested postdata if the_post hasn’t been called.
    endif; 
?>

			</div>

		</section>
	</main>


<?php get_footer(); ?>
