"""Core functionality for koboripackage."""


def hello(name: str) -> None:
    """Print a greeting message.

    Args:
        name: The name to greet
    """
    print(f"Hello, {name}!")


def multiply(a: int | float, b: int | float) -> int | float:
    """Multiply two numbers.

    Args:
        a: First number
        b: Second number

    Returns:
        The product of a and b
    """
    return a * b
