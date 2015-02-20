

fn main() {
  let x = QueueListValue::Single(1);
  let QueueListValue::Single(q) = x;

  println!("{:?}", q);
}

enum QueueListValue<T> {
  Empty,
  Single(T),
  Many(T, Vec<T>)
}