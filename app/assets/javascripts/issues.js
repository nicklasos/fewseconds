$(function() {
  var fieldsCount,
      maxFieldsCount = 4,
      $addLink = $('a.add_nested_fields');
  
  function toggleAddLink() {
    $addLink.toggle(fieldsCount <= maxFieldsCount)
  }

  $(document).on('nested:fieldAdded', function() {
    fieldsCount += 1;
    toggleAddLink();
  });

  $(document).on('nested:fieldRemoved', function() {
    fieldsCount -= 1;
    toggleAddLink();
  });  

  // count existing nested fields after page was loaded
  fieldsCount = $('form .fields').length;
  toggleAddLink();
})
