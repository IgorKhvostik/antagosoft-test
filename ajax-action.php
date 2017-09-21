<?php
include_once ('connection.php');
$action = $_REQUEST['action'];

if($action === 'getCity'){
    $result = [];

    /** @var PDO $DBH */
    $cities = $DBH->query('SELECT id,name FROM city order by name, id');
    foreach($cities as $city ){
        $result[$city['id']] = $city['name'];
    }

    echo json_encode($result);
}elseif($action === 'getArea'){
    $result = [];
    $city_id = (int)$_REQUEST['city_id'];
    /** @var PDO $DBH */
    $areas = $DBH->query('SELECT id,name FROM city_area WHERE city_id="'.$city_id.'" order by name, id');
    foreach($areas as $city ){
        $result[$areas['id']] = $areas['name'];
    }
    echo json_encode($result);
}elseif($action === 'getMyAddress'){

    $addresses = $DBH->query('SELECT * ,main_info.id as id, city.name as city_name, city_area.name as area_name FROM main_info
      INNER JOIN city ON main_info.city_id = city.id
      INNER JOIN city_area ON main_info.area_id = city_area.id
      order by main_info.id desc');
    foreach($addresses as $address ) {
        $items .= '<div class="item">
										<h3>'.$address['name'].'</h3>
										<p>'.$address['city_name'].','.$address['area_name'].' </p>
										<div class="actbox">
											<a href="#delete" data-id="'.$address['id'].'" class="bcross"></a>
										</div>
									</div>';
    }

    if($items) {
        echo '<h2>My Addresses</h2>
		   <div class="uo_adr_list">' . $items . '</div>';
    }

}elseif($action === "delete"){
    $id = (int)$_REQUEST['id'];
    $DBH->query("DELETE FROM main_info WHERE id='".$id."' LIMIT 1");
}