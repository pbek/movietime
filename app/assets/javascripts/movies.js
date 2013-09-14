
$(function() {
  $("#q_source_id_in").select2({
    placeholder: "sources"
  });

  $("#q_genres_id_in").select2({
    placeholder: "genres"
  });

  // $("#q_director_id_in").select2({
  //   placeholder: "director"
  // });

  // $("#q_cast_members_id_in").select2({
  //   placeholder: "cast members"
  // });

  $("[data-toggle='tooltip']").tooltip();

  $('.movie_tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

  $('.select2').each(function(i, e){
    var select = $(e)
    options = {
      placeholder: select.data('placeholder'),
      multiple: select.data('multiple')
    }
    if (select.hasClass('ajax')) {
      options.ajax = {
        url: select.data('source'),
        dataType: 'json',
        data: function(term, page) { return { q: term, page: page, per: 10 } },
        results: function(data, page) { return { results: data } }
      }
      options.dropdownCssClass = "bigdrop"
    }
    select.select2(options)
  })
});
