# F.lux on Linux
I was never not using f.lux on Windows, that's why i needed a replacement if i wanted to use Linux, and this is it. This is nothing new, it's just a small bash script to make it easier and more straightforward.

## Why not xflux?
F.lux have a Linux version, but it's not as sophisticated as the Windows version, for reasons stated below:
1. It started as a command-line only program
2. You can not choose the color temperature at will
3. It only works when it's night time
4. They have a xflux-gui, but i believe it to be overkill for just the task of changing the screen temperature.

- There are other alternatives like redshift, or you could manually play with xrandr gamma settings, but they don't produce the same results as flux, i find it to be better overall.

## What does this script do?
1. It enables you to activate f.flux whenever you want, night or day, it relies on setting a fake location when it's day time in your real location.
2. With this ability, you can choose the color temperature you want whenever you want
3. And you only set it up once and use it afterwards 

# Usage
1. Get the script
2. Download ![xflux](https://justgetflux.com/linux.html) for Linux.
3. The script needs xflux to be in the same directory so it can access the actual program, so move both "flux" the script, and "xflux" the program to `/usr/local/bin`
4. You'll need to magnitude and lattitude for your location, and a location that has night time. In my case, i used Algeria and Kiritimati, because they are 14 hours in difference, the transition is seamless. Edit the following lines in the script, in `enable`, change the -l and -g to your actual location, and in `force_enable`, to the place that's currently in night time.
```bash
enable(){
    xflux -l -0.518490 -g 35.631150 -k $color_temperature
}

force_enable(){
    xflux -l 1.872000 -g -157.384216 -k $color_temperature
}
```
5. Run the script by typing `flux` in your terminal. (It needs to be in the /usr/local/bin so it can be accessed from anywhere.)
6. Use ![This website](https://www.worldtimeserver.com/worldclock.aspx) to help you find proper location, and magnitude and lattitude could be googled for any location.

## Examples
- `flux`: Activate it with 3400K (default) color temperature, great for night time and dark rooms
- `flux 4800`: Activate with a custom temperature of 4800K.

## Color tempreratures guide
These are what i found to be commonly used, mostly from the range of 3400 to 5000.

- 6500K -> 0 (Disabled)
- 5000K -> 1
- 4200K -> 2
- 3400K -> 3 (Night time & Default)
- 2600K -> 4
- 2500K -> 5
- 2000K -> 6 (Extreme)
