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
    metaTags :: Html
    metaTags = mconcat [
        meta ! name "viewport" ! content "initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui",
        meta ! name "apple-mobile-web-app-capable" ! content "yes",
        meta ! name "apple-mobile-web-app-status-bar-style" ! content "black"
                ]

    ratchetTemplate :: RatchetType -> Html -> Html
    ratchetTemplate rtchType innerHtml = 
        let
            addCSS 
                | rtchType == Android = link ! rel stylesheetVal ! href ratchetAndroidCSS
                | rtchType == IOS     = link ! rel stylesheetVal ! href ratchetiOSCSS
                | otherwise           = noHtml
            rtchCSS = mconcat [
                        -- Always add the base CSS.
                        link ! rel stylesheetVal ! href ratchetCSS,
                        -- Platform specific CSS.
                        addCSS
                      ]
            rtchImports = mconcat [metaTags,rtchCSS,ratchetJS]
            rtchHead = H.head $ rtchImports
        in
            docTypeHtml $ rtchHead >> body innerHtml




