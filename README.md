#Oracle Responsive Email Templates
Here is an API for building Responsive Web Design Email Templates. Written in PL/SQL for Oracle development.

##Changelog
####1.1.0
- Templates are now parameterized
- More code refactoring

####1.0.0
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
- Run script `rwd_email.pks` and `rwd_email.pkb` in your schema

##Run (example with apex_mail)
```language-sql
DECLARE
    l_body     clob;
    l_content  rwd_email.t_content;
BEGIN    
    /******************************
    Initialize your content in here
    ******************************/
    l_content.logo_url := 'http://insum.ca/ia/swinsum/build/assets/img/logo-insum.png';    
    l_content.title := 'SIDEBAR HERO';
    l_content.welcome_title := 'Vincent,';
    l_content.sub_welcome_title := 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.';
    l_content.big_picture_url := 'http://insum.ca/ia/swinsum/build/assets/img/bg1.jpg';
    l_content.top_paragraph := 'Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.';
    l_content.bottom_paragraph := 'A small river named Duden flows by their place and supplies it with the necessary regelialia. <a href="#">This link! »</a>';
    l_content.bottom_paragraph_subtitle := ' This is a note.';
    l_content.bottom_paragraph := 'A small river named Duden flows by their place and supplies it with the necessary regelialia. <a href="#">This link! »</a>';
    l_content.left_paragraph := 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.';
    l_content.right_header := 'Header Thing';
    l_content.right_sub_header := 'Sub-head or something';
    l_content.social_title := 'Connect With Us:';
    l_content.contact_info := 'Contact Info:';
    l_content.contact_phone := 'Phone: <b>514.387.1670</b>';
    l_content.contact_email := 'Email: <a href="mailto:vmorneau@insum.ca">vmorneau@insum.ca</a>';
    l_content.footer_links := '<a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Unsubscribe</a>';

    /*l_body := rwd_email.basic(l_content);
    l_body := rwd_email.hero(l_content);
    l_body := rwd_email.sidebar(l_content);*/
    l_body := rwd_email.sidebar_hero(l_content);

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

Inspired by Zurb at http://zurb.com/ink/, wrapped in PL/SQL.

You can help by filling issues through Github.