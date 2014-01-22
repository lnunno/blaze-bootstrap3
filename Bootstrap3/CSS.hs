module CSS where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty

    data InfoType = Default | Primary | Success | Info | Warning | Danger | Link  deriving (Eq)

    instance Show InfoType where
        show Default = "default"
        show Primary = "primary"
        show Success = "success"
        show Info = "info"
        show Warning = "warning"
        show Danger = "danger"
        show Link = "link"

    data Size = Large | Normal | Small | ExtraSmall deriving (Eq)

    instance Show Size where
        show Large =  "lg"
        show Normal =  ""
        show Small =  "sm"
        show ExtraSmall =  "xs"
    
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
    closeIcon = button (toHtml "&times;") ! type_ (toValue "button") ! class_ (toValue "close") ! customAttribute (stringTag "aria-hidden") (toValue "true")
    caret innerHtml = H.span innerHtml ! class_ (toValue "caret")
