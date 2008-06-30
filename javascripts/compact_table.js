function toggle_compact_table_hidden_div(id) {
  if ($('compact_table_hidden_'+id).style.visibility == 'visible') {
    $('compact_table_hidden_'+id).style.visibility = 'hidden';
    $('compact_table_hidden_'+id).style.height = '0';
  } else {
    $('compact_table_hidden_'+id).style.visibility = 'visible';
    $('compact_table_hidden_'+id).style.height = 'auto';
  }
}
