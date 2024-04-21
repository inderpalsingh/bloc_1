import 'package:bloc_1/list_bloc/list_bloc.dart';
import 'package:bloc_1/list_bloc/list_event.dart';
import 'package:bloc_1/list_bloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageListMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc 1')),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (_, state) {
        
          return ListView.builder(
            itemCount: state.allNotes.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<ListBloc>().add(UpdateNoteEvent(updatedTitle: 'updatedTitle', updatedDesc: 'updatedDesc', index: index));
                },
                title: Text(state.allNotes[index]['title']),
                subtitle: Text(state.allNotes[index]['desc']),
                trailing: IconButton(
                  onPressed: () {
                    context.read<ListBloc>().add(DeleteNoteEvent(index: index));
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListBloc>()
              .add(AddNoteEvent(title: 'title', desc: 'desc'));
        },
        child: const Text('Add'),
      ),
    );
  }
}
