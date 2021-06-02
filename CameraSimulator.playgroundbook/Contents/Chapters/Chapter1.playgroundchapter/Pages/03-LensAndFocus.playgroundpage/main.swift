/*:
 # Lens and Focus
 ___
 ### This page will show you how the focal length and the focal distance affect the photo
 ___
 Have you thought about the lens choice when you were taking photos?
 
 Although nowadays almost every phone will have more than one lens, and you can choose them when taking photos. Like you can adjust the range of vision from 0.5x to 10x on iPhone 11 Pro.
 
 As we know the iPhone 11 Pro only has three lenses. So except the 0.5x, 1.0x and 2.0x, others are all **not optical** zoom, which means the phone will cut the photo to fake the zoom. Then the phone will use the processor to enhance the photo to meke it look more realistic. And that's why it will lose details when you attempt to zoom photos on the phone.
 
 Why phones can not have more lens choices? Because there is a hardware limitation: the space in the phone is too small for complicated lenses.
 ___
 And when it comes to the *professional cameras*, the lens choices would be a lot more than that on phone.
 
 With more lens choices, you can take more different photos with different zoom while **keeping all the details** on the photo. And that's because switching lenses is nothing like digital zoom, it won't lose details of lights.
 
 > Normally, we divide all lens into three main sections: **Wide**, **Common** and **Telephoto**. Wide is more for taking scenery pictures or wide angle pictures that contains more infomation. Common is often for some normal use and the focal length is more close to human eyes. Telephoto is more for those situations that you want some details in the photo to be outstanding. Taking portrait photos are more likely to choose telephoto lenses.
 ___
 - Now you can press the **Run My Code** button to start the simulation and try differet focal length and see the differences.
 
 > The photo is a little bit blurred? Try to change the focal distance to make the camera foucs!
 
 > You can also change the value of `currentLensChoice` below to switch between lenses.
 
 */

//#-hidden-code
import PlaygroundSupport
import BookCore
lensAndFocusStart = true
//#-end-hidden-code
currentLensChoice = ./*#-editable-code*/wide/*#-end-editable-code*/

//#-hidden-code
PlaygroundPage.current.liveView = instantiateLiveView(identifier: .lensAndFocus)
//#-end-hidden-code
