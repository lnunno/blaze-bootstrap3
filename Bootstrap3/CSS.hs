module CSS where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Models
    
    
    bootstrapButton_ :: InfoType -> Html -> Size -> Html
    bootstrapButton_ infoType innerHtml size = button innerHtml ! class_ (toValue strVal)
        where
            strVal 
                | size == Normal = "btn btn-" ++ (show infoType)
                | otherwise = "btn btn-" ++ (show infoType) ++ " btn-" ++ (show size)

    {-
    Button with normal size.
    -}
    bootstrapButton infoType innerHtml = bootstrapButton_ infoType innerHtml Normal

    imageRounded    = img ! class_ (toValue "img-rounded")
    imageCircle     = img ! class_ (toValue "img-circle")
    imageThumbnail  = img ! class_ (toValue "img-thumbnail")

    {-
    Helper classes
    -}
    closeIcon = button (toHtml "&times;") ! type_ (toValue "button") ! class_ (toValue "close") ! ariaHidden (toValue "true")
    caret innerHtml = H.span innerHtml ! class_ (toValue "caret")
