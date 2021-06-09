The .refreshable modifier doesn’t respect structured concurrency.
While the .task modifier will cancel tasks that are started within it, the .refreshable (and potentially other) modifiers that do support async work, doesn’t cancell the tasks when the screen leaves. 
