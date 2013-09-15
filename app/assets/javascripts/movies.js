
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
      minimumInputLength: 2,
      multiple: select.data('multiple')
    }

    var ids = [];
    if (select.hasClass('ajax')) {
      options.ajax = {
        url: select.data('source'),
        dataType: 'json',
        data: function(term, page) { return { q: term, page: page, per: 10 } },
        results: function(data, page) { return { results: data } }
      }
      options.dropdownCssClass = "bigdrop";

      // value fix
      if (select.val() != '')
      {
        ids = $.unique(JSON.parse(select.val()));
      }

      // fetch data for the initial selection
      if (ids.length > 0) {
        options.initSelection = function(element, callback) {
          $.ajax(select.data('source'), {
            data: {
              ids: ids
            },
            dataType: "json"
          }).done(function(data) { callback(data); });
        };
      }
    }

    select.select2(options)

    // set the correct ids
    if (ids.length > 0) {
      select.select2("val", ids);
    }
  })
});
