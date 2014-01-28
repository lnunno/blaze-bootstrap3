module Examples where

    import Text.Blaze.Html5 hiding (nav)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html.Renderer.Pretty
    import CSS
    import Utils
    import Components
    import Templates
    import Models

    ex1 = 
        let
            n = nav [a (toHtml "Foo")] Pills 
            j = jumbotron (h1 (toHtml "This is the jumbotron heading!") >> p (toHtml "This is the jumbotron body. There could be some additional text here.") >> bootstrapButton Primary (toHtml "Button"))
            innerHtml = (n >> j)
        in 
            rawTemplate innerHtml

    main = do
        saveHtmlFile "examples/ex1.html" ex1