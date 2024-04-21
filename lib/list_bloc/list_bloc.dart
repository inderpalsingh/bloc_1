
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(): super(ListState(allNotes: [])){
    
    
    on<AddNoteEvent>((event, emit){

      List<Map<String, dynamic>> mData = state.allNotes;
      mData.add({
        'title': event.title,
        'desc': event.desc
      });
      emit(ListState(allNotes: mData));
  
    });
    
    on<UpdateNoteEvent>((event, emit){
     
      List<Map<String, dynamic>> mData = state.allNotes;
      
      mData[event.index] = {
        'title': event.updatedTitle,
        'desc': event.updatedDesc
      };
      emit(ListState(allNotes: mData));
   
      
    });
    
    
    on<DeleteNoteEvent>((event, emit){

      List<Map<String,dynamic>> mData = state.allNotes;
      mData.removeAt(event.index);
      emit(ListState(allNotes: mData));
   
    });
    
  }
  
  
}