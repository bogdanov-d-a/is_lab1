(deffacts startup
	(personal_trait mentor)
	(personal_trait programmer)
	(personal_trait slacker)

	(relative_trait respect)
	(relative_trait lack_of_respect)

	(opposite_relative_traits respect lack_of_respect)

	(at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor respect programmer)
	(all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 mentor lack_of_respect slacker)
)

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

(defrule none_with_personal_trait1_has_personal_trait2
	(personal_trait ?personal_trait1)
	(personal_trait ?personal_trait2)
	(no_persons_share_personal_traits ?personal_trait1 ?personal_trait2)
	=>
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait1 ?personal_trait2))
	(assert (none_with_personal_trait1_has_personal_trait2 ?personal_trait2 ?personal_trait1))
)
