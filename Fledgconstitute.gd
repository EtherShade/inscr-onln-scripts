extends SigilEffect

#Used for sigils that do something at the start of the turn
func start_of_turn(cardAnim):
	cardAnim.play("Evolve")
	yield (cardAnim, "animation_finished")
	var dmgTaken = card.card_data["health"] - card.health
	card.from_data(CardInfo.from_name(card.card_data["evolution"]))
	card.health = card.card_data["health"] - dmgTaken

	print("Reconstitute triggered!")	
	var old_data = card.card_data.duplicate()
	fightManager.gold_sarcophagus.append(
		{
			"card": old_data,
			"turnsleft": 1
		}
	)

	# Calculate buffs
	slotManager.recalculate_buffs_and_such()
#	for card in slotManager.all_friendly_cards():
#		card.calculate_buffs()
#	for eCard in slotManager.all_enemy_cards():
#		eCard.calculate_buffs()
