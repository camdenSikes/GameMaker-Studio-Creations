/// Step
//check if game over
if(lives <= 0){
//do something
game_restart();
}
//get inputs
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
//Check if on ground
if(place_meeting(x,y+1,obj_ground)) onGround = true;
else onGround = false;
//Set horizontal velocity
if (left && !right){
	if xvel > -maxvel{
		if (xvel > 0) xvel -= accel * 2.5;
		else xvel = max(-maxvel, xvel - accel);
	}
}
else if (right && !left){
	if xvel < maxvel{
		if (xvel < 0) xvel += accel * 2.5;
		else xvel = min(maxvel, xvel + accel);
	}

}
else if (xvel > 0) xvel = max(0, xvel - accel * 1.5);
else if (xvel < 0) xvel = min(0, xvel + accel * 1.5);

//Set vertical velocity
if(yvel < 70){
	yvel += grav;
}
if((yvel < -5) && !up) yvel = max(-5, yvel - 2*grav);
if(onGround){
	yvel = 0;
}
if(up && onGround){
	yvel = -jumpvel;
	onGround = false;
}
//Check for collisions
if(place_meeting(x + xvel, y, obj_ground)){
	while(!place_meeting(x+sign(xvel),y,obj_ground)){
		x += sign(xvel);
	}
	xvel = 0;
}
if(place_meeting(x, y + yvel, obj_ground)){
	while(!place_meeting(x,y + sign(yvel),obj_ground)){
		y += sign(yvel);
	}
	yvel = 0;
}
if(place_meeting(x + xvel, y + yvel, obj_ground)){
	while(!place_meeting(x+sign(xvel),y  + sign(yvel),obj_ground)){
		x += sign(xvel);
		y += sign(yvel);
	}
	xvel = 0;
	yvel = 0;
}

//Check if fell off map, if so send to start
if(y > 800){
	lives -= 1;
	x = 32;
	y = 384;
	xvel = 0;
	yvel = 0;
}

//move
x += xvel;
y += yvel;



