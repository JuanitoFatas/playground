# Finite State Machine
# This FSM simulation can NOT handle Epsilon and Ambiguity...

def fsmsim(string, current, edges, accepting):
    if string == "":
        return current in accepting
    else:
        letter = string[0]
        if (current, letter) in edges:
            return fsmsim(string[1:], edges[(current,letter)], edges, accepting)
        else:
            return False

# Q1A Finite State Machine for this regexp r"a+1+"

edges_q1 = {
	(1,'a'): 2,
	(2,'a'): 2,
	(2,'1'): 3,
	(3,'1'): 3,
}

accepting_q1 = [3]

# print fsmsim("aaa111", 1, edges_q1, accepting_q1) # => True

# Q2: A Finite State Machine for this regexp r"q*"

edges_q2 = {
    (1, 'q'): 1
}

accepting_q2 = [1]

# print fsmsim("qqq", 1, edges_q2, accepting_q2) # => True
# print fsmsim("", 1, edges_q2, accepting_q2) # => True
# print fsmsim("qqqAqqq", 1, edges_q2, accepting_q2) # => False

# Q3 A FSM for this regexp r"[a-b][c-d]?"

edges_q3 = {
    (1, 'a'): 2,
    (1, 'b'): 2,
    (2, 'c'): 3,
    (2, 'd'): 3
}

accepting_q3 = [2, 3]

print fsmsim("a", 1, edges_q3, accepting_q3) # => True
print fsmsim("ac", 1, edges_q3, accepting_q3) # => True
print fsmsim("aca", 1, edges_q3, accepting_q3) # => False


# Formal Definition of FSM
# A FSM accepts a string S if there exists even one path
# from the start state to any accepting state following S
# Non-deterministic FSM

# Every Non-det can be converted to det.