import time

def timedcall(fn, *args):
	"Call function with args; return time in seconds and result."
	t0 = time.clock()
	result = fn(*args)
	t1 = time.clock()
	return t1-t0, result

def timedcalls(n, fn, *args):
	"""Call fn(*args) repeatedly: n times if n is an int, or up
	to n seconds if n is a float; return the min, avg, max time."""
	if isinstance(n, int):
		times = [timecall(fn, *args)[0] for _ in range(n)]
	else:
		times = []
		while sum(times) < n:
			times.append(timecall(fn, *args)[0])
	return min(times), average(times), max(times)