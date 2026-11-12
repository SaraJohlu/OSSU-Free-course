;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname backup) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; module 1a, making an image

(require 2htdp/image)

(define WIDTH 400)
(define HEIGHT 300)

;;Background 
(define (background-with-border width height fill-color border-color)
  (overlay (rectangle width height "outline" border-color)
          (rectangle width height "solid" fill-color)))

;; Snow ground
(define snow (rectangle 399 100 "solid" "snow"))

;;Door wreath
(define door-wreath
  (overlay
   (circle 14 "solid" "goldenrod")
   
   (place-images
    (list
     (circle 4 "solid" "dark red")
     (circle 4 "solid" "dark red")
     (circle 4 "solid" "dark red")
     (circle 4 "solid" "dark red")
     (circle 4 "solid" "dark red"))
    (list
     (make-posn 20 5)
     (make-posn 35 15)
     (make-posn 31 31)
     (make-posn 9 31)
     (make-posn 5 15))
    (circle 20 "solid" "dark olive green"))))

;;Door with small window and door knob.
(define (house-door width height door-color door-knob-color)
           (place-image
            (circle 5 "solid" door-knob-color)
            (* width 0.15) (* height 0.55)
            ;; Making the door knob dynamic, it will always fit the door regarding size. The procentage is based on aesthetic choices. Chosing 1 instead of 0.15 will make the doorknob
            ;; land on the rightside of the door precisely on the line. It's the same for the height, 0.55 makes it land almost near center on the y-axis. 
            
            
            (place-image
             door-wreath
             (/ width 2) (* height 0.2)

             (rectangle width height "solid" door-color))))
             ;; It's the same regarding the window. 

                 
;; The window with bars.
(define (window-with-bars width height window-color bar-size bar-color window-outline)
  (overlay
   (rectangle width height "outline" window-outline)
   (rectangle bar-size height "solid" bar-color)
   (rectangle width bar-size "solid" bar-color)
   (rectangle width height "solid" window-color)))

;;House image
(define complete-house 
  (place-image
   (house-door 80 130 "goldenrod" "black")
   70 150

  (place-image
   (window-with-bars 60 70 "yellow" 5 "white" "dark red")
   160 100

   (rectangle 210 200 "solid" "firebrick"))))

(define spruce-tree-small
  (overlay/offset
   (overlay/align "center" "top"
                  (triangle 20 "solid" "snow")
                  (triangle 45 "solid" "forest green"))
   0 45
   (overlay/offset 
    (triangle 60 "solid" "forest green")
    0 35
    (overlay/offset
     (triangle 80 "solid" "forest green")
     0 40
    (rectangle 20 20 "solid" "dark brown")))))

(define spruce-tree-large
  (overlay/offset
   (overlay/align "center" "top"
                  (triangle 20 "solid" "snow")
                  (triangle 55 "solid" "dark green"))
   0 45
   (overlay/offset 
    (triangle 70 "solid" "dark green")
    0 35
    (overlay/offset
     (triangle 90 "solid" "dark green")
     0 40
    (rectangle 20 20 "solid" "dark brown")))))


(define snow-image
  (overlay/align "center" "bottom"
                 snow
  (place-image 
               spruce-tree-small 
               280 150
  (place-image 
               spruce-tree-large 
               320 140
  (place-images
    (list
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow")
     (circle 3 "solid" "snow"))
    (list
     (make-posn 5 5)
     (make-posn 100 50)
     (make-posn 10 200)
     (make-posn 50 31)
     (make-posn 350 50)
     (make-posn 266 90)
     (make-posn 380 288)
     (make-posn 220 160)
     (make-posn 90 55))
    
  (overlay/align "left" "top" 
                 complete-house
  
  (background-with-border 400 300 "midnightblue" "dark orange")))))))
snow-image



