#lang racket/base

(require twitch-bot
         unreal)

;Switch to fish tank Build
(bootstrap-unreal-js  
 "SuperMarketBuild\\WindowsNoEditor\\FishTanks\\Content\\Scripts")

(start-unreal 
 "SuperMarketBuild\\WindowsNoEditor\\FishTanks.exe")

(define (prep-for-chat-output v)
  (if (unreal-actor? v)
      "[Unreal Actor]" ;Snip it.  Too long
      v))


(define e (make-safe-evaluator 'fish-tank/chat))
;(dynamic-require 'fish-tank/chat #f)


(start-twitch-bot
 (handle-twitch-message
  (lambda (expr)
    (prep-for-chat-output
     ((use-evaluator e) expr)))))
