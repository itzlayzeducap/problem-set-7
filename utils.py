import sqlite3
from pathlib import Path


def execute(cursor: sqlite3.Cursor, filename: str):
    path = Path(filename)
    content = path.read_text(encoding="utf-8")
    responses = []

    for request in fetch_requests(content):
        cursor.execute(request)
        if cursor.description is not None:
            responses.append(cursor.fetchall())
        else:
            responses.append([])

    return responses


def fetch_requests(content: str) -> list[str]:
    requests = []
    current = []

    for raw in content.splitlines(keepends=True):
        current.append(raw)
        if sqlite3.complete_statement("".join(current)):
            request = "".join(current).strip()
            if request:
                requests.append(request)
            
            current = []

    last = "".join(current).strip()
    if last:
        requests.append(last)

    return requests


def list_requests(folder_name: str) -> list[str]:
    folder = Path(folder_name)
    return [
        str(path) for path in sorted(folder.glob("*.sql"),
        key=lambda item: int(item.stem) if item.stem.isdigit() else item.stem)
    ]
