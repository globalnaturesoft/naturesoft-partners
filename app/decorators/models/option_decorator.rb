Naturesoft::Option.class_eval do
  @partners = {
    "items_per_page" => 10,
    "thumbnails" => {
      "big" => {
        "width" => "500",
        "height" => "500",
        "scale" => "fit"
      },
      "medium" => {
        "width" => "160",
        "height" => "160",
        "scale" => "fill"
      },
      "small" => {
        "width" => "80",
        "height" => "80",
        "scale" => "fill"
      }
    },
  }
end