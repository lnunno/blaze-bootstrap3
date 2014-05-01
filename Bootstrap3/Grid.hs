module Grid where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Models
    import Utils

    row :: Html -> Html
    row rowHtml = H.div rowHtml ! class_ (toValue "row")

    toHtmlRows :: [Html] -> [Html]
    toHtmlRows ls = toHtmlLs' ls row

    columnClass :: Bool -> Size -> Int -> String
    columnClass offset size i = if offset then offsetClass else normalClass
        where
            normalClass = "col-" ++ (show size) ++ "-" ++ (show i)
            offsetClass = "col-" ++ (show size) ++ "-offset-" ++ (show i)

    column :: Size -> Int -> Int -> Html -> Html 
    column size i offset html = 
        let 
            offsetClass 
                | offset > 0 = " " ++ columnClass True size offset
                | otherwise = ""
            styleClass = (columnClass False size i) ++ offsetClass
        in
            H.div html ! class_ (toValue styleClass)
