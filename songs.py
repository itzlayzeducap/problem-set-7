import argparse
import sqlite3

from pathlib import Path
import utils


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("folder", nargs="?", default="songs")
    parser.add_argument("--database")

    args = parser.parse_args()

    folder = Path(args.folder)
    database = Path(args.database) if args.database else folder / f"{folder.name}.db"

    with sqlite3.connect(database) as db:
        cursor = db.cursor()
        for request_file in utils.list_requests(str(folder)):
            print(f"\n{request_file}:")
            for response in utils.execute(cursor, request_file):
                for row in response:
                    print(row)


if __name__ == "__main__":
    main()
