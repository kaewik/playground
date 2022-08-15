async function A(): Promise<void> {
    return new Promise((resolve) => resolve())
}

function B(): Promise<void> {
    return new Promise((resolve) => resolve())
}

A().then(() => console.log('Promise of A is fulfilled.'))
B().then(() => console.log('Promise of B is fulfilled.'))