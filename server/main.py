from fastapi import FastAPI

app = FastAPI(
    title="Financial tracker API"
)


@app.get("/health")
def health():
    return "OK"
