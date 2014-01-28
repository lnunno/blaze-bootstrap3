module Components where

    import Text.Blaze.Html5 hiding (head,map)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H hiding (head,map)
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

    badge innerHtml = H.span innerHtml ! class_ (toValue "badge")

    jumbotron innerHtml = H.div innerHtml ! class_ (toValue "jumbotron")

    pageHeader innerHtml = H.div innerHtml ! class_ (toValue "page-header")

    labelBootstrap :: Html -> InfoType -> Html
    labelBootstrap innerHtml infoType = H.span innerHtml ! class_ (toValue (subStyleclasses "label" [show infoType]))

    alert :: Html -> InfoType -> Html
    alert innerHtml infoType = H.div innerHtml ! class_ (toValue (subStyleclasses "alert" [show infoType])) 

    progress :: Html -> [String] -> Html
    progress innerHtml modifiers = H.div innerHtml ! class_ (toValue (subStyleclasses "progress" modifiers))

    progressBar :: Html -> InfoType -> Int -> Html
    progressBar innerHtml infoType width = H.div innerHtml ! styleClass ! pRole ! s
        where
            styleClass = class_ (toValue (subStyleclasses "progress-bar" [show infoType]))
            pRole = role (toValue "progressbar")
            s = A.style (toValue ("width: " ++ (show width) ++ "%"))

    {-
    Wraps the given list of HTML elements in an unordered list and makes the list items part of the ul group.
    -}
    listGroup :: [Html] -> Html
    listGroup items = 
        let 
            lis = concatHtml $ map (\a -> a ! class_ (toValue "list-group-item")) $ toHtmlLs items
            u = ul lis ! class_ (toValue "list-group")
        in
            u

    panel :: Html -> Html -> Html -> Html -> InfoType -> Html
    panel headingHtml bodyHtml bodyAddendumHtml footerHtml infoType = H.div h ! class_ (toValue (subStyleclasses "panel" [show infoType]))
        where
            header = H.div headingHtml ! class_ (toValue "panel-heading")
            body = H.div bodyHtml ! class_ (toValue "panel-body")
            footer = H.div footerHtml ! class_ (toValue "panel-footer")
            h = header >> body >> bodyAddendumHtml >> footer

    well :: Html -> Size -> Html
    well html size = H.div html ! class_ (toValue (subStyleclasses "well" [show size]))

