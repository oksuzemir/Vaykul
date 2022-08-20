<?php /* Template Name: Anasayfa */ get_header(); ?>

<section class="first-section">


	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
  <img src="<?php echo wp_get_attachment_image_url(get_post_meta(get_the_ID(), 'second_featured_image', true), 'full'); ?>" alt="">
            <div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
              <?php the_post_thumbnail( 'full' ); // Original image resolution (unmodified) ?>
              
            </div>
          <?php endwhile; ?>
        <?php else : ?>
        <?php endif; ?>
  </section>


  <div class="search-overlay">
    <div class="search-overlay-close"></div>
    <div class="search-form">
      <form method="get" action="">
        <input type="text" placeholder="Arayın..." name="s" />
        <button type="submit" role="button">
          <i class="fa fa-search"></i>
        </button>
      </form>
    </div>
  </div>
  <script type="text/javascript" async>
    (function () {
      var css = document.createElement("link");
      css.href =
        "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap";
      css.rel = "stylesheet";
      css.type = "text/css";
      document.getElementsByTagName("head")[0].appendChild(css);
    })();
  </script>
  <script type="text/javascript" async>
    (function () {
      var css = document.createElement("link");
      css.href =
        "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css";
      css.rel = "stylesheet";
      css.type = "text/css";
      document.getElementsByTagName("head")[0].appendChild(css);
    })();
  </script>
  <script defer>
    var searchOverlay = document.querySelector(".search-overlay");
    var searchBtn = document.querySelector(".search-button");
    var searchClose = document.querySelector(".search-overlay-close");
    var burgerMenu = document.getElementById("burger-menu");
    var navigation = document.querySelector(".mobile-nav");
    var navigationList = document.querySelector(".mobile-nav ul");
    searchBtn.addEventListener(
      "click",
      function (ev) {
        searchOverlay.classList.add("search-overlay-active");
      },
      false
    );

    searchClose.addEventListener(
      "click",
      function (ev) {
        searchOverlay.classList.remove("search-overlay-active");
      },
      false
    );
    burgerMenu.addEventListener("click", function () {
      this.classList.toggle("close");
      navigation.classList.toggle("nav-active");
      navigationList.classList.toggle("fade-in-up");
    });



    if (window.innerWidth < 900) {
      const list = document.querySelectorAll(".menu-item-has-children");
      for (const el of list) {
        var newEl = '<i class="fa fa-angle-right"></i>';
        el.insertAdjacentHTML(
          "beforeend",
          '<i class="fa fa-angle-down"></i>'
        );
      }

      (function () {
        var menuElems = document.querySelectorAll(
          ".menu-item-has-children .fa-angle-down"
        );
        menuElems.forEach(function (elem) {
          elem.addEventListener(
            "click",
            function () {
              menuElems.forEach(function (e) {
                e.previousElementSibling.classList.toggle("sub-menu-active");
              });
            },
            false
          );
        });
      })();
      darkModeToggle.parentNode.appendChild(darkModeToggle);
      searchBtn.parentNode.appendChild(searchBtn);
      burgerMenu.parentNode.appendChild(burgerMenu);
    }

    const filterItem = document.querySelector(".items");
    const filterImg = document.querySelectorAll(".gallery .gallery-item");

    window.onload = () => { //after window loaded
      filterItem.onclick = (selectedItem) => { //if user click on filterItem div
        if (selectedItem.target.classList.contains("item")) { //if user selected item has .item class
          filterItem.querySelector(".active").classList.remove("active"); //remove the active class which is in first item
          selectedItem.target.classList.add("active"); //add that active class on user selected item
          let filterName = selectedItem.target.getAttribute("data-name"); //getting data-name value of user selected item and store in a filtername variable
          filterImg.forEach((image) => {
            let filterImges = image.getAttribute("data-name"); //getting image data-name value
            //if user selected item data-name value is equal to images data-name value
            //or user selected item data-name value is equal to "all"
            if ((filterImges == filterName) || (filterName == "all")) {
              image.classList.remove("hide"); //first remove the hide class from the image
              image.classList.add("show"); //add show class in image
            } else {
              image.classList.add("hide"); //add hide class in image
              image.classList.remove("show"); //remove show class from the image
            }
          });
        }
      }
      for (let i = 0; i < filterImg.length; i++) {
        filterImg[i].setAttribute("onclick", "preview(this)"); //adding onclick attribute in all available images
      }
    }

    const de = document.querySelectorAll(".harf-siniri");
    for (var i = 0; i < de.length; i++) {
      var ben = de[i].innerHTML;
      var den = ben.substr(0, 70);
      de[i].innerHTML = den + "..."; // yazdır

    }

  </script>
  
  
  
</body>

</html>

