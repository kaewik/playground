mod tribonacci;

fn main() {
    array_diff([1,2,3].to_vec(), [2,2].to_vec());
    tribonacci::tribonacci(&[0f64,0_f64,2f64], 10);
}

fn array_diff<T: PartialEq>(a: Vec<T>, b: Vec<T>) -> Vec<T> {
    a.into_iter().filter(|elem_of_a| has_not(&b, elem_of_a)).collect()
}

fn has_not<T: PartialEq>(vec: &Vec<T>, elem: &T) -> bool {
    vec.iter().find(|&elem_of_vec| *elem_of_vec == *elem).is_none()
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn returns_expected() {
        assert_eq!(array_diff(vec![1,2], vec![1]), vec![2]);
        assert_eq!(array_diff(vec![1,2,2], vec![1]), vec![2,2]);
        assert_eq!(array_diff(vec![1,2,2], vec![2]), vec![1]);
        assert_eq!(array_diff(vec![1,2,2], vec![]), vec![1,2,2]);
        assert_eq!(array_diff(vec![], vec![1,2]), vec![]);
    }
}