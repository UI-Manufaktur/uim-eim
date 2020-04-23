module uim.eim;

	string id = "";
	size_t versionId = 1;
	size_t isCurrent = 1;
	size_t versioned = 0;
	string versionedBy = "";
	string name = "";
	string title = "";
	size_t validFrom = 0;
	size_t validUntil = 0;
	size_t created = 0;
	string createdBy = "";
	size_t changed = 0;
	string changedBy = "";
	size_t accessed = 0;
	string accessedBy = "";
	size_t locked = 0;
	string lockedBy = "";
	size_t deleted = 0;
	string deletedBy = "";
	string parameters = "";
	string description = "";

template TString(string propertyName, string defaultValue = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";
	const char[] setFkt = (set.length > 0) ? set : "_"~propertyName~" = newValue;";
	
	const char[] TProperty = "
	protected string _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected string _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this;}
	auto "~propertyName~"Default() { return _default"~propertyName~"; }
	O "~propertyName~"Default(this O)(string newValue) { _default"~propertyName~" = newValue; return cast(O)this; }
	bool "~propertyName~"IsDefault() { return (this._"~propertyName~" == _default"~propertyName~"); }

	@property string "~propertyName~"(this O)() { "~getFkt~" }
	@property O "~propertyName~"(this O)(string newValue) { "~setFkt~" return cast(O)this; }";
}
