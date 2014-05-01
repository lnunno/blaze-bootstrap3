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
    import Data.Monoid
    import Models
    import Utils

    titleBar :: Html -> Html
    titleBar innerHtml = header innerHtml ! class_ (toValue $ subStyleclasses "bar" ["nav"])

    tabBar :: Html -> Html
    tabBar innerHtml = nav innerHtml ! class_ (toValue $ subStyleclasses "bar" ["tab"])

    tabItem :: Html -> AttributeValue -> Html
    tabItem innerHtml linkDest = a innerHtml ! class_ "tab-item" ! href linkDest

    tabLabel :: Html -> Html
    tabLabel innerHtml = H.span innerHtml ! class_ "tab-label"

    tableView :: Html -> Html
    tableView innerHtml = ul innerHtml ! class_ "table-view"

    tableViewCell :: Html -> Html
    tableViewCell innerHtml = li innerHtml ! class_ "table-view-cell"

    tableViewDivider :: Html -> Html
    tableViewDivider innerHtml = li innerHtml ! class_ "table-view-divider"