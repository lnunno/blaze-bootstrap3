{-# LANGUAGE OverloadedStrings #-}
module Templates where

    import Text.Blaze.Html5
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import CDN
    import Data.Monoid
    import Components
    import Models

    -- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    mobileMeta = meta ! name "viewport" ! content "width=device-width, initial-scale=1.0"

    headImports n = H.head $ jquery >> css n >> bootstrapjs >> fontAwesome >> mobileMeta

    rawTemplate_ innerHtml n = docTypeHtml $ headImports n >> body innerHtml

    rawTemplate innerHtml = rawTemplate_ innerHtml 0

    -- Ratchet 
    ratchetTemplate :: RatchetType -> Html -> Html
    ratchetTemplate rtchType innerHtml = 
        let
            cssLink 
                | rtchType == Android = ratchetAndroidCSS
                | rtchType == IOS     = ratchetiOSCSS
                | otherwise           = ratchetCSS
            rtchCSS = link ! rel stylesheetVal ! href cssLink
            rtchImports = mconcat [rtchCSS,ratchetJS]
            rtchHead = H.head $ rtchImports

        in
            docTypeHtml $ rtchHead >> body innerHtml




