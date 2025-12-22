import re


def is_valid_email(email):
    pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

    if re.fullmatch(pattern, email):
        return True
    else:
        return False


def validate_password(password: str):
    if not re.match(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
        password,
    ):
        raise ValueError(
            "Password must be at least 12 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character"
        )
    return password
