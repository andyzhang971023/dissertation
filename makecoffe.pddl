(define (problem moveoutmilk) 
    (:domain opportunitynew)
    (:objects 
        fridge
        milk
        sugar
        cup
        spoon
        lefthand
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand lefthand)
        (is-spoon spoon)
        (is-obj milk)
        (is-obj fridge)
        (is-obj cup)
        (is-obj sugar)
        (is-obj spoon)
        (not(is-door fridge))
        (not(is-open fridge))
        (is-open cup)
        (not(is-holding lefthand milk))
        (not(is-holding lefthand fridge))
        (not(is-holding lefthand cup))
        (not(is-holding lefthand spoon))
        (not(is-holding lefthand sugar))
        (is-in milk fridge)
        (is-in sugar fridge)
        (not(is-in-air milk))
        (not(is-in-air sugar))
        (is-free lefthand)
    )

    (:goal (and
        ;todo: put the goal condition here
        (is-stired cup milk sugar)
        (is-free lefthand)
        (not(is-open fridge))
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)