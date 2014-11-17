package sui.controls;

import sui.controls.Options;

class SearchControl extends BaseTextControl {
  public function new(value : String, ?options : OptionsText) {
    if(null == options)
      options = {};
    super(value, "search", "search", options);
  }
}