#Oracle Responsive Email Templates
Here is an API for building Responsive Web Design Email Templates. Written in PL/SQL for Oracle development.

##Changelog
####1.0.0 - Stable Release
- **Decoupled the API from the send mail feature. Now it returns a CLOB value. Use your own email sending package.**
- Added new global variables
- New comments / documentation all over the API
- Huge refactoring
- Added support for columns and sub columns from 1 to 12
- Added more options to panels
- Added more options to typography
- Added more options to buttons

####0.1.0 - Initial Release

##Install
- Run script `rwd_email.sql` in your schema

##Run (example with apex_mail)
```language-sql
DECLARE
    l_body clob;
BEGIN    
    /*l_body := rwd_email.basic;
    l_body := rwd_email.hero;
    l_body := rwd_email.sidebar;*/
    l_body := rwd_email.sidebar_hero;

    apex_mail.send (
        p_to        => 'to@email.com',
        p_from      => 'from@email.com',
        p_body      => l_body,
        p_body_html => l_body,
        p_subj      => 'This is a responsive email');
        
    apex_mail.push_queue;
END;
```

---

It is based on Ink by ZURB http://zurb.com/ink/, wrapped in PL/SQL.

If you find bugs, you can fill an issue through Github, send me a tweet or an email and I'll try to fix them as fast as possible!