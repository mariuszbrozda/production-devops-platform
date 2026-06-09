from typing import Optional
from pydantic import BaseModel

class ProductBase(BaseModel):
    name: str
    description: Optional[str]
    price: float
    in_stock: int

class ProductCreate(ProductBase):
    pass

class ProductUpdate(BaseModel):
    name: Optional[str]
    description: Optional[str]
    price: Optional[float]
    in_stock: Optional[int]

class Product(ProductBase):
    id: int

