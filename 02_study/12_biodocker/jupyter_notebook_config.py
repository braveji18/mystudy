import os
from notebook.auth import passwd


c = get_config()

c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888

if os.environ.get('PASSWORD', 'none') != 'none':
    c.NotebookApp.password = passwd( os.environ['PASSWORD'] )
    del os.environ['PASSWORD']
else:
    c.NotebookApp.password = passwd( "biospin1!" ) 

