attacker = argument0;
victim = argument1;

with(attacker) {
	state = 2;
	velocity = attackingSpeed;
	attackTimer = 60 / attackSpeed;
}

victim.hp -= attacker.attackDamage;
if(victim.hp <= 0) {
	feed(attacker, victim);
	attacker.target = noone; // Necessary?
	attacker.state = 0;
	attacker.image_blend = make_color_hsv(128, 255, 255);
}

