(define (problem open-draw) 
    (:domain opportunitynew)
    (:objects 
        draw
        hand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand hand)
        (is-obj draw)
        (not(is-open draw))
        (not(is-holding hand draw))
        (is-free hand)
    )

    (:goal (and
        ;todo: put the goal condition here
        (is-open draw)
        (not(is-holding hand draw))
        (is-free hand)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)