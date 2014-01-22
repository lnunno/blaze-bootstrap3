module Templates where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import CDN
    import CSS
    import Components

    -- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    mobileMeta = meta ! name (toValue "viewport") ! content (toValue "width=device-width, initial-scale=1.0")

    headImports n = H.head $ jquery >> css n >> bootstrapjs >> fontAwesome >> mobileMeta

    rawTemplate_ innerHtml n = docTypeHtml $ headImports n >> body innerHtml

    rawTemplate innerHtml = rawTemplate_ innerHtml 0


