game = oGame;

index = -1; // Index in instance_find

type = 0; // Determines role in rock-paper-scissors dynamic. It's a free for all, but this results in the ability to flee being significant. Bots have a fight or flight response based upon potential target's totalLevel
// ^ Could alternatively just use target's level to determine fight or flight, underdogs are good though

region = -1; // Check each frame if current region is different from this, update here and in globals if needed

state = 0; // Start searching
attackTimer = 0;
target = noone;
facing = random(360);
meandering = 1;

// Discrete stats. Upon killing another bot, this bot gains all of its stats and a random stat. Maybe shouldn't be totally random to encourage stacking of one particular stat
// These should be used to determine actual numbers to be used, and some should grant diminishing returns. Make a function for each for leveling up by x amount
// Some stats should be rarer than others
totalLevel = 0; // Sum of all other levels
speedLevel = 0;
sprintLevel = 0;
staminaLevel = 0;
metabolismLevel = 0; // Should metabolism grow faster as the bot aquires more stats? Determines how much food is needed
visionRangeLevel = 0;
visionThetaLevel = 0;
damageLevel = 0;
attackSpeedLevel = 0;
lifestealLevel = 0;

updateVisionRange(self, 0);
updateVisionTheta(self, 0);
updateSpeed(self, 0);

walkingSpeed = 1;
velocity = walkingSpeed;
sprintSpeed = 2;
attackingSpeed = .3;
turnRate = 3;
giveUpRange = 200; // Will stop chasing if target is more than this far away

maxHp = 1;
hp = maxHp;
shouldDie = false;

attackDamage = 1;
attackSpeed = 2;
attackRange = 16;