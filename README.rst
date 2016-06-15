================
django-last-seen
================

Keep trak of when a user has been last seen on a website.
The last seen time is kept on the database

The app is ready for django 1.5, it uses the AUTH_USER_MODEL setting to get
the user model,

Installation
============

#. Install with ``pip install django-last-seen"`` or add ``"last_seen"``
   directory to your Python path.
#. Add ``"last_seen"`` to the ``INSTALLED_APPS`` tuple found in your settings
   file.
#. Add 'last_seen.middleware.LastSeenMiddleware' to MIDDLEWARE_CLASSES tuple
   found in your settings file.
#. Run ``manage.py syncdb`` to create the new tables

Usage
=====

To get when a user has been last seen::

    from last_seen.model import LastSeen

    seen = LastSeen.object.when(user=user)


To save a last seen user without the middleware::

    from last_seen.model import LastSeen

    # save with a special module
    LastSeen.object.when(user=user, module='forum')

Middleware
==========

The provided middleware keeps track of when an authenticated user has been
last seen on the site,

If you want to keep track of a user last seen on a part of a site, you can
use a special module name and use::

    from last_seen.model import LastSeen

    # save with a special module
    LastSeen.object.when(user=user, module='forum')

Then to get the data::

    from last_seen.model import LastSeen

    # user last seen on any part of the site
    seen = LastSeen.object.when(user=user)

    # user last seen on a module
    seen = LastSeen.object.when(user=user, module='forum')

Settings
========

LAST_SEEN_DEFAULT_MODULE
    The default module used on the middleware. The default value is ``default``.

LAST_SEEN_INTERVAL
    How often is the last seen timestamp updated to the
    database. The default is 2 hours.

