(define (problem sandwich) 
    (:domain opportunitynew)
    (:objects 
        hand
        salami
        cheese
        bread
        knife-salami
        knife-cheese
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (is-hand hand)
        (is-obj salami)
        (is-obj cheese)
        (is-obj bread)
        (is-obj knife-salami)
        (is-obj knife-cheese)
        (is-salami salami)
        (is-cheese cheese)
        (is-in-air salami)
        (is-in-air cheese)
        (is-bread bread)
        (is-knife-salami knife-salami)
        (is-knife-cheese knife-cheese)
        (not(is-spread cheese))
        (not(is-cut salami))
        (is-free hand)
        (not(is-in salami bread))
        (not(is-in cheese bread))
        (is-open bread)
    )

    (:goal (and
        ;todo: put the goal condition here
        (is-eated bread)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)