module CDN where
    
    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import Models

    cssLinks      = [
            toValue "http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css",
            -- Bootswatch css links.
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/amelia/bootstrap.min.css",
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cerulean/bootstrap.min.css",
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cosmo/bootstrap.min.css",
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/cyborg/bootstrap.min.css",
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/flatly/bootstrap.min.css",
            toValue "http://netdna.bootstrapcdn.com/bootswatch/3.0.3/journal/bootstrap.min.css"
            ]
    jsVal         = toValue "http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"
    jqueryVal     = toValue "http://code.jquery.com/jquery-1.10.2.min.js"
    stylesheetVal = toValue "stylesheet"
    fontAwesomeVal = toValue "http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"

    css :: Int -> Html
    css n        = link ! rel stylesheetVal ! href (cssLinks !! n)

    bootstrapcss = css 0
    bootstrapjs  = script noHtml ! src jsVal 
    jquery       = script noHtml ! src jqueryVal

    fontAwesome  = link ! rel stylesheetVal ! href fontAwesomeVal