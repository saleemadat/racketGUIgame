#lang racket/gui


 (require 2htdp/image)

;send myframe show #t

;;rock paper scissors

;;rock rock = tie
;;scissor scissors = tie
;;paper paper = tie
;;rock paper =  paper win
;;rock scissor = rock win
;;paper scissor = scissors win




            

(text/font "Welcome to Rock Paper Scissors" 18 "blue"
             #f 'modern 'italic 'normal #f)

(define myframe (new frame%
                     [label "ROCKPAPERSCISSORS"]
                     [width 500] [height 500]
                     [stretchable-width 5]))

;(new canvas% [parent myframe]
 ;    [paint-callback (λ (canvas dc)
  ;                     (send dc set-scale 2 2)
   ;                    (send dc set-text-foreground "Red")
    ;                   ;(send canvas set-canvas-background "Blue")
     ;                  (send dc draw-text "Welcome to Rock Paper scissors" 0 10))])
                    
                    
                     

(define myframe1 (new frame%
                     [label "Winning"]
                     [width 300] [height 200]))

(define msg0 (new message% [parent myframe]
                  [label "





Please input ONE option using your Keyboard for each player
and then press Confirm

"]))




(define msg (new message% [parent myframe]
                          [label " Player 1 - Q - Rock
                  W - Paper
                  E - Scissors"]))

(define msg2 (new message% [parent myframe]
                  [label " Player 2 - I - Rock
                  O - Paper
                  P - Scissors"]))
                                 


(define msg1 (new message% [parent myframe1]
                  [label "No Input for Player 1 and Player 2"]))

(new button% [parent myframe1]
     (label "Exit")
     (callback (λ (o e) (send myframe1 show #f))))
                 

(new button% [parent myframe]
     [label "Confirm Choices"]
(callback (λ (o e) (send myframe1 show #t)
                   (send myframe show #f)
            (rockpaperscissorsgame p1 p2))))



(define panel (new vertical-panel% [parent myframe]))


     
  
(define panel1 (new horizontal-panel% [parent myframe1]))

(define p1 '())
  (define p2 '())

(define rockpaperscissorsgame (λ (x y)
                                (cond
                                  ((empty? (and x y)) (send msg1 set-label "No Input for Player 1 and Player 2"))
                                  ((empty? x) (send msg1 set-label "No Input for Player 1, Player 2 wins"))
                                  ((empty? y) (send msg1 set-label "No Input for Player 2, Player 1 wins"))
                                 
                                  ((and (symbol=?(first x) 'r)
                                        (symbol=?(first y) 'p))
                                  
                                   (send msg1 set-label "Congratulation Player 2 wins"))
                                  
                                  ((and (symbol=? (first x) 'p)
                                        (symbol=? (first y) 'r))
                                   
                                   (send msg1 set-label "Congratulation Player 1 wins"))
                                  
                                  ((and (symbol=? (first x) 'p)
                                        (symbol=? (first y) 'p))
                                 
                                   (send msg1 set-label "Draw"))
                                  
                                  ((and (symbol=? (first x) 'r)
                                        (symbol=? (first y) 'r))
                               
                                   (send msg1 set-label "Draw"))

                                  ((and (symbol=? (first x) 'r)
                                        (symbol=? (first y) 's))
                       
                                   (send msg1 set-label "Congratulation Player 1 wins"))

                                  ((and (symbol=? (first x) 's)
                                        (symbol=? (first y) 'r))
                                   
                                   (send msg1 set-label "Congratulation Player 2 wins"))

                                  ((and (symbol=? (first x) 's)
                                        (symbol=? (first y) 's))
                        
                                   (send msg1 set-label "Draw"))
                                  
                                  ((and (symbol=? (first x) 's)
                                        (symbol=? (first y) 'p))
                                 
                                   (send msg1 set-label "Congratulation Player 1 wins"))
                                  
                                  ((and (symbol=? (first x) 'p)
                                        (symbol=? (first y) 's))
                                  
                                   (send msg1 set-label "Player 2 wins"))
                                  (#t (send msg1 set-label "Invalid Input")))))

(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      ;; Enter your code here to do something with the event
      ;; For instance:
      (displayln (send event get-key-code))
      (cond [ (equal? (send event get-key-code) '#\q)
              (set! p1 '(r))]
            
            [ (equal? (send event get-key-code) '#\w)
              (set! p1 '(p))]
            
            [ (equal? (send event get-key-code)'#\e)
              (set! p1 '(s))]
            
            [ (equal? (send event get-key-code)'#\i)
              (set! p2 '(r))]
            
            [ (equal? (send event get-key-code)'#\o)
              (set! p2 '(p))]
            
            [ (equal? (send event get-key-code)'#\p)
              (set! p2 '(s))]))
    

    
            
    

 
            
    

    ; Call the superclass init, passing on all init args
    (super-new)))

 
; Make a canvas that handles events in the frame
(new my-canvas% [parent myframe])
(send myframe show #t)


(rockpaperscissorsgame p1 p2)



           
            
               
             









   
    







  
                                  
                                        
                                   