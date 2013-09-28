# The Fucking Weather

A Haskell library for retrieving information from
[thefuckingweather.com](http://thefuckingweather.com/)

Note that this library is unofficial and uses Haskell's TagSoup library
to screen-scrape TFW.

## API

```haskell
-- Get a FuckingWeather (which is really an IO String).
theFuckingWeather :: String -> FuckingWeather

-- Get the current summary
theFuckingSummary :: FuckingWeather -> IO String

-- Get flavor text
theFuckingFlavor :: FuckingWeather -> IO String

-- Get temperature
theFuckingTemperature :: FuckingWeather -> IO Double

-- Convert temperature to celsius
fuckingCelsiusPlease :: IO Double -> IO Double
```

## Example

```haskell
*Network.TheFuckingWeather> theFuckingTemperature $ theFuckingWeather "44305"
57.0
*Network.TheFuckingWeather> :t theFuckingTemperature $ theFuckingWeather "44305"
theFuckingTemperature $ theFuckingWeather "44305" :: IO Double
*Network.TheFuckingWeather> fuckingCelsiusPlease $ theFuckingTemperature $ theFuckingWeather "44305"
13.88888888888889
```

# License

BSD3, see `LICENSE`.
