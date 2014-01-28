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

    data Size = Large | Normal | Medium | Small | ExtraSmall deriving (Eq)

    instance Show Size where
        show Large =  "lg"
        show Normal =  ""
        show Medium = "md"
        show Small =  "sm"
        show ExtraSmall =  "xs"

    data NavType = Tabs | Pills deriving (Eq)

    instance Show NavType where
        show Tabs = "tabs"
        show Pills = "pills" 
        

    data NavModifier = Justified | Stacked | None deriving (Eq)

    instance Show NavModifier where
        show Justified = "justified"
        show Stacked = "stacked" 


    data AlertModifier = Dismissable | NoAlertModifier deriving (Eq)

    instance Show AlertModifier where
        show Dismissable = "dismissable" 

    noHtml        = toHtml ""

    data IsActive = Active | NotActive deriving (Eq)

    instance Show IsActive where
        show Active = "active"
        show _ = "" 

    {-
    Custom attributes.
    -}
    ariaHidden = customAttribute (stringTag "aria-hidden") 

    role = customAttribute (stringTag "role")

    dismissModalAttribute = dataAttribute (stringTag "dismiss") (toValue "modal")

    closeButton = button (toHtml "&times;") ! type_ (toValue "button") ! dismissModalAttribute ! ariaHidden (toValue "true")