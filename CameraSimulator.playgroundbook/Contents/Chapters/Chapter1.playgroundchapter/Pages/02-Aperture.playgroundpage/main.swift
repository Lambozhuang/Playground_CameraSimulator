/*:
 # Aperture
 ___
### This page will show you what is the aperture and how it affects the photo
 ___
 Aperture is one of the most important components inside the camera.
 
 You can see it as the *FIRST GATE* of the light.
 
 And it can adjust the size of itself to control the amount of light that comes in to the camera.
 
 In the actual use, you will find that the size of aperture also controls the background's degree of blur.
 
 - Here is the explanation in **physics**:
 
 ![](aperture-explain)
 
 So basically the size of the aperture controls the *cone of light*, and the smaller aperture, the narrower the cone becomes, and this would create a wider range of focus, so that the depth of field becomes larger. And the depth of field controls the blur of the view other than the focus point. For example, if you are taking a portrait photo, and you have focused on the person. Now when you change the aperture, you will find that the blur of the background is also changing. And the larger aperture will make the background more blurred.
 
 - After learned about the physics behind the aperture, you can try to change the `currentApertureChoice` below and then press then **Run My Code** button to find out how it change the photo.
 > In the field of photography, people set up a standard measurement to identify the size of cameras' aperture. Aperture is measured in units called f-stop. The aperture size is inversely related to the f-stop value. Thus when you want a larger aperture, you have a smaller f-stop value e.g. f/1.4.
 */

//#-hidden-code
import PlaygroundSupport
import BookCore

apertureStart = true
//#-end-hidden-code
currentApertureChoice = ./*#-editable-code*/small/*#-end-editable-code*/

//#-hidden-code
PlaygroundPage.current.liveView = instantiateLiveView(identifier: .aperture)
//#-end-hidden-code
