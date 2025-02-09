import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';


class ShopPage extends StatefulWidget {


  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Shoe> _searchResults = [];

  void _filterSearchResults(String query) {
    if (query.isEmpty){
      _searchController.clear();
     
     _searchResults = Provider.of<Cart>(
      context, listen: false).getShoeList();


    } else{
      _searchResults = 
    Provider.of<Cart>(
      context, 
      listen: false).getShoeList().where((element) =>
      element.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
    
  }
  setState(() {
      
    });

    }
    

  // add shoe to cart

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert user, show successfully added
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your Cart'),

    ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) =>  Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const 
    EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  
                  controller: _searchController,
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(vertical: 1)
                  ),
                  onChanged: (query) => _filterSearchResults(query),
                ),
              ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
        
          
        ),
        // Message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Everyone flies.. some fly longer than others',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        // Hot picks
        Padding(
          padding: const 
      EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot picks...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),


        // list of shoe
        Expanded(
          child: 
          _searchController.text.isEmpty ?
          ListView.builder(
            itemCount: value.getShoeList().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

              // get  a shoe from the shp list
        Shoe shoe = value.getShoeList()[index];


            // return the shoe
              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
                );
              },
          )
          : 
          ListView.builder(itemCount: _searchResults.length,
          
          itemBuilder: (context, index) {
            // get a shoe from search results

            Shoe shoe = _searchResults[index];
            // return the shoe

          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoeToCart(shoe),
          );

          }
          
          ),
        ),


        const Padding(
          padding: EdgeInsets.only(
            top: 25.0, 
            left: 25.0, 
            right: 25.0),
          child: Divider(
            color: Colors.white,),
        )
      ],
    )
    );
  }
}

