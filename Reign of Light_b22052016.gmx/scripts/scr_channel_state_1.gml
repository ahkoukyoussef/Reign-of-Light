///scr_channel_state_1()
image_speed=.2;

//Change_sprite

/*
switch(sprite_index){
    case spr_player_down_1:
        sprite_index = spr_player_channel_down_1;
        ld=DOWN;
     
    break;
    
    case spr_player_up_1:
        sprite_index = spr_player_channel_up_1; 
        ld=UP;
  
    break;
        
    case spr_player_right_1:
        sprite_index = spr_player_channel_right_1;
        ld=RIGHT;
        
    break;
        
    case spr_player_left_1:
        sprite_index = spr_player_channel_left_1;
        ld=LEFT;
       
    break;
    
}
*/

if(mdir>210 && mdir<330){sprite_index = spr_player_channel_down_1;ld=DOWN;}
else if(mdir>30 && mdir<150 ){sprite_index = spr_player_channel_up_1;ld=UP;}
else if( (mdir>330 && mdir<360) || (mdir>0 && mdir<30)  ){sprite_index = spr_player_channel_right_1;ld=RIGHT;}
else {sprite_index = spr_player_channel_left_1;ld=LEFT;}



//Build up
if(damage_build_up<(10) && obj_player_stats.Stamina>0 && fired==0){


damage_build_up = damage_build_up+0.05;
obj_player_stats.Stamina-=0.1;
}



if(!aura_s){
aura = instance_create(x,y+5,obj_aura1);
aura.image_speed=0.2;

aura_s=true;}



//Fire


if(obj_input.special1_key_r && fired==0){

switch(ld){
    case DOWN:
        i = instance_create(x-3,y+3,obj_lightning2);
        i.creator = id;
        i.damage = obj_player_stats.Attack*damage_build_up+i.damage;
     
    break;
    
    case UP:
        i = instance_create(x+5,y-12,obj_lightning3);
        i.creator = id;
        i.damage = obj_player_stats.Attack*damage_build_up+i.damage;
  
    break;
        
    case RIGHT:

        j = instance_create(x+12,y-1,obj_lightning);
        j.creator = id;
        j.damage = obj_player_stats.Attack*damage_build_up+j.damage;

    break;
        
    case LEFT:

        l = instance_create(x-12,y-1,obj_lightning1);
        l.creator = id;
        l.damage = obj_player_stats.Attack*damage_build_up +l.damage;
        
   

    break;
    
}

fired = 1;
alarm[1] = room_speed/2;
damage_build_up =0;
aura.alarm[0]=1;


}

if(alarm[1]<=0 and fired==1){

aura_s=false;
state = scr_move_state_1;
fired=0;
}
