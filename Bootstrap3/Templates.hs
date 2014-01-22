module Templates where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import CDN

    rawTemplate = docTypeHtml $ (css 0)