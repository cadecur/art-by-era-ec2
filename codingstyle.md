Art-By-Era Coding Style 00. (Prefix): These are expected to be followed whenever possible, but are not hard and fast. If you see some breaking of the convention in the code, try to fix it. If older documents do not follow this code, do not waste time by going back and fixing them. Furthermore, do not get so hung up on these guidelines that it hampers your ability to code. Guidelines are malleable.

Naming and Formatting

No tabs, whitespace at the end of lines of code.
Four spaces per logic level.
No lines over 80 characters. Use implied line continuation inside parentheses/brackets/braces, if necessary. Use ‘\’ as a last resort.
K&R Bracing Style: Stroustrup Variant
Try to avoid non-descriptive variable names (i.e x, y, pt, variable, thing1, etc.) unless used within a loop, or referring to some well known variable in a broader context. In other words, use functional names to mitigate over-commenting.
Add a blank line between functions, and two between classes.
For the love of god, don’t mix tabs and spaces.
joined_lower for functions.
ALL_CAPS for constants.
StudlyCaps for classes.
camelCase for variables.
Try to follow PEP8
Python Specific

Make sure pipenv, flask, and heroku are installed on your system.
Use python 3.6.
Make use of python libraries to solve problems instead of from-scratch solutions.
Avoid global variables at all costs.
How to Code Like a Pythonista: Idiomatic Python.
Etiquette

Please create your own git branch unless pushing to master for a good reason.
If you do push to master, make sure to leave thoughtful comments regarding changes.
Make sure to leave docstrings and comments for the rest of us when modifying code.
Docstrings (From Idiomatic Python)
Explain the purpose of the function even if it seems obvious to you, because it might not be obvious to someone else later on.
Describe the parameters expected, the return values, and any exceptions raised.
If the method is tightly coupled with a single caller, make some mention of the caller (though be careful as the caller might change later).
Comments (Idiomatic Python Again)
explain why, and are for the maintainers of your code.
Some Words of Wisdom (Optional)

Beautiful is better than ugly. Explicit is better than implicit. Simple is better than complex. Complex is better than complicated. Flat is better than nested. Sparse is better than dense. Readability counts. Special cases aren't special enough to break the rules. Although practicality beats purity. Errors should never pass silently. Unless explicitly silenced. -Tim Peters, The Zen of Python

Programs must be written for people to read, and only incidentally for machines to execute. -Abelson & Sussman, Structure and Interpretation of Computer Programs


