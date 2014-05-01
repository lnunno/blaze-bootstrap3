{-# LANGUAGE OverloadedStrings #-}
module Ratchet where
    {-
    A mobile-first front-end HTML5 library.
    http://goratchet.com/
    -}
    import Text.Blaze.Html5 hiding (head,map)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H hiding (head,map)
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Models
    import Utils

    titleBar :: Html -> Html
    titleBar innerHtml = header innerHtml ! class_ (toValue $ subStyleclasses "bar" ["nav"])

    tabBar :: Html -> Html
    tabBar innerHtml = nav innerHtml ! class_ (toValue $ subStyleclasses "bar" ["tab"])

    tabItem :: Html -> AttributeValue -> Html
    tabItem innerHtml linkDest = a innerHtml ! class_ "tab-item" ! href linkDest