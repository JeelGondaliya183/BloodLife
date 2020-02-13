# Read Me for BloodLife

The following webpages have been implemented for this assignment:
1. Home Page
2. Donor Registration Page
3. Organization Login
4. Donor Login
3. Gallery Page
4. Event Page
4. Manage Gallery
5. Registration Successfull Page
6. View Reports
7. Event Management

The Hyperlink takes you directly to the bluenose/hector server where you can preview them.

## GitLab Repository

The code for these webpages can be access through [GitLab](https://git.cs.dal.ca/mahagaokar/Group14_TechGoons/tree/master).

## Images

 **Landing page:**


1. Unsplash, â€œThis local sheriff took about 30 minu... | HD photo by LuAnn Hunt (@luannhunt180) on Unsplash,â€ Beautiful Free Images & Pictures. [Online]. Available: https://unsplash.com/photos/X20g2GQsVdA. [Accessed: 31-May-2019].
1. Unsplash, â€œWorking on web components | HD photo by Yucel Moran (@yucelmoran) on Unsplash,â€ Beautiful Free Images & Pictures. [Online]. Available: https://unsplash.com/photos/Ky9JHrdvb1o. [Ac-cessed: 31-May-2019].
1. Unsplash, â€œHuman, person, injection and arm | HD photo by Chang Duong (@chang612) on Unsplash,â€ Beautiful Free Images & Pictures. [Online]. Available: https://unsplash.com/photos/z4n1tcahzrk. [Ac-cessed: 31-May-2019].
1. Unsplash, â€œPainted red | HD photo by Tim Marshall (@timmarshall) on Unsplash,â€ Beautiful Free Images & Pictures. [Online]. Available: https://unsplash.com/photos/cAtzHUz7Z8g. [Accessed: 31-May-2019].

**Update profile:**
1. â€œFree Image on Pixabay - Head, The Dummy, Avatar, Man, Tie,â€ Head The Dummy Avatar - Free image on Pixabay. [Online]. Available: https://pixabay.com/illustrations/head-the-dummy-avatar-man-tie-659651/. [Accessed: 31-May-2019]. 

**Login:**
1. Vecteezy. (2019). Blood Drive. [online] Available at: https://www.vecteezy.com/vector-art/224235-blood-drive [Ac-cessed 18 Jun. 2019].
1. Bootstrap, S. (2019). Bootstrap 4 Modern Sign In Page. [online] Start Bootstrap. Available at: https://startbootstrap.com/snippets/sign-in-split/ [Accessed 18 Jun. 2019].

**Dashboard:**

1. Depositphotos, I. (2019). AB- blood type on red back-ground.. [online] Depositphotos. Available at: https://depositphotos.com/118038840/stock-photo-ab-blood-type-on-red.html [Accessed 18 Jun. 2019].
1. Depositphotos, I. (2019). B+ blood type on red back-ground.. [online] Depositphotos. Available at: https://depositphotos.com/118038856/stock-photo-b-blood-type-on-red.html [Accessed 18 Jun. 2019].
1. Depositphotos, I. (2019). A+ blood type on red back-ground.. [online] Depositphotos. Available at: https://depositphotos.com/118038772/stock-photo-a-blood-type-on-red.html [Accessed 18 Jun. 2019].
1. Depositphotos, I. (2019). O+ blood type on red back-ground.. [online] Depositphotos. Available at: https://depositphotos.com/118038882/stock-photo-o-blood-type-on-red.html [Accessed 18 J

 
## Libraries/Toolkits Used
 1. **Bootstrap**
    Bootstrap is an open source toolkit for HTML, CSS, and JS development. I have used this toolkit to add responsiveness to the webpages.

 2. **Jquery**
    Jquery is a lightweight Javascript language. It helps in HTML/DOM, CSS manipulation and HTML event methods. 

## Code Inspirations

 1. **Google Maps Embedded** 
 
    *Source Code :* https://www.embedgooglemap.net/ (accessed on 25th May'19)
 

	*Original Code Snippet:* 

		`<div class="mapouter"><div class="gmap_canvas"><iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=university%20of%20san%20francisco&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>Google Maps Generator by <a href="https://www.embedgooglemap.net">embedgooglemap.net</a></div><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div>`
		
	*Modified Code:*
	This code was then used in an `iframe` as shown here:

	    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2645.9577697739874!2d-89.21424329999999!3d48.457339800000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4d5923eaca84fa67%3A0xfd2f9f807114acd4!2s292+Shuniah+St%2C+Thunder+Bay%2C+ON+P7A+3A2!5e0!3m2!1sen!2sca!4v1424272931061" height="420" style="border:0; width:100%"></iframe>

 3. **Password Validation** 
	 
    *Source Code :* http://khaidoan.wikidot.com/bootstrap-form-validation (accessed on 28th May'19)
	
    The intention here was to validate the passwords, emails etc. without writing a external Javascript. I used the examples given in this website to make the Registration form.
	
 4. **Sidebar on Manage Gallery** 
	 
    *Source Code :*[https://bootsnipp.com/snippets/eNe4v](https://bootsnipp.com/snippets/eNe4v) (accessed on 28th May'19)
	
    The idea for the sidebar was from this website. However the code has been modified quite a lot as I have added dividers between segements of the sidebar.
	
 5. **Javascript to show preview of the images to upload in Gallery.**  
	
	*Source Code :* [https://bootsnipp.com/snippets/2eNKz](https://bootsnipp.com/snippets/2eNKz) (accessed on 28th May'19)
	
    The original code shows how we can preview a image before uploading. Also, it allows multiple file selection and their manipulation before uploading.
	I have taken the same concept and have changed the code as per my understanding.

 6. **Regex Patterns**
 
    *Source Code :* [https://regexone.com/](https://regexone.com/)(accessed on 31st May'19)

    Learnt Regex patterns to implement form validations in signup.html
    
 7. **Navbar and Footer**
        
    *Source Code :* [https://getbootstrap.com/docs/4.0/components/navbar/](https://getbootstrap.com/docs/4.0/components/navbar/)

    In order to make a responsive webpage, I took the idea of navbar and footer from bootstrap's documentation page.
    
## W3 Validation

All the webpages are W3 Compliant and have been checked through [https://validator.w3.org](https://validator.w3.org)
