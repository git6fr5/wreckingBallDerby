

function create_nodes() {
	
	chain_nodes[0] = instance_create_depth(x, y, -y, prefab_chain_node);
	for (i = 1; i < number_of_links; i+=1) {
		
		chain_nodes[i] = instance_create_depth(x, y, 1, prefab_chain_node);
		chain_nodes[i].depth = objCrane.depth + 1;
	}
	
}

create_nodes();