from fastapi import FastAPI

app = FastAPI(
    title="Online Store",
    description="FastAPI online store application deployed with Kubernetes.",
    version="1.0.0",
)


@app.get("/",summary="Store landing page")
def landing_page():
    return {"Home page": "Welcome to the Online Store!"}

