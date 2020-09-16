(define (problem take-rest) 
    (:domain opportunitynew)
    (:objects 
        lazychair
        hand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand hand)
        (is-obj lazychair)
        (not(is-holding hand lazychair))
        (is-free hand)
    )

    (:goal (and
        ;todo: put the goal condition here
        (is-holding hand lazychair)
        (not(is-free hand))
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)