{-# LANGUAGE OverloadedStrings #-}
module CDN where
    
    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import Models

    cssLinks      = [
             "http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css",
            -- Bootswatch css links.
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/amelia/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cerulean/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cosmo/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cyborg/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/flatly/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/journal/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/readable/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/simplex/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/slate/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/spacelab/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/united/bootstrap.min.css",
             "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/yeti/bootstrap.min.css"
            ]
    jsVal         =  "http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"
    jqueryVal     =  "http://code.jquery.com/jquery-1.10.2.min.js"
    stylesheetVal =  "stylesheet"
    fontAwesomeVal =  "http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"

    css :: Int -> Html
    css n        = link ! rel stylesheetVal ! href (cssLinks !! n)

    bootstrapcss = css 0
    bootstrapjs  = script noHtml ! src jsVal 
    jquery       = script noHtml ! src jqueryVal

    fontAwesome  = link ! rel stylesheetVal ! href fontAwesomeVal