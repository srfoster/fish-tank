#lang at-exp racket

(provide fish)

(require unreal)

;For testing
(define e (compose
           unreal-eval-js
           unreal-value))

(define (fish [color #f])
  @unreal-value{
 var fs = GWorld.GetAllActorsOfClass(Root.ResolveClass('FishSpawner')).OutActors[0]
  
 return fs.AddFish("red");
 })