(define (problem close-door) 
    (:domain opportunitynew)
    (:objects 
        door
        hand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand hand)
        (is-door door)
        (is-obj door)
        (is-open door)
        (is-unlock door)
        (not(is-holding hand door))
        (is-free hand)
    )

    (:goal (and
        ;todo: put the goal condition here
        
        (not(is-unlock door))
        (not(is-open door))
        (not(is-holding hand door))
        (is-free hand)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)