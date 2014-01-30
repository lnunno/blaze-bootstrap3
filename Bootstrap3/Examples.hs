module Examples where

    import Text.Blaze.Html5 hiding (nav)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import Utils
    import Components
    import Grid
    import Templates
    import Models

    ex1 = 
        let
            n = nav [a (toHtml "Foo") ! href (toValue "#"), a (toHtml "Bar") ! href (toValue "#")] Pills 
            jc = (h1 (toHtml "This is the jumbotron heading!") >> p (toHtml "This is the jumbotron body. There could be some additional text here. Notice how the heading and body are within a container.") >> bootstrapButton Primary (toHtml "Button"))
            j = jumbotron (container jc)
            b = h1 (toHtml "Container heading") >> p (toHtml "This should be in a container.")
            als = concatHtml [alert (toHtml (show t)) t | t <- [Success .. Danger] ]
            btnExpl = h2 (toHtml "These are the button types from Large to ExtraSmall")
            btns = btnExpl >> (concatHtml . toHtmlRows) [concatHtml [bootstrapButton_ t (toHtml (show t)) size | t <- [Default .. Link]] | size <- [Large .. ExtraSmall]]
            innerHtml = (n >> j >> (container (b >> als >> btns)))
        in 
            rawTemplate_ innerHtml 0

    main = do
        saveHtmlFile "examples/ex1.html" ex1