# importing the modules
import numpy as np
import matplotlib.pyplot as plt
import json
import sys

if len(sys.argv) > 1:
    filename = sys.argv[1]
    print(f"The filename passed is {filename}")
else:
    print("No filename passed")
    exit(-1)

# Open the file
with open(filename, 'r') as f:
    # Load JSON data from file
    data = json.load(f)

# Assuming 'data' is your dictionary
numeric_data = {k: v for k, v in data.items() if all(isinstance(i, (int, float)) for i in v)}

plot_data = {
        "small_data" : {},
        "medium_data" : {},
        "big_data" : {},
        "huge_data" : {},
        }

for name, values in numeric_data.items():
    max_value = max(*values)
    if max_value <= 1:
        plot_data["small_data"][name] = values
    elif max_value <= 10:
        plot_data["medium_data"][name] = values
    elif max_value <= 100:
        plot_data["big_data"][name] = values
    else:
        plot_data["huge_data"][name] = values

for data_block, data in plot_data.items():
    fig, ax = plt.subplots()
    # plotting
    ax.set_title("Metrics in comparison")
    ax.set_xlabel("#getStats() calls")
    ax.set_ylabel("metric in its own unit")

    for name, values in data.items():
        y = values
        x = np.arange(1, len(y)+1)
        ax.plot(x, y, label=name)

    ax.legend()

plt.show()
