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

    bootstrapButton_ :: InfoType -> Html -> Size -> Html
    bootstrapButton_ infoType innerHtml size = button innerHtml ! class_ (toValue strVal)
        where
            strVal 
                | size == Normal = "btn btn-" ++ (show infoType)
                | otherwise = "btn btn-" ++ (show size) ++ " btn-" ++ (show infoType)

    {-
    Button with normal size.
    -}
    bootstrapButton infoType innerHtml = bootstrapButton_ infoType innerHtml Normal

    imageRounded    = img ! class_ (toValue "img-rounded")
    imageCircle     = img ! class_ (toValue "img-circle")
    imageThumbnail  = img ! class_ (toValue "img-thumbnail")

    {-
    Helper classes
    -}
    closeIcon = button (toHtml "&times;") ! type_ (toValue "button") ! class_ (toValue "close") ! ariaHidden (toValue "true")
    caret innerHtml = H.span innerHtml ! class_ (toValue "caret")

    container innerHtml = H.div innerHtml ! class_ (toValue "container")

    glyphicon :: IconName -> Html
    glyphicon iconName = H.span noHtml ! class_ (toValue strVal)
        where
            strVal = "glyphicon glyphicon-" ++ iconName

    fontAwesome_ :: IconName -> Int -> Bool -> Html
    fontAwesome_ iconName sizeIncrease isSpinning = H.i noHtml ! class_ (toValue (subStyleclasses "fa" subclasses))
        where
            sizeClass
                | sizeIncrease == 1 = "lg"  
                | sizeIncrease >  1 = (show sizeIncrease) ++ "x"
                | otherwise         = ""
            spinClass = if isSpinning then "" else "spin" 
            subclasses = iconName:spinClass:sizeClass:[]


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

    nav_ :: [Html] -> NavType -> NavModifier -> Html
    nav_ htmlLs navType modifier = ul (concatHtml (toHtmlLs htmlLs)) ! class_ classVal
        where
            baseType = "nav nav-" ++ (show navType)
            classStr 
                | modifier == None = baseType
                | otherwise = baseType ++ " nav-" ++ (show modifier)
            classVal = toValue classStr

    navbarDefault html = H.nav html ! class_ (toValue (subStyleclasses "navbar" ["default"])) ! role (toValue "navigation")

    navbarInverse html = H.nav html ! class_ (toValue (subStyleclasses "navbar" ["inverse"])) ! role (toValue "navigation")

    navbarFixedTop html = H.nav html ! class_ (toValue (subStyleclasses "navbar" ["default", "fixed-top"])) ! role (toValue "navigation")

    navbarFixedBottom html = H.nav html ! class_ (toValue (subStyleclasses "navbar" ["default", "fixed-bottom"])) ! role (toValue "navigation")

    navbarStaticTop html = H.nav html ! class_ (toValue (subStyleclasses "navbar" ["default", "static-top"])) ! role (toValue "navigation")

    navbarHeader html = H.div html ! class_ (toValue "navbar-header") 

    navbarBody html = H.div html ! class_ (toValue "navbar-collapse collapse")

    breadcrumbs :: [Html] -> Html
    breadcrumbs htmlLs = ol (concatHtml (toHtmlLs htmlLs)) ! class_ (toValue "breadcrumb")

    pagination htmlLs = pagination_ htmlLs Normal

    pagination_ :: [Html] -> Size -> Html
    pagination_ htmlLs size = ul (concatHtml (toHtmlLs htmlLs)) ! class_ classVal 
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

    bootstrapLabel :: Html -> InfoType -> Html
    bootstrapLabel innerHtml infoType = H.span innerHtml ! class_ (toValue (subStyleclasses "label" [show infoType]))

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

    pullLeft    = class_ (toValue "pull-left")
    pullRight   = class_ (toValue "pull-right")
    mediaObject = class_ (toValue "media-object")
    mediaBody html    = H.div html ! class_ (toValue "media-body")
    mediaHeading html = h4 html    ! class_ (toValue "media-heading")   
    media innerHtml   = H.div innerHtml ! class_ (toValue "media")


