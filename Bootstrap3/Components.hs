module Components where

    import Text.Blaze.Html5 hiding (head)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H hiding (head)
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Models
    import Utils

    type IconName = String
    type Buttons = [Html]
    type ButtonGroup = Html
    type ButtonToolbar = Html
    type HtmlLs = [Html]

    glyphicon :: IconName -> Html
    glyphicon iconName = H.span noHtml ! class_ (toValue strVal)
        where
            strVal = "glyphicon glyphicon-" ++ iconName

    dropdown :: [Html] -> Html
    dropdown htmlLs = ul (concatHtml htmlLs) ! class_ (toValue "dropdown-menu") ! role (toValue "menu")

    -- <li role="presentation" class="dropdown-header">Dropdown header</li>
    dropdownHeader innerHtml = li innerHtml ! role (toValue "presentation") ! class_ (toValue "dropdown-header")

    -- <li role="presentation" class="divider"></li>
    dropdownDivider = li noHtml ! role (toValue "presentation") ! class_ (toValue "dropdown-header")

    buttonGroup :: Buttons -> ButtonGroup
    buttonGroup btns = buttonGroup_ btns Normal

    buttonGroup_ :: Buttons -> Size -> ButtonGroup
    buttonGroup_ btns size = H.div btnHtml ! class_ classVal
        where
            btnHtml = concatHtml btns
            bg = "btn-group"
            classStr 
                | size == Normal = bg
                | otherwise = bg ++ " " ++ bg ++ "-" ++ (show size)
            classVal = toValue classStr

    buttonToolbar :: ButtonGroup -> ButtonToolbar
    buttonToolbar btnGroup = buttonToolbar' [btnGroup] 

    buttonToolbar' :: [ButtonGroup] -> ButtonToolbar
    buttonToolbar' groupLs = H.div (concatHtml groupLs) ! class_ (toValue "btn-toolbar") ! role (toValue "toolbar")


    nav htmlLs navType = nav_ htmlLs navType None

    nav_ :: HtmlLs -> NavType -> NavModifier -> Html
    nav_ htmlLs navType modifier = ul (concatHtml htmlLs) ! class_ classVal
        where
            baseType = "nav nav-" ++ (show navType)
            classStr 
                | modifier == None = baseType
                | otherwise = baseType ++ " nav-" ++ (show modifier)
            classVal = toValue classStr

    breadcrumbs :: HtmlLs -> Html
    breadcrumbs htmlLs = ol (concatHtml htmlLs) ! class_ (toValue "breadcrumb")

    pagination htmlLs = pagination_ htmlLs Normal

    pagination_ :: HtmlLs -> Size -> Html
    pagination_ htmlLs size = ul (concatHtml htmlLs) ! class_ classVal 
        where
            pg = "pagination"
            classStr
                | size == Normal = pg
                | otherwise = pg ++ " " ++ pg ++ "-" ++ (show size)
            classVal = toValue classStr

    pager ls = ul (concatHtml updatedLs) ! class_ (toValue "pager") 
        where 
            liLs = toHtmlLs ls
            a = head liLs
            z = last liLs
            updatedLs = (a ! class_ (toValue "previous"):((init (tail liLs))++[z ! class_ (toValue "next")]))

