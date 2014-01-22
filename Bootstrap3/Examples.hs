module Examples where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import CSS
    import Utils
    import Components
    import Templates
    import Models

    main = do
        let btn = bootstrapButton_ Warning (toHtml "Button") Large
        saveHtmlFile "examples/rawTemplate.html" (rawTemplate btn >> glyphicon "adjust")



    