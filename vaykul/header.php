<!doctype html>
<html <?php language_attributes(); ?> class="no-js">
	<head>
		<meta charset="<?php bloginfo('charset'); ?>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<?php wp_head(); ?>
		<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/style/style.css" />
        <link href="<?php echo get_template_directory_uri(); ?>/img/icons/favicon.ico" rel="shortcut icon">
        <link href="<?php echo get_template_directory_uri(); ?>/img/icons/touch.png" rel="apple-touch-icon-precomposed">


	</head>
	<body>
	<div class="top-nav">
		<div class="konten">
		<div class="logo">
			<a href="<?php pll_e('/'); ?>">
			<img class="changelogo" src="<?php echo get_template_directory_uri(); ?>/img/logo.png" alt="" />
			</a>
		</div>
		<div class="search-button">
			<i class="fa fa-search"></i>
		</div>
		<div id="burger-menu">
			<span></span>
		</div>
		</div>
  </div>
	<div class="bot-nav">
			<div class="konten">
			<nav class="mobile-nav">
			<?php html5blank_nav(); ?>
			</nav>
			</div>
	</div>
