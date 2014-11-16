package sui.controls;

import sui.controls.Options;

class TextControl extends BaseTextControl {
  public function new(value : String, ?options : OptionsText) {
    super(value, "text", "text", options);
  }
}