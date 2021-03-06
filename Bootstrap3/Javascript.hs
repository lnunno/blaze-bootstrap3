module Javascript where

    import Text.Blaze.Html5 hiding (head,map)
    import Text.Blaze.Html5.Attributes
    import Text.Blaze.Html5 as H hiding (head,map)
    import Text.Blaze.Html5.Attributes as A
    import Text.Blaze.Html.Renderer.Pretty
    import Data.Monoid
    import Models
    import Utils
    import Components

    modal headerHtml bodyHtml footerHtml =
        let  
            header = H.div (closeButton >> headerHtml) ! class_ (toValue "modal-header")
            body   = H.div bodyHtml   ! class_ (toValue "modal-body")
            footer = H.div footerHtml ! class_ (toValue "modal-footer")
            content = H.div (header >> body >> footer) ! class_ (toValue "modal-content")
            dialog  = H.div content   ! class_ (toValue "modal-dialog") 
        in 
            dialog

    carousel :: String -> [String] -> Html
    carousel carouselId imgLinks = 
        let 
            carouselLink = (toValue ("#" ++ carouselId))
            leftControl = a (glyphicon "chevron-left") ! class_ (toValue "left carousel-control") ! href carouselLink ! dataSlide (toValue "prev")
            rightControl = a (glyphicon "chevron-right") ! class_ (toValue "right carousel-control") ! href carouselLink ! dataSlide (toValue "next")
            controls = leftControl >> rightControl
            lis      = mconcat [li noHtml ! dataTarget carouselLink ! dataSlideTo (toValue (show i)) ! if i == 0 then class_ (toValue "active") else class_ (toValue "")| i <- [0 .. (length imgLinks)-1]]
            indicators = ol lis ! class_ (toValue "carousel-indicators")
            items = mconcat [H.div (img ! src (toValue imLink)) ! if imLink == (head imgLinks) then class_ (toValue "item active") else class_ (toValue "item")| imLink <- imgLinks]
            innerCarousel = H.div items ! class_ (toValue "carousel-inner")
        in
            H.div (indicators >> innerCarousel >> controls) ! A.id (toValue carouselId) ! class_ (toValue "carousel slide") ! dataRide (toValue "carousel")