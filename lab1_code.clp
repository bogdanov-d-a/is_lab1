(defrule initial-fact-driver-0000 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait mentor)))
(defrule initial-fact-driver-0001 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait programmer)))
(defrule initial-fact-driver-0002 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait slacker)))

(defrule initial-fact-driver-0003 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (relative_trait respect)))
(defrule initial-fact-driver-0004 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (relative_trait lack_of_respect)))

(defrule initial-fact-driver-0005 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (opposite_relative_traits respect lack_of_respect)))
(defrule initial-fact-driver-0006 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (opposite_relative_traits lack_of_respect respect)))

(defrule initial-fact-driver-0007 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor respect programmer)))
(defrule initial-fact-driver-0008 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor lack_of_respect slacker)))

(defrule initial-fact-driver-0009 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait_mentor mentor)))
(defrule initial-fact-driver-0010 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait_programmer programmer)))
(defrule initial-fact-driver-0011 (initial-fact) (not (lab1_proof_goal_reached)) => (assert (personal_trait_slacker slacker)))


(defrule opposite_relative_traits_commutativity
	(not (lab1_proof_goal_reached))
	(opposite_relative_traits ?a ?b)
	=>
	(assert (opposite_relative_traits ?b ?a))
)


(defrule none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3
	(not (lab1_proof_goal_reached))
	(all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait)
	(opposite_relative_traits ?relative_trait ?opposite_relative_trait)
	=>
	(assert (none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?opposite_relative_trait ?target_personal_trait))
)


(defrule no_persons_share_personal_traits
	(not (lab1_proof_goal_reached))
	(at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait1)
	(none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 ?source_personal_trait ?relative_trait ?target_personal_trait2)
	=>
	(assert (no_persons_share_personal_traits ?target_personal_trait1 ?target_personal_trait2))
)


(defrule none_with_personal_trait1_has_personal_trait2_normal
	(not (lab1_proof_goal_reached))
	(no_persons_share_personal_traits ?personal_trait1 ?personal_trait2)
	=>
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait1 ?personal_trait2))
)

(defrule none_with_personal_trait1_has_personal_trait2_reverse
	(not (lab1_proof_goal_reached))
	(no_persons_share_personal_traits ?personal_trait1 ?personal_trait2)
	=>
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait2 ?personal_trait1))
)


(defrule lab1_proof_goal_reached
	(not (lab1_proof_goal_reached))
	(personal_trait_programmer ?personal_trait1)
	(personal_trait_slacker ?personal_trait2)
	(none_with_personal_trait1_has_personal_trait2 ?personal_trait1 ?personal_trait2)
	=>
	(assert (lab1_proof_goal_reached))
	(printout t "No one with " ?personal_trait1 " trait have " ?personal_trait2 " trait." crlf)
	(printout t "Proof goal reached. See facts window for additional information." crlf)
)
