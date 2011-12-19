package knock {
  import flash.utils.getQualifiedClassName

  public function inspect(object: Object): String {
    if (object === null) {
      return "null"
    } else if (typeof object === "number") {
      return object.toString()
    } else if (typeof object === "string") {
      return inspect_string(object as String)
    } else if (object is Array) {
      return inspect_array(object as Array)
    } else if (object.toString() === "[object Object]") {
      return inspect_object(object)
    } else if (/^\[object \w+\]$/.test(object.toString())) {
      return "#<" + getQualifiedClassName(object) + ">"
    } else {
      return object.toString()
    }
  }
}

import knock.*

function inspect_string(string: String): String {
  return '"' + escape_string(string) + '"'
}

function escape_string(string: String): String {
  return string
    .replace(/ \\ /gx, "\\\\")
    .replace(/"/g, '\\"')
}

function inspect_array(array: Array): String {
  const parts: Array = []

  for each (var element: Object in array) {
    parts.push(inspect(element))
  }

  return "[" + parts.join(", ") + "]"
}

function inspect_object(object: Object): String {
  const items: Array = []

  for (var name: String in object) {
    items.push(name + ": " + inspect(object[name]))
  }

  if (items.length === 0) {
    return "{}"
  } else {
    return "{ " + items.join(", ") + " }"
  }
}
