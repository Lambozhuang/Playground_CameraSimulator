/*:
 # Exposure Time
 ___
 ### This page will show you how exposure time affects the photo
 ___
 On the previous page, we've learned that increasing ISO value can help the camera capture more light in the dark environment. But if you look carefully on the photo, you would find that as the ISO value increases, the photo becomes brighter, but there is also more and more **noise** appears on the photo, which makes the photo less detailed.
 
 So if the aperture size is fixed, the best way to take a good photo in a dark environment is to increase the **exposure time** (or decrease the shutter speed) instead of boost the ISO value.
 
 > Exposure time aka shutter speed, is one of three important elements that controls the exposure.
 
 Shutter is like the *SECOND GATE* (aperture is the first one) of the camera. After the light coming through the lenses and the aperture, it meet the shutter. Shutter is like a horizontal curtain. It is usually closed and when the user press the shutter button, the shutter will open shortly (the time depends on the setting on the camera) and then close again. The whole process is like a curtain dropping and then closing. And when the "curtain" opens, the light can come through the gate and reach the sensor.
 
 So basically a faster shutter speed will cause a shorter exposure time. And the more of a exposure time, the more light can come through the gate and reach the image sensor, so the photo will be brighter.
 
 And this bright is *different* from the "ISO bright". Because the sensor can have more time to "see" the light, and it will capture more **detail**. The amount of detail depends on the exposure time.
 ___
 Overall, if you want to take a normal brightness picture in a dark environment, and the aperture is fixed, either you increase the value of ISO setting, or you can increase the time of exposure, while the higher ISO, the less detail will the camera capture.
 
 - Now you can press the **Run My Code** button to start the simulation, and try different *combinations of ISO and exposure time*, and see how the photo becomes.
 
 > The shutter speed is measured by the time of exposure. So the large value represents a slow shutter speed and a long exposure time. e.g. 1/100 of the shutter speed is faster than 1/10 of the shutter speed.
 
 > As long as you can make the camera very stable, you always choose to increase the exposure time first, then consider increase the ISO for a little bit.
 
 */

//#-hidden-code
import PlaygroundSupport
import BookCore
shutterSpeedStart = true
PlaygroundPage.current.liveView = instantiateLiveView(identifier: .shutterSpeed)
//#-end-hidden-code
