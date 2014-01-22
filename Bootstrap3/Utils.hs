module Utils where

    import Text.Blaze.Html5 hiding (map)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty

    saveHtmlFile :: FilePath -> Html -> IO ()
    saveHtmlFile fp html = writeFile fp (renderHtml html) 

    concatHtml :: [Html] -> Html
    concatHtml htmlLs = sequence_ htmlLs

    {-
    Wrap all outmost tags with a <li></li>.
    -}
    toHtmlLs :: [Html] -> [Html]
    toHtmlLs ls = map (\h -> li h) ls