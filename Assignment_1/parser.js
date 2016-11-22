var Representer= {};
Representer.represent = function (tree) {
    if (typeof tree.leftChild !== 'number') {
        tree.leftChild = Representer.represent(tree.leftChild);
    }
    if (typeof tree.rightChild !== 'number') {
        tree.rightChild = Representer.represent(tree.rightChild);
    }
    return '(' + tree.leftChild + tree.parent + tree.rightChild + ')';
};

module.exports= Representer;