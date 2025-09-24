<#--
Add elements from the sidebar to define your template. Type "${" to use the
autocomplete feature.
-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<#-- Assign a random ID to the carousel to avoid conflicts on the same page "carousel-" + .now?string["yyyyMMddHHmmssSSS"] -->
<#assign carouselId = "testCarousal">

<#-- Check if there are any slides to display -->

<style>
/* This sets the aspect ratio for the carousel container itself */
  .carousel-inner {
      aspect-ratio: 3 / 1;
      overflow: hidden; /* This hides any part of the image that spills over */
  }

/* This targets the individual slide items */
   .carousel-item {
      aspect-ratio: 3 / 1;
  }

/* This ensures the image fills the entire slide container */
  .carousel-item img {
    /* Make the image a block element */
      display: block;

    /* Ensure the image takes up the full width and height of its container */
      width: 100%;
      height: 100%;
			padding-right: 20%;

    /* This scales the image while maintaining its aspect ratio */
      object-fit: cover;
  }

		/* Decrease the opacity of the carousel's control buttons */
     .carousel-control-prev,
       .carousel-control-next {
			 width: 5%;
			 height: 16%;
			 top: 42%;

    /* Sets the initial transparency. A value of 0.5 is 50% transparent. */
         opacity: 0.1;

    /* Ensure a smooth transition when the opacity changes */
        transition: opacity 0.15s ease-in-out;
    }

/* Make the buttons less transparent when a user hovers over them */
     .carousel-control-prev:hover,
       .carousel-control-next:hover {
    /* A value of 0.8 is 80% opaque (20% transparent). */
       opacity: 0.4;
    }
  }

   .carousel-item {
    /* Center the image within its container */
      display: flex;
      justify-content: center;
      align-items: center;

    /* Maintain the aspect ratio of the container itself */
      aspect-ratio: 3 / 1;
   }

	 .slide-text{
	   padding-top: 15%;
		 padding-left: 20%;
	 }

</style>

<#if carouselItem.getSiblings()?has_content>
  <div class="container-fluid" style="background-color: #FDFBF7 !important;">
    <div id="${carouselId}" class="carousel slide" data-bs-ride="carousel">
		     <div class="carousel-inner">
						<#list carouselItem.getSiblings() as cur_slide>
						     <#assign isActive = (cur_slide?index == 0)>
                 <div class="carousel-item <#if isActive>active</#if>">
									 <div class="row d-flex">
									       <div class="col-sm-6">
											      <div class="slide-text">
														 <h1> ${cur_slide.title.getData()} </h1>
                             <div class="clearfix component-paragraph" style="margin-top:5%;margin-bottom:5%">
														     ${cur_slide.subheading.getData()}
														 </div>
														 <a href="${cur_slide.ctaLink.getData()}">
														    <button class="btn btn-primary">
														       Know More
														    </button>
														</a>
                            </div>
										   </div>
                        <div class="col-sm-6">
										      <#if (cur_slide.Image.getData())?? && cur_slide.Image.getData() != "">
										         <img alt="${cur_slide.Image.getAttribute("alt")}" data-fileentryid="${cur_slide.Image.getAttribute("fileEntryId")}" src="${cur_slide.Image.getData()}" class="d-block w-100 carousel-image"/>
		                   	  </#if>
										    </div>
                    </div>
                </div>
            </#list>
        </div>

        <#-- Carousel controls (optional) -->
        <button class="carousel-control-prev" type="button" data-bs-target="#${carouselId}" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#${carouselId}" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden"></span>
        </button>

    </div>
	 </div>
</#if>