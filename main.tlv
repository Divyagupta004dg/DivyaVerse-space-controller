\TLV
|define_module
  @0
    $enemy_distance = 6;
    $enemy_direction = 2;
    $my_direction = 1;
    $energy_level = 80;
    $shield_status = 0;

  @clocked
    $enemy_distance <= random() % 10;
    $enemy_direction <= random() % 4;
    $energy_level <= $energy_level - 5;
    $shield_status <= random() % 2;

    $enemy_near <= $enemy_distance < 5;
    $energy_ok <= $energy_level > 50;

    $fire_cmd <= $enemy_near & $energy_ok & (~$shield_status);
    $enemy_trend <= >>2$enemy_direction == >>1$enemy_direction;
    $turn_cmd <= $enemy_trend ? $enemy_direction : ($enemy_direction + 2);
    $shield_cmd <= $enemy_near & ~($energy_ok);

*passed = *cyc_cnt > 40;
*failed = 1'b0;
