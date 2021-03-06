module Examples where

    import Text.Blaze.Html5 hiding (nav,map,progress)
    import Text.Blaze.Html5.Attributes hiding (content)
    import Text.Blaze.Html.Renderer.Pretty
    import Data.Monoid
    import Utils
    import Components
    import Grid
    import Templates
    import Models
    import CDN
    import Javascript
    import Ratchet

    {-
    This example is pretty messy, but you should be able to get the idea. Should delegate some of the building of the inner html components to utility functions.
    -}
    ex1InnerHtml = innerHtml 
        where
            n = nav [a (toHtml "Foo") ! href (toValue "#"), a (toHtml "Bar") ! href (toValue "#")] Pills 
            jc = (h1 (toHtml "This is the jumbotron heading!") >> p (toHtml "This is the jumbotron body. There could be some additional text here. Notice how the heading and body are within a container.") >> bootstrapButton Primary (toHtml "Button"))
            j = jumbotron (container jc)
            b = h1 (toHtml "Container heading") >> p (toHtml "This should be in a container.")
            als = concatHtml [alert (toHtml (show t)) t | t <- [Success .. Danger] ]
            btnExpl = h2 (toHtml "These are the button types from Large to ExtraSmall")
            btns = btnExpl >> (concatHtml . toHtmlRows) [concatHtml [bootstrapButton_ t (toHtml (show t)) size | t <- [Default .. Link]] | size <- [Large .. ExtraSmall]]
            innerHtml = (n >> j >> (container (b >> als >> btns)))
    
    ex1 = rawTemplate_ ex1InnerHtml 0

    toLink text path = a (toHtml text) ! href (toValue path)
    
    stringLsAsHtml :: [String] -> [Html]
    stringLsAsHtml strLs = map toHtml strLs

    latinStrings = ["Cras justo odio", "Dapibus ac facilisis in","Morbi leo risus","Porta ac consectetur a","Vestibulum at eros"]

    latinHtmlLs = stringLsAsHtml latinStrings

    {-
    Generate a bunch of components found in the Components module. The documentation for this corresponds to Bootstrap 3/Components.
    -}
    componentExample = 
        let
            btns = mconcat [bootstrapButton infoType h | infoType <- [Default .. Link], h <- (take 2 latinHtmlLs) ]
            bs = [bootstrapButton infoType h | (infoType,h) <- (zip [Default .. Link] latinHtmlLs)]
            bg = buttonGroup bs
            bars = mconcat $ map (\pb -> mconcat [progress pb [],progress pb ["striped"],progress pb ["striped","active"]]) $ [progressBar noHtml infoType width | infoType <- [Primary .. Danger], width <- [25,100]]
            lsGrp = listGroup latinHtmlLs
            pgr = pager [toLink "Previous" "#", toLink "Next" "#"]
            pgs = pagination $ [toLink "<<" "#"] ++ [toLink (show i) "#" | i <- [1..5]] ++ [toLink ">>" "#"]
            bcumbs = breadcrumbs [toLink "Foo" "#", toLink "Bar" "#", toLink "Baz" "#"]
            pnls = mconcat [panel (toHtml "This is a heading") (toHtml "This is the body") noHtml (toHtml "This is the footer") infoType | infoType <- [Default .. Danger]] 
            -- Wrap the html in a container.
            allHtml = container $ mconcat [btns,bg,bars,lsGrp,pnls,pgs,pgr,bcumbs]

        in
            allHtml

    simpleModal = modal (h4 (toHtml "Modal heading")) (p (toHtml "Modal body")) footerBtns
        where
            footerBtns = mconcat [bootstrapButton Default (toHtml "Close"), bootstrapButton Primary (toHtml "Save Changes")]

    mtgImages = ["http://media.wizards.com/images/magic/daily/wallpapers/Wallpapper_JOU_PW01_Miller_1920x1080.jpg","http://media.wizards.com/images/magic/daily/wallpapers/WeightoftheUnderworld_BNG_1920x1080_Wallpaper.jpg","http://media.wizards.com/images/magic/daily/wallpapers/Sunbond_BNG_1920x1080_Wallpaper.jpg"]

    mtgImagesMobile = [
        "http://media.wizards.com/images/magic/daily/wallpapers/Wallpaper_JOU_05_Barger_iPhone.jpg",
        "http://media.wizards.com/images/magic/daily/wallpapers/Wallpaper_KeyArt_JOU_iPhone.jpg",
        "http://media.wizards.com/images/magic/daily/wallpapers/Wallpapper_JOU_PW01_Miller_iPhone.jpg"
        ]

    simpleCarousel = carousel "myCarousel" mtgImages

    {-
    Use all available bootswatch themes with the given inner Html content.
    -}
    allBootswatchThemes :: Html -> [Html]
    allBootswatchThemes innerHtml = [rawTemplate_ innerHtml i | i <-[0..(length cssLinks)-1]]

    saveAsAllBootswatchThemes rootDir name innerHtml = sequence_ [saveHtmlFile (rootDir++"/"++(name ++ (show i))++".html") h | (i,h) <- (zip [0..(length cssLinks)-1] (allBootswatchThemes innerHtml))]


    -- Ratchet
    allRatchetPlatforms :: Html -> [Html]
    allRatchetPlatforms innerHtml = [ratchetTemplate platform innerHtml | platform <- [Android .. Standard]]

    saveAllRatchetPlatforms rootDir name innerHtml = sequence_ [saveHtmlFile (rootDir++"/"++(name ++ "-"++(show platform))++".html") h | (platform,h) <- (zip [Android .. Standard] (allRatchetPlatforms innerHtml))]

    basicRatchet = innerHtml
        where
            topNav = tabBar $ mconcat [
                                tabItem (ratchicon iconName >> (tabLabel (toHtml name))) (toValue "#")
                                | (iconName,name) <- zip 
                                                    ["home","person","star-filled","search","gear"]
                                                    ["Home","Profile","Favorites","Search","Settings"]
                              ]
            tvi1 = mconcat [
                        if t == "Divider"
                            then
                                tableViewDivider (toHtml t)
                            else
                                tableViewCell (toHtml t >> toggle True)  | t <- ["Item 1", "Divider", "Item 2", "Item 3", "Divider", "Item 4"]
                        ]
            tbView = h2 (toHtml "Table Views") >> tableView tvi1
            blockBtns = mconcat [
                    ratchetButton [it,Block] (toHtml (show it)) | it <- ratchetInfoTypes
                    ] >> mconcat [
                    ratchetButton [it,Block,Outlined] (toHtml (show it)) | it <- ratchetInfoTypes
                    ]
            btns = h2 (toHtml "Buttons") >> mconcat [
                    bootstrapButton_ infoType (toHtml (show infoType)) Normal 
                    | infoType <- ratchetInfoTypes
                    ] >> blockBtns
            ctnt = content $ mconcat [
                    tbView,
                    btns
                    ]
            innerHtml = mconcat[
                    topNav,
                    ctnt
                    ]

    sliderEx = ratchetTemplate Standard (easySlider (map toValue mtgImagesMobile)) 

    generateRatchetExs :: IO ()
    generateRatchetExs = do
        saveAllRatchetPlatforms "examples/ratchet" "basic" basicRatchet
        saveHtmlFile "examples/ratchet/sliderEx.html" sliderEx

    main = do
        saveHtmlFile "examples/ex1.html" ex1
        saveAsAllBootswatchThemes "examples/ex1s" "ex" ex1InnerHtml
        saveHtmlFile "examples/components.html" (rawTemplate_ componentExample 0)
        saveAsAllBootswatchThemes "examples/components" "components" componentExample
        saveHtmlFile "examples/modal.html" (rawTemplate_ simpleModal 0)
        saveHtmlFile "examples/carousel.html" (rawTemplate_ simpleCarousel 0)
        

    
