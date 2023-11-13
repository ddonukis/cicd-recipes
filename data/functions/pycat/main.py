import sys
from pathlib import Path


def main() -> None:
    filespaths = sys.argv[1:]
    if filespaths:
        for filepath in filespaths:
            p = Path(filepath)
            if p.exists() and p.is_file():
                print(p.read_text(), end="")
            else:
                print(f"File {p} does not exist!", file=sys.stderr)
    else:
        print(sys.stdin.read())


if __name__ == "__main__":
    main()
