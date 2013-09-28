module Web.TheFuckingWeather(
    theFuckingWeather
  , theFuckingSummary
  , theFuckingFlavor
  , theFuckingTemperature
  , fuckingCelsiusPlease) where
import Control.Applicative
import Control.Monad
import Network.HTTP
import Text.HTML.TagSoup

type FuckingWeather = IO String

theFuckingWeather :: String -> FuckingWeather
theFuckingWeather l = (simpleHTTP $ getRequest ("http://thefuckingweather.com/?where=" ++ l)) >>= getResponseBody

parseWeather :: FuckingWeather -> String -> IO String
parseWeather w s = fromTagText . (!! 1) . head . (sections (~== s)) <$> parseTags <$> w

theFuckingSummary :: FuckingWeather -> IO String
theFuckingSummary w = parseWeather w "<p class=remark>"

theFuckingFlavor :: FuckingWeather -> IO String
theFuckingFlavor w = parseWeather w "<p class=flavor>"

theFuckingTemperature :: FuckingWeather -> IO Double
theFuckingTemperature w = parseWeather w "<span class=temperature>" >>= readIO :: IO Double

fuckingCelsiusPlease :: IO Double -> IO Double
fuckingCelsiusPlease = fmap (\x -> (5 / 9) * (x - 32))
