module CSS where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
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

    bootstrapButton :: InfoType -> Html -> Html
    bootstrapButton infoType innerHtml = button innerHtml ! class_ (toValue strVal)
        where
            strVal = "btn btn-" ++ (show infoType)

    