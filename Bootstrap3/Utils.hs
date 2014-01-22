module Utils where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty

    saveHtmlFile :: FilePath -> Html -> IO ()
    saveHtmlFile fp html = writeFile fp (renderHtml html) 

    concatHtml :: [Html] -> Html
    concatHtml htmlLs = sequence_ htmlLs