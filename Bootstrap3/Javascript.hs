module Javascript where

    import Text.Blaze.Html5 hiding (head,map)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H hiding (head,map)
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Models
    import Utils

    modal headerHtml bodyHtml footerHtml =
        let  
            header = H.div (closeButton >> headerHtml) ! class_ (toValue "modal-header")
            body   = H.div bodyHtml   ! class_ (toValue "modal-body")
            footer = H.div footerHtml ! class_ (toValue "modal-footer")
            content = H.div (header >> body >> footer) ! class_ (toValue "modal-content")
            dialog  = H.div content   ! class_ (toValue "modal-dialog") 
        in 
            dialog