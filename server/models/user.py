from uuid import UUID, uuid4
from pydantic import BaseModel, Field
from server.helpers.password_hash import ph


class User(BaseModel):
    id: UUID = Field(default_factory=uuid4)
    username: str
    email: str
    password_hash: str
    full_name: str

    def __str__(self):
        return f"{self.username}"

    @staticmethod
    def create(username: str, email: str, password: str, full_name: str) -> "User":
        password_hash = ph(password)
        return User(
            username=username, 
            email=email, 
            password=password_hash, 
            full_name=full_name
        )
