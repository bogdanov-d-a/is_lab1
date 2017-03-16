(defrule initial-fact-driver-0000 (initial-fact) => (assert (personal_trait mentor)))
(defrule initial-fact-driver-0001 (initial-fact) => (assert (personal_trait programmer)))
(defrule initial-fact-driver-0002 (initial-fact) => (assert (personal_trait slacker)))

(defrule initial-fact-driver-0003 (initial-fact) => (assert (relative_trait respect)))
(defrule initial-fact-driver-0004 (initial-fact) => (assert (relative_trait lack_of_respect)))

(defrule initial-fact-driver-0005 (initial-fact) => (assert (opposite_relative_traits respect lack_of_respect)))

(defrule initial-fact-driver-0006 (initial-fact) => (assert (at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor respect programmer)))
(defrule initial-fact-driver-0007 (initial-fact) => (assert (all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor lack_of_respect slacker)))

(defrule initial-fact-driver-0008 (initial-fact) => (assert (personal_trait_programmer programmer)))
(defrule initial-fact-driver-0009 (initial-fact) => (assert (personal_trait_slacker slacker)))


(defrule opposite_relative_traits_commutativity
	(relative_trait ?a)
	(relative_trait ?b)
	(opposite_relative_traits ?a ?b)
	=>
	(assert (opposite_relative_traits ?b ?a))
)


(defrule none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3
	(personal_trait ?source_personal_trait)
	(relative_trait ?relative_trait)
	(personal_trait ?target_personal_trait)
	(all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait)
	(opposite_relative_traits ?relative_trait ?opposite_relative_trait)
	=>
	(assert (none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?opposite_relative_trait ?target_personal_trait))
)


(defrule no_persons_share_personal_traits
	(personal_trait ?source_personal_trait)
	(relative_trait ?relative_trait)
	(personal_trait ?target_personal_trait1)
	(personal_trait ?target_personal_trait2)
	(at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait1)
	(none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait2)
	=>
	(assert (no_persons_share_personal_traits ?target_personal_trait1 ?target_personal_trait2))
)


(defrule none_with_personal_trait1_has_personal_trait2_normal
	(personal_trait ?personal_trait1)
	(personal_trait ?personal_trait2)
	(no_persons_share_personal_traits ?personal_trait1 ?personal_trait2)
	=>
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait1 ?personal_trait2))
)

(defrule none_with_personal_trait1_has_personal_trait2_reverse
	(personal_trait ?personal_trait1)
	(personal_trait ?personal_trait2)
	(no_persons_share_personal_traits ?personal_trait1 ?personal_trait2)
	=>
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait2 ?personal_trait1))
)


(defrule lab1_proof_goal_reached
	(personal_trait ?personal_trait1)
	(personal_trait_programmer ?personal_trait1)
	(personal_trait ?personal_trait2)
	(personal_trait_slacker ?personal_trait2)
	(none_with_personal_trait1_has_personal_trait2 ?personal_trait1 ?personal_trait2)
	=>
	(assert (lab1_proof_goal_reached))
	(printout t "No one with " ?personal_trait1 " trait have " ?personal_trait2 " trait." crlf)
	(printout t "Proof goal reached. See facts window for additional information." crlf)
)
