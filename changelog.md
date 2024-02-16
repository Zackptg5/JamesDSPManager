### v6.0 - 2.16.2024
* mmtex v3.6 update
* Update pbone apk
* Update jdsp app/libs

### v5.8 - 9.11.2023
* Update pbone apk
* Update jdsp app/libs
* mmtex v3.5 update

### v5.7 - 9.3.2023
* Automatic 32/64 bit lib detection
* mmtex v3.4 update

### v5.6 - 8.24.2023
* Lib bug fix

### v5.5 - 8.21.2023
* Update official apk:
  * Introduce fully functional continuous wavelet transform to dynamic range compander as a experimental trial
  * Use custom implementation of libsamplerate, the file no longer bloat with coefficients

### v5.4 - 8.13.2023
* Update to mmtex v3.3
* Update the thepbone jdsp app

### v5.3 - 8.11.2023
* Update mmtex to v3.2

### v5.2 - 7.28.2023
* Bug fix with osp removal
* Add thepbone APK option

### v5.1 - 7.25.2023
* Bug fix for odm on KSU and magisk delta
* Updated to mmtex v3.1
  * Added support for odm in regular magisk (should fix oneplus device issues) - thanks to @ShadoV90 (https://t.me/ShadoV90) for the fix

### v5.0 - 7.15.2023
* JDSP app updated!:
  * LiveProg update: Clean up EEL RAM disk before new script being loaded
  * EEL engine update:
    * Unify string, thread pool, convolver in one virtual data type
    * Introduce efficient running min/max, median filter
    * Allow STFT window function to be specified
    * Correct STFT phase value(Yield no difference for any previous scripts that depends on relative phase / magnitude only spectral processing)

### v4.8 - 7.10.2023
* Update mmtex to v3.0 - adds support for ksu and magisk delta

### v4.7 - 5.22.2023
* Update mmtex v2.1 - fix for magisk v26+

### v4.6 - 8.4.2022
* Update jdsp libs

### v4.5 - 6.25.2022
* Update jdsp libs

### v4.4 - 1.31.2022
* Update to MMT-Ex v2.0 - support for magisk 24 module update method

### v4.3 - 11.21.2021
* MMT-EX v1.8 update - fix for magisk canary, minmagisk now 20.4

### v4.2 - 9.17.2021
* Always install as data app, no need for system app in older android versions

### v4.1 - 9.9.2021
* Only uninstall app if older than current
* Update mmtex to v1.7
* Fix app update process - uninstall app during zip flash, reboot to complete process

### v4.0 - 9.8.2021
* JDSP app updated!:
  * New app/drivers made open sourced
  * Frequency domain dynamic range compression, give you much crazier compression
  * New dynamic bass boost, proper implementation of signal power detection, proper sample delay apply to multirate analysis and deploy state space filter to achieve boosting filter parameters.
  * Greatly reduce power consumption for some cases, especially when Convolver and Equalizer is used
  * Add user manual to main app
* No more new/old options
* Removed old options

### v3.4 - 5.14.2021
* Update volkey addon

### v3.3 - 11.2.2020
* Update to MMT-Ex v1.6
* Update volkey addon

### v3.2 - 9.9.2020
* Added hidden_api_policy workaround for android 11

### v3.1 - 8.25.2020
* New JDSP app updated!:
  * Equalizer interface and actual frequency response mismatch
  * libsndfile replaced with much smaller dr_libs for impulse response file loading
  * Uses Android 10 API as compiling
  * Additional features:
    * Shrinking impulse response according users thresholds
    * Uses minimum phase transform on impulse response if user needed
    * Customizable channel dependent sample delay at the impulse response beginning

### v3.0 - 4.9.2020
* Fix boot script
* Update to MMT-EX v1.5
* New JDSP app update!:
  * Reduce parameter commit
  * Junked Convolver benchmark system, improve device responsiveness when the device is booting
  * New Dynamic range compressor, full automatic internal parameter adjustment(BUT haven't fully adapt to level depend system(I mean audio framework)
  * New bass boost system, the system automatically detect "Interesting frequency", and adjust filter gain, bandwidth accordingly
  * New FIR Equalizer, enhance interpolator algorithms, more interpolation mode and faster filter generation
  * New convolution algorithm, much faster, much more power saving, remove impulse response cutting feature, however, algorithm not yet fully completed, there will still update that boost performance further.
  * New stereo widening algorithm
  * New BS2B Crossfeed system, with traditional BS2B and a few HRTF based crossfeed(Include the one provided by @Joe0Bloggs )
  * Remove computationally heavy load 7.1 surround simulation, if you still want one, go download Hiby music player!
  * More stable live programming virtual machine, more built-in features that allow user to build very complex audio effect.
  * Processing performance improvement for all effects
  * Arbitrary phase response
  * DDC, Reverb, Arbitrary magnitude response algorithm remain the same
  * Remove all GPL code, allow full close source implementation😂😂😂However live programming compiler/Virtual machine will still go open source, last but not least, all rewritten C API will still go open source for our reference implementation of processing system.

### v2.7 - 1.22.2020
* Update to MMT-Ex v1.3 (Fixes issues on Q)

### v2.6 - 1.17.2020
* Update to MMT-Ex v1.2

### v2.5 - 1.4.2020
* Switched from Unity to MMT-Ex

### v2.4 - 12.30.2019
* Unity v5.0 update

### v2.3 - 8.11.2019
* Unity v4.4 update

### v2.2 - 5.16.2019
* Update to Unity v4.2

### v2.1 - 5.3.2019
* Update to Unity v4.1

### v2.0 - 3.28.2019
* Don't prompt for lib workaround if device that needs it
* Update to unity v4.0

### v1.9.8 - 2.21.2019
* Added Samsung Galaxy S9 and Zuk Z2 Pro to lib workaround
* Made lib workaround a choice so I don't have to keep updating this
* Unity v3.3 update

### v1.9.7 - 1.16.2019
* Forgot to move apk back to priv-app (needed for unity 3.2)

### v1.9.6 - 1.15.2019
* Unity v3.2 update

### v1.9.5 - 1.11.2019
* Unity hotfix

### v1.9.4 - 1.10.2019
* Unity v3.1 update

### v1.9.3 - 1.5.2019
* Unity v3.0 update

### v1.9.2 - 12.23.2018
* Fixed hua/nhua zipname trigger for real this time
* Unity v2.2 update

### v1.9.1 - 12.20.2018
* Fixed hua/nhua zipname trigger
* Fix lib workaround
* Update to Unity v2.1

### v1.9 - 12.18.2018
* Unity v2.0 update
* Fixed limitation in zipname triggers - you can use spaces in the zipname now and trigger is case insensitive
* Improved boot script for user app install - should fix bootloop issues

### v1.8 - 11.21.2018
* Updated JDSP to 11.20.18 release (Change FFT to slower but a commercial friendly implementation, Improve TruCentre separation, Reduce TruCentre latency to 21 ms(from 32 ms), Fix arbitrary response equalizer memory leaks)

### v1.7.5 - 11.8.2018
* Add libstdc++ workaround for pixel 2's, 3's, and essential phone

### v1.7.4 - 10.29.2018
* Switch to manual huawei selection - too much variation with custom roms for consistent huawei device detection

### v1.7.3 - 10.24.2018
* Unity v1.7.2 update
* Bug fix for arm64 devices
* Bug fixes for huawei devices

### v1.7.2 - 10.23.2018
* Fixed awesome boot script for pie - magisk apk stuff is automated once again :)

### v1.7.1 - 10.22.2018
* Fix boot hanging on Pie roms

### v1.7 - 9.20.2018
* Update to unity 1.7.1
* Widen detection for huawei devices

### v1.6.9.1 - 9.16.2018
* Hotfix for Huawei devices

### v1.6.9 -9.13.2018
* Updated JDSP to 9.13 release (adds huawei support, adds auto DDC resampler for device running on 96k sample rate or above, fixes some device volume issue caused by bit depth)

### v1.6.8 - 9.3.2018
* Updated JDSP to 8.31 release

### v1.6.7 - 9.2.2018
* Unity v1.7 update
* Added auto-install/uninstall of apk for magisk only (works for disable/enabling mod in magisk manager as well)
* Add compression to save space/bandwidth

### v1.6.6 - 8.30.2018
* Unity v1.6.1 update

### v1.6.5 - 8.26.2018
* New JamesDSP build (Now supports HTC devices)
* Fixed bit depth problem from HTC and Android Pie
* Upgraded Fast Fourier Transform libraryand  Android NDK

### v1.6.4 - 8.24.2018
* Unity v1.6 update

### v1.6.3 - 7.17.2018
* Unity v1.5.5 update

### v1.6.2 - 5.7.2018
* Unity v1.5.4 update

### v1.6.1 - 4.26.2018
* Unity v1.5.3 update

### v1.6 - 4.16.2018
* Unity v1.5.2 update
* Add AML detection/notification
* Add auto install for apk if in bootmode

### v1.5.9 - 4.12.2018
* Reworking/fixing of audio file patching

### v1.5.8 - 4.12.2018
* Unity v1.5.1 update

### v1.5.7 - 4.12.2018
* Unity v1.5 update

### v1.5.6 - 4.9.2018
* Use dynamic effect removal

### v1.5.5 - 3.30.2018
* Fix effect removals

### v1.5.4 - 3.29.2018
* Unity v1.4.1 update

### v1.5.3 - 3.18.2018
* Unity v1.4 update

### v1.5.2 - 3.1.2018
* Real fix for vol key logic

### v1.5.1 - 2.26.2018
* Quick fix for vol key logic

### v1.5 - 2.25.2018
* Fixed vendor files in bootmode for devices with separate vendor partitions
* Bring back old keycheck method or devices that don't like the newer chainfire method
* Fix seg faults on system installs

### v1.4.2 - 2.17.2018
* Boot script not working, have user do it manually for oreo

### v1.4.1 - 2.16.2018
* Updated jdsp to new version

### v1.4 - 2.16.2018
* Add file backup on system installs
* Fine tune unity prop logic
* Update util_functions with magisk 15.4 stuff
* Fix music_helper/sa3d removal in xml files

### v1.3 - 2.12.2018
* Fix vendor cfg creation for devices that don't have it
* Fix sepolicy patching

### v1.2 - 2.10.2018
* Added sa3d removal for samsung devices

### v1.1 - 2.6.2018
* Fixes for xml cfg files

### v1.0 - 2.5.2018
* Initial rerelease

## Credits
* [James34602](https://forum.xda-developers.com/android/apps-games/app-reformed-dsp-manager-t3607970)

## Source Code
* Module [GitHub](https://github.com/therealahrion/JamesDSPManager)
* App [GitHub](https://github.com/james34602/JamesDSPManager)
