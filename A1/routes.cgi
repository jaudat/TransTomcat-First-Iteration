#!/usr/bin/python

import cgi, os
import sys
import cgitb; cgitb.enable()

def getall(form, nolist=False):
    """
    Passed a form (cgi.FieldStorage instance) return *all* its values.
    Multipart form data (file uploads) are not handled by this function.
    If optional keyword argument 'nolist' is set to True, list values
    are returned as only their first value.
    """
    data = {}
    for field in form.keys():                
    # must use the keys() method rather than just iterating over form
        if type(form[field]) ==  type([]):
            if not nolist:
                data[field] = form.getlist(field)
            else:
                data[field] = form.getfirst(field)
        else:
            data[field] = form[field].value
    return data

# HTTP Access-Control header enables cross-domain requests,
#      Content-type header indicates JSON data follows
sys.stdout.write("Access-Control-Allow-Origin: *")
sys.stdout.write("Content-type: application/json\n\n")
sys.stdout.flush()

# Retrieve any parameter values specified by the user
form = cgi.FieldStorage()
formdict = getall(form)
params = ""
paramfmt = " %s='%s' "
for entry in formdict:
    params += paramfmt % (entry, str(formdict[entry]))

"""
 Run the Saxon processor on the ttc_routes XML data provided on the
 assignments page together with your JSON extractor XSL.
"""

os.system("java -jar saxon8.jar ttc_routes.xml ttc_routes_json.xsl " +params)
sys.stdout.flush()
