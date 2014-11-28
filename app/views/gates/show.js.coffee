@__youcube_gate =
  # jQuery-like selector
  $: (selector) ->
    if selector.substr(0, 1) is '#'
      document.getElementById(selector.substr(1))
    else if selector.substr(0, 1) is '.'
      document.getElementsByClassName(selector.substr(1))

  init: ->
    for _ in @$('.__youcube_gate')
      _.innerHTML = """
        <a href="<%= @copy.dest %>?utm_source=gate&amp;utm_medium=<%= @source %>&amp;utm_term=<%= @copy.id %>" style="
          background: transparent;
          text-decoration: none;
        ">
          <div style="
            background: #ffffff;
            border: 2px solid #4cb55b;
            box-sizing: border-box;
            color: #4cb55b;
            display: inline-block;
            font-size: 14px;
            height: 60px;
            line-height: 16px;
            overflow: hidden;
            padding: 2px;
            width: 171px;
          ">
            <%= @copy.copy.html_safe %>
          </div>
        </a>
      """

@__youcube_gate.init()
