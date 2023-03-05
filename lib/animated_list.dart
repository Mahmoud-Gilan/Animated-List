import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);
  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}
class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Flutter Map'),
        leading: Container(),
        elevation: 0.0,
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _addItem(),
                  child: const Icon(Icons.add_circle,color: Colors.white,),
                  style: ElevatedButton.styleFrom(primary:Colors.purple),
                  ),
                Expanded(child: AnimatedList(
                    key: _key,
                    initialItemCount: _items.length,
                    itemBuilder: (context, index, animation) {
                      return _builderItem(_items[index], animation, index);
                    }
                ),),
              ],
            ),
          ),
    );
        }
  Widget _builderItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
       child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(item,
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.purple,), onPressed: () {
              _removeItem(index);
          },
          ),
        ),
      )
    );
  }
  void _removeItem(int i){
    String removeItem = _items.removeAt(i);
   AnimatedListRemovedItemBuilder builder=(context,animation) {
     return _builderItem(removeItem, animation, i);
   };
   _key.currentState?.removeItem(i, builder);
  }
  void _addItem(){
    int i = _items.length>0 ? _items.length : 0 ;
    _items.insert(i, 'Item ${_items.length+1}');
    _key.currentState?.insertItem(i);
  }

}

