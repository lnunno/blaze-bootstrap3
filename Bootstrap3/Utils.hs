module Utils where

    import Text.Blaze.Html5 hiding (head,map)
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

    {-
    Wrap all elements with the supplied tag.
    -}
    toHtmlLs' :: [Html] -> (Html -> Html) -> [Html]
    toHtmlLs' ls htmlFunc = map (\h -> htmlFunc h) ls

    subStyleclasses :: String -> [String] -> String
    subStyleclasses baseclass subclasses = 
        if length subclasses == 1 && (head subclasses) == ""
            then 
                baseclass
            else 
                baseclass ++ (concatMap 
                    (\scl -> 
                        if scl == "active" 
                            then
                                " active" 
                            else
                                " " ++ baseclass ++ "-" ++ scl) 
                    subclasses)