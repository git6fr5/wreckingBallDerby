
function get_points() {
	
	origin[0] = objCrane.x; origin[1] = objCrane.y;
	dest[0] = objWreckingBall.x; dest[1] =  objWreckingBall.y;
	
}

function set_links() {

	chain_nodes[0].x = origin[0];
	chain_nodes[0].y = origin[1];
	
	chain_nodes[number_of_links-1].x = dest[0];
	chain_nodes[number_of_links-1].y = dest[1];
		
	var gradient;
	gradient[0] = (dest[0] - origin[0]) / number_of_links; 
	gradient[1] = (dest[1] - origin[1]) / number_of_links; 
	
	for (i = 1; i < number_of_links-1; i+=1) {
		chain_nodes[i].x = origin[0] + gradient[0] * i;
		chain_nodes[i].y = origin[1] + gradient[1] * i;
		// chain_nodes[i].depth = -y;
	}
	
	
}

get_points();
set_links();

