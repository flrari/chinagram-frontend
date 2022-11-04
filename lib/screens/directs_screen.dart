import 'package:flutter/material.dart';

class Direct extends StatefulWidget {
  final String username;

  const Direct({Key? key, required this.username}) : super(key: key);

  @override
  State<Direct> createState() => _DirectState();
}

class _DirectState extends State<Direct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
        title: Text(
          widget.username,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.videocam_outlined, color: Colors.white,)),
          IconButton(onPressed: null, icon: Icon(Icons.edit_note, color: Colors.white,)),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
                TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(child: Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),),
                      Tab(child: Text(
                        'Chiamate',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),),
                      Tab(child: Text(
                        'Richieste',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),),
                    ]),
              ]))
            ];
          },
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: ListView.builder(
                          itemCount: 11,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Username'),
                              subtitle: Text('Questo è un messaggio in direct...'),
                              trailing: Icon(Icons.camera_alt_outlined, color: Colors.white,),
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.cyan.shade100,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.pink, width: 2),
                                ),),
                              minVerticalPadding: 20,
                            );
                          }
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: 11,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: index==0 ? Border(top: BorderSide(width: 1, color: Colors.white38), bottom: BorderSide(width: 1, color: Colors.white38)) : null,
                              ),
                              child: ListTile(
                                title: index==0 ? Text('Crea una stanza') : Text('Nome Figo'),
                                subtitle: index==0 ? Text('Invia un link alla videaochiamata con i tuoi amici') : Text('username'),
                                trailing: index==0 ?
                                Icon(Icons.arrow_forward_ios, color: Colors.white38,) :
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Icon(Icons.phone, color: Colors.white,),
                                  SizedBox(width: 15,),
                                  Icon(Icons.videocam_outlined, color: Colors.white,),],),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: index==0 ? Colors.transparent : Colors.cyan.shade100,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: index==0 ? Colors.white38 : Colors.pink,
                                        width: 2),
                                  ),
                                  child: index==0 ? Icon(Icons.video_call_outlined, color: Colors.white, size: 25,) : null,
                                ),
                                minVerticalPadding: index==0 ? 20 : 10,
                              ),
                            );
                          }
                      ),
                    ),
                    Container(
                      child: Center(child: Text("Richieste di messaggi che non apre mai nessuno.")),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
