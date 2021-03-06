package sui.controls;

import js.html.DOMElement as Element;
using thx.stream.Emitter;
using thx.Arrays;
using thx.Nulls;

class ChoiceControl<TSelect, T> implements IControl<T> {
  public var el(default, null) : Element;
  public var defaultValue(default, null) : T;
  public var streams(default, null) : ControlStreams<T>;

  var controls : Array<IControl<Dynamic>>;
  var enabled : Bool;
  var values : ControlValues<T>;
  public function new(defaultValue : T, getSelectValue T -> TSelect, createSelectControl : TSelect -> IControl<TSelect>, createControls : TSelect -> ) {
    this.el = element;
    this.defaultValue = defaultValue;
    this.controls = controls;
    values = new ControlValues(defaultValue);
    streams = new ControlStreams(values.value, values.focused, values.enabled);
    controls.pluck(_.streams.focused.feed(values.focused));

    streams.enabled.subscribe(function(value) {
      controls.pluck(value ? _.enable() : _.disable());
    });
  }

  public function set(v : T) : Void
    values.value.set(v);

  public function get() : T
    return values.value.get();

  public function isEnabled() : Bool
    return values.enabled.get();

  public function isFocused() : Bool
    return values.focused.get();

  public function disable() : Void
    values.enabled.set(false);

  public function enable() : Void
    values.enabled.set(true);

  public function focus() : Void
    controls.first().with(_.focus());

  public function blur() : Void {
    var el = js.Browser.document.activeElement;
    controls
      // TODO el could just contain _.el
      .filterPluck(_.el == el)
      .first().with(el.blur());
  }

  public function reset() : Void
    set(defaultValue);
}