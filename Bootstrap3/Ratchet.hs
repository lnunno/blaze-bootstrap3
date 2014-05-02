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

    content :: Html -> Html
    content innerHtml = H.div innerHtml ! class_ "content"

    contentPadded :: Html -> Html
    contentPadded innerHtml = H.div innerHtml ! class_ "content-padded"

    card :: Html -> Html
    card innerHtml = H.div innerHtml ! class_ "card"

    ratchicon :: String -> Html
    ratchicon name = H.span noHtml ! class_ (toValue $ subStyleclasses "icon" [name])

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

    toggle :: Bool -> Html
    toggle isOn = H.div handle ! class_ classVal
        where
            classVal = if isOn then "toggle active" else "toggle"
            handle = H.div noHtml ! class_ "toggle-handle"  

    ratchetButton :: [InfoType] -> Html -> Html
    ratchetButton infLs innerHtml = button innerHtml ! class_ (toValue $ subStyleclasses "btn" (map show infLs))

    slider :: Html -> Html
    slider innerHtml = H.div innerHtml ! class_ "slider"

    slideGroup :: Html -> Html
    slideGroup innerHtml = H.div innerHtml ! class_ "slide-group"

    slide :: Html -> Html
    slide innerHtml = H.div innerHtml ! class_ "slide"

    slideText :: Html -> Html
    slideText innerHtml = H.span innerHtml ! class_ "slide-text"
    
    easySlider :: [AttributeValue] -> Html
    easySlider links = 
        let
            ims = [img ! src lnk | lnk <- links]
            slds = mconcat $ toHtmlLs' ims (\h -> slide h)
            grp = slideGroup slds
        in
            slider grp
