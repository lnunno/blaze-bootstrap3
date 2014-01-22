module Models where

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

    noHtml        = toHtml ""

    {-
    Custom attributes.
    -}
    ariaHidden = customAttribute (stringTag "aria-hidden") 

    role = customAttribute (stringTag "role")