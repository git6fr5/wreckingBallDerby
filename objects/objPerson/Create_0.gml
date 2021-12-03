function Destroy(dt) {

    // vspeed = 0; hspeed = 0;
    if (destroy_ticks == 0) {
        hp -= 1;
        blood_particle = instance_create_depth(x, y, -1, prefab_particle);
        blood_particle.sprite_index = sprBloodSplatter;
        blood_particle.destroy_on_end = false;
        blood_particle.animate = false;
        blood_particle.follow = noone;
    }

    if (random_range(0, 0.99) < 0.5) {
        var new_blood_particle = instance_create_depth(x, y, -1, prefab_particle);
        new_blood_particle.sprite_index = sprBloodSplatter;
        new_blood_particle.destroy_on_end = false;
        new_blood_particle.animate = false;
        new_blood_particle.follow = noone;
    }

    vspeed *= 0.925;
    hspeed *= 0.925;

    destroy_ticks += dt;
    if (destroy_ticks > destroy_delay) {
        if (hp <= 0) {
            instance_destroy();
        }
        else {
            max_speed *= 0.5;
            destroy = false;
            destroy_ticks = 0;
        }
    }


}
var colours = [sprPerson, sprPersonBlue, sprPersonGrey];
var index = random_range(0, 3);
sprite_index = colours[index];