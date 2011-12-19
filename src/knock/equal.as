package knock {
  public function equal(x: Object, y: Object): Boolean {
    if (x && ("equals" in x)) {
      return x.equals(y)
    } else if (y && ("equals" in y)) {
      return y.equals(x)
    } else if (x is Array && y is Array) {
      return arrays_equal(x as Array, y as Array)
    } else if (is_plain_object(x) && is_plain_object(y)) {
      return objects_equal(x, y)
    } else {
      return x == y
    }
  }
}

import knock.*

function arrays_equal(x: Array, y: Array): Boolean {
  if (x.length === y.length) {
    for (var i: int = 0; i < x.length; ++i) {
      if (!equal(x[i], y[i])) {
        return false
      }
    }

    return true
  } else {
    return false
  }
}

function is_plain_object(value: Object): Boolean {
  return value !== null && value.toString() === "[object Object]"
}

function objects_equal(x: Object, y: Object): Boolean {
  const x_keys: Array = get_object_keys(x)
  const y_keys: Array = get_object_keys(y)

  x_keys.sort()
  y_keys.sort()

  if (equal(x_keys, y_keys)) {
    for each (var key: String in x_keys) {
      if (!equal(x[key], y[key])) {
        return false
      }
    }

    return true
  } else {
    return false
  }
}

function get_object_keys(object: Object): Array {
  const result: Array = []

  for (var key: String in object) {
    result.push(key)
  }

  return result
}
