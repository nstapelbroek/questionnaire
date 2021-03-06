class TabIndex
    form: $ "#questionnaireForm"

    constructor: (options) ->
        @options = options || {}
        @form = options.form || @form || false

        @form.find("input, button[data-type='next']").each (index, element) ->

            $ element
                .attr "tabindex", (index + 1)
                .on "focus", () ->

                    if $(this).attr("type") == "radio" or $(this).attr("type") == "checkbox"
                        $ this
                            .closest ".list-group-item"
                            .addClass "focused"

                .on "blur", () ->

                    if $(this).attr("type") == "radio" or $(this).attr("type") == "checkbox"
                        $ this
                            .closest ".list-group-item"
                            .removeClass "focused"

            return
