
$(function() {
  $("#q_source_id_in").select2({
    placeholder: "sources"
  });

  $("#q_genres_id_in").select2({
    placeholder: "genres"
  });

  $("#q_director_id_in").select2({
    placeholder: "director"
  });

  $("#q_cast_members_id_in").select2({
    placeholder: "cast members"
  });

  $("[data-toggle='tooltip']").tooltip();

  $('.movie_tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })
});
