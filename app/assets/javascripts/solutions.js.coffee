jQuery ($) ->
  $('body').on 'click', '.solution .action.show', (event) ->
    $solution = $(event.target).closest('.solution')
    $source = $solution.find('.source')
    if $source.is(':visible')
      $source.stop().slideUp('normal')
    else
      $source.stop().slideDown('normal')

