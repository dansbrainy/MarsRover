### Mars Rover Project

# Understanding of the project:

# Rover Object (self): Position, Direction (x, y, d),

        @d for direction which is either ==> {N, S, W, E}

# Plateau (environment/surface, scope or space on whuch the rover stands):

        @Grid of coordinates:
        - Initial Coord p0 ==> BottomLeft => (x, y) = (0, 0)
        - Final Coord pt ==> TopRight => (x, y) = (ax, by) which are given as first line inputs and a, b as variable coeficients

# Command: (cccccccccc) list of characters in (L, R, M):

        @L => Turn Left
        @R => Turn Right
        @M => Continue or move forward

# Input: 3 lines

        @First line: Final Grid Coord pt => (ax, by)
        @Second line: Rover Object (ax, by, direction)
        @Instructions given ==> [L R M]

# Implementation:

        @Turn Left
        @Turn Right
        @Continue or Move Forward
