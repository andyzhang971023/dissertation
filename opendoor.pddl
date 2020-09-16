(define (problem open-door) 
    (:domain opportunitynew)
    (:objects 
        door1
        lefthand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand lefthand)
        (is-door door1)
        (is-obj door1)
        (not(is-unlock door1))
        (not(is-open door1))
        (not(is-holding lefthand door1))
        (is-free lefthand)
    )

    (:goal (and
        ;todo: put the goal condition here
        (is-open door1)
        (not(is-holding lefthand door1))
        (is-free lefthand)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)