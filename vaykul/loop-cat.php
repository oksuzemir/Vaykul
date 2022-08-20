<section class="third-section">
    <div class="gallery-konten">
        <nav>
      <!-- filter Items -->
      <?php if (is_category()) {
    $this_category = get_category($cat);
    if (get_category_children($this_category->cat_ID) != "") {
        echo '<div class="items">';
            $childcategories = get_categories(array(
                'orderyby' => 'name',
                'hide_empty' => false,
                'child_of' => $this_category->cat_ID
            ));	
            ?> <span class="item active" data-name="all">Hepsi</span> <?php
        foreach($childcategories as $category) {


			?>
			<span class="item" data-name="<?php echo $category->term_id ?>"><?php echo $category->name ?></span>
            

			<?php
        } echo '</div>';
    }
    else{  
        get_template_part('loop-header');   
        if (have_posts()) :
            get_template_part('loop-actions');
            get_template_part('loop-content');
            get_template_part('loop-nav');
        else :
            get_template_part('loop-error');
        endif;  }}?>
<?php 
    ?>
    </nav>
        <div class="gallery"> 
            <?php if (have_posts()): while (have_posts()) : the_post(); ?>


            <p>
                <?php 
                $id = get_the_ID();
                $cats = get_the_category($id);
                echo ( count($cats) == 1  ? '' : '');
                $c = 0; $n = 0;
                $c = count($cats);
                foreach ( $cats as $cat ):
                    $n++; ?>

                <?php endforeach; ?>
        
              
                <div class="gallery-item" data-name="<?php echo $cat->term_id ?>">
                <?php if ( has_post_thumbnail()) : // Check if thumbnail exists ?>
                        <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>">
                            <?php the_post_thumbnail('large'); // Declare pixel size you need inside the array ?>
                        </a>
                    <?php endif; ?>
                    <div class="gallery-item-content">
                        <div class="gallery-item-title">
                            <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a>
                        </div>
                        <div class="gallery-item-text">
                        <?php html5wp_excerpt('html5wp_index'); // Build your custom callback length in functions.php ?>

                        </div>
                    </div>
                </div>
    

            <?php endwhile; ?>
            <?php else: ?>
            <?php endif; ?>
    </div>
</div>

</section>
