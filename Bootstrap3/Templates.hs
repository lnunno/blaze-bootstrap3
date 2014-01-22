module Templates where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import CDN
    import CSS
    import Components

    headImports n = H.head $ jquery >> css n >> bootstrapjs >> fontAwesome

    rawTemplate_ innerHtml n = docTypeHtml $ headImports n >> body innerHtml

    rawTemplate innerHtml = rawTemplate_ innerHtml 0


