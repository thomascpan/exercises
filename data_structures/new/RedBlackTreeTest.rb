require_relative "RedBlackTree"

red_black_tree1 = RedBlackTree.new

red_black_tree1.root = red_black_tree1.insert(nil,10);
red_black_tree1.root = red_black_tree1.insert(nil,20);
red_black_tree1.root = red_black_tree1.insert(nil,-10);
red_black_tree1.root = red_black_tree1.insert(nil,15);
red_black_tree1.root = red_black_tree1.insert(nil,17);
red_black_tree1.root = red_black_tree1.insert(nil,40);
red_black_tree1.root = red_black_tree1.insert(nil,50);
red_black_tree1.root = red_black_tree1.insert(nil,60);

red_black_tree1.print_values1