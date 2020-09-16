(define (problem get-milk) 
    (:domain opportunitynew)
    (:objects 
        hand
        milk
        fridge
    )
    (:init
        (is-hand hand)
        (is-obj fridge)
        (is-obj milk)
        (not(is-open fridge))
        (not(is-holding hand fridge))
        (not(is-holding hand milk))
        (is-in milk fridge)
        (not(is-in-air milk))
        (is-free hand)
    )
    (:goal (and
        (is-in-air milk)
        (not(is-in milk fridge))
        (is-free hand)
    ))
)