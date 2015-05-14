#RWD Email Template API for Oracle
Here is an API for building Responsive Web Design Email Templates. Written in PL/SQL for Oracle development.

##Changelog
####0.1.0
- Initial Release

##Install
- Run script `rwd_email.sql` in your schema

##Run
- Execute any of the following procedures
    + `rwd_email.basic('your_email@email.com');`
    + `rwd_email.hero('your_email@email.com');`
    + `rwd_email.sidebar('your_email@email.com');`
    + `rwd_email.sidebar_hero('your_email@email.com');`

---

It is based on Ink by ZURB http://zurb.com/ink/, wrapped in PL/SQL.

If you find bugs, you can fill an issue through Github, send me a tweet or an email and I'll try to fix them as fast as possible!