(define 
    (domain opportunitynew)
    (:requirements :strips)
    ; (:types 
    ;     hands objects - object
    ;     doors container - objects
    ; )
    (:predicates 
        (is-obj ?obj)
        (is-hand ?hand)
        (is-door ?obj)
        (is-spoon ?spoon)
        (is-bread ?bread)
        (is-knife-cheese ?obj)
        (is-knife-salami ?obj)
        (is-salami ?obj)
        (is-cheese ?obj)

        (is-holding ?hand ?obj)
        (is-open ?obj)
        (is-unlock ?obj)
        (is-free ?hand)
        (is-in-air ?obj)
        (is-in ?obj1 ?obj2)
        (is-stired ?cup ?obj1 ?obj2)
        (is-eated ?bread)
        (is-spread ?obj)
        (is-cut ?obj)
        
    )

    (:action 1_unlock1
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)(is-door ?obj)
            (is-holding ?hand ?obj)
            (not(is-unlock ?obj))
        )
        :effect (and 
            (is-unlock ?obj)
        )
    )

    (:action 2_stir2
        :parameters (?cup ?obj1 ?obj2 ?spoon ?hand)
        :precondition (and 
            (is-obj ?cup)(is-obj ?obj1)(is-obj ?obj2)(is-obj ?spoon)(is-spoon ?spoon)(is-hand ?hand)
            (is-in ?obj1 ?cup)
            (is-in ?obj2 ?cup)
            (is-holding ?hand ?spoon)
        )
        :effect (and 
            (is-stired ?cup ?obj1 ?obj2)
        )
    )

    (:action 3_lock3
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)(is-door ?obj)
            (is-holding ?hand ?obj)
            (is-unlock ?obj)
            (not(is-open ?obj))
        )
        :effect (and 
            (not(is-unlock ?obj))
        )
    )

    (:action 4_close4
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)
            (is-holding ?hand ?obj)
            (is-open ?obj)
        )
        :effect (and 
            (not(is-open ?obj))
        )
    )

    (:action 5_reach5
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)
            (not(is-holding ?hand ?obj))
            (is-free ?hand)
        )
        :effect (and 
            (is-holding ?hand ?obj)
            (not(is-free ?hand))
        )
    )

    (:action 6_open_door6
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)(is-door ?obj)
            (is-holding ?hand ?obj)
            (not(is-open ?obj))
            (is-unlock ?obj)
        )
        :effect (and 
            (is-open ?obj)
        )
    )

    (:action 6_open_obj6
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)(not(is-door ?obj))
            (is-holding ?hand ?obj)
            (not(is-open ?obj))
        )
        :effect (and 
            (is-open ?obj)
        )
    )

    (:action 7_sip6
        :parameters ()
        :precondition (and )
        :effect (and )
    )

    (:action 8_clean6
        :parameters ()
        :precondition (and )
        :effect (and )
    )
    
    (:action 9_bite9
        :parameters (?hand ?bread ?obj1 ?obj2)
        :precondition (and 
            (is-hand ?hand)
            (is-obj ?bread)
            (is-cheese ?obj1)
            (is-salami ?obj2)
            (is-bread ?bread)
            (is-cut ?obj2)
            (is-spread ?obj1)
            (is-in ?obj1 ?bread)
            (is-in ?obj2 ?bread)
        )
        :effect (and 
            (is-eated ?bread)
        )
    )
    
    (:action 10_cut10
        :parameters (?hand ?obj ?obj2)
        :precondition (and 
            (is-obj ?obj)
            (is-salami ?obj)
            (is-hand ?hand)
            (is-knife-salami ?obj2)
            (is-holding ?hand ?obj2)
            (not(is-cut ?obj))
            (is-in-air ?obj)
        )
        :effect (and 
            (is-cut ?obj)
        )
    )
    
    (:action 11_spread11
        :parameters (?hand ?obj ?obj2)
        :precondition (and 
            (is-obj ?obj)
            (is-cheese ?obj)
            (is-hand ?hand)
            (is-knife-cheese ?obj2)
            (is-holding ?hand ?obj2)
            (not(is-spread ?obj))
            (is-in-air ?obj)
        )
        :effect (and 
            (is-spread ?obj)
        )
    )
    

    (:action 12_release12
        :parameters (?hand ?obj)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj)
            (is-holding ?hand ?obj)
            (not(is-free ?hand))
        )
        :effect (and 
            (not(is-holding ?hand ?obj))
            (is-free ?hand)
        )
    )

    (:action 13_move_obj_out13
        :parameters (?hand ?obj1 ?obj2)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj1)(is-obj ?obj2)
            (is-in ?obj1 ?obj2)
            (not(is-in-air ?obj1))
            (is-holding ?hand ?obj1)
            (is-open ?obj2)
        )
        :effect (and 
            (not(is-in ?obj1 ?obj2))
            (is-in-air ?obj1)
        )
    )

    (:action 13_move_obj_in13
        :parameters (?hand ?obj1 ?obj2)
        :precondition (and 
            (is-hand ?hand)(is-obj ?obj1)(is-obj ?obj2)
            (not(is-in ?obj1 ?obj2))
            (is-in-air ?obj1)
            (is-holding ?hand ?obj1)
            (is-open ?obj2)
        )
        :effect (and 
            (is-in ?obj1 ?obj2)
            (not(is-in-air ?obj1))
        )
    )
)