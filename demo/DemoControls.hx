using dots.Html;
using dots.Query;

import sui.controls.*;

import js.Browser;

class DemoControls {
  public static function main() {
    createControlContainer(new BoolControl(true));
    createControlContainer(new TextControl(null));
    createControlContainer(new FloatControl(7.7));
    createControlContainer(new IntControl(7));
  }

  public static function createControlContainer<T>(control : Control<T>) {
    var description = Type.getClassName(Type.getClass(control)).split(".").pop(),
        el = Html.parse('<div class="sample">
  <h2>$description</h2>
  <div class="container"></div>
  <div class="focus"></div>
  <div class="value"></div>
</div>');
    Browser.document.body.appendChild(el);
    var container = Query.first(".container", el),
        focus     = Query.first(".focus", el),
        value     = Query.first(".value", el);
    container.appendChild(control.el);

    control.streams.value.subscribe(function(v) {
      value.textContent = 'value: $v';
    });

    control.streams.focus.subscribe(function(v) {
      focus.textContent = 'focus: $v';
    });
  }
}