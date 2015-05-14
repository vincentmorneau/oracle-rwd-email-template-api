create or replace PACKAGE rwd_email IS

    g_header_background_color 	constant varchar2(10) 	:= '#4A96C9';
    g_primary_button_color 		constant varchar2(10) 	:= '#4A96C9';
    g_font_family 				constant varchar2(100) 	:= '''Helvetica'', ''Arial'', sans-serif;';
    
    PROCEDURE basic (p_to in varchar2, p_from in varchar2);
    PROCEDURE hero (p_to in varchar2, p_from in varchar2);
    PROCEDURE sidebar (p_to in varchar2, p_from in varchar2);
    PROCEDURE sidebar_hero (p_to in varchar2, p_from in varchar2); 
    
end rwd_email;
/
create or replace PACKAGE BODY rwd_email IS

    /* Email CSS */
    FUNCTION print_global_css return clob IS
    BEGIN
        return '<style type="text/css">a:hover,a:active{color:#2795b6!important}a:visited,h1 a:active,h1 a:visited,h2 a:active,h2 a:visited,h3 a:active,h3 a:visited,h4 a:active,h4 a:visited,h5 a:active,h5 a:visited,h6 a:active,h6 a:visited{color:#2ba6cb!important}table.button:active td,table.button:visited td{background:#2795b6!important}table.button:visited td a{color:#fff!important}table.button:hover td,table.large-button:hover td,table.medium-button:hover td,table.small-button:hover td,table.tiny-button:hover td{background:#2795b6!important}table.button td a:visited,table.button:active td a,table.button:hover td a,table.large-button td a:visited,table.large-button:active td a,table.large-button:hover td a,table.medium-button td a:visited,table.medium-button:active td a,table.medium-button:hover td a,table.small-button td a:visited,table.small-button:active td a,table.small-button:hover td a,table.tiny-button td a:visited,table.tiny-button:active td a,table.tiny-button:hover td a{color:#fff!important}table.secondary:hover td{background:#d0d0d0!important;color:#555}table.secondary td a:visited,table.secondary:active td a,table.secondary:hover td a{color:#555!important}table.success:hover td{background:#457a1a!important}table.alert:hover td{background:#970b0e!important}table.facebook:hover td{background:#2d4473!important}table.twitter:hover td{background:#0087bb!important}table.google-plus:hover td{background:#C00!important}@media only screen and (max-width:600px){table[class=body] img{width:auto!important;height:auto!important}table[class=body] center{min-width:0!important}table[class=body] .container{width:95%!important}table[class=body] .row{width:100%!important;display:block!important}table[class=body] .wrapper{display:block!important;padding-right:0!important}table[class=body] .column,table[class=body] .columns{table-layout:fixed!important;float:none!important;width:100%!important;padding-right:0!important;padding-left:0!important;display:block!important}table[class=body] .wrapper.first .column,table[class=body] .wrapper.first .columns{display:table!important}table[class=body] table.column td,table[class=body] table.columns td{width:100%!important}table[class=body] .column td.one,table[class=body] .columns td.one{width:8.333333%!important}table[class=body] .column td.two,table[class=body] .columns td.two{width:16.666666%!important}table[class=body] .column td.three,table[class=body] .columns td.three{width:25%!important}table[class=body] .column td.four,table[class=body] .columns td.four{width:33.333333%!important}table[class=body] .column td.five,table[class=body] .columns td.five{width:41.666666%!important}table[class=body] .column td.six,table[class=body] .columns td.six{width:50%!important}table[class=body] .column td.seven,table[class=body] .columns td.seven{width:58.333333%!important}table[class=body] .column td.eight,table[class=body] .columns td.eight{width:66.666666%!important}table[class=body] .column td.nine,table[class=body] .columns td.nine{width:75%!important}table[class=body] .column td.ten,table[class=body] .columns td.ten{width:83.333333%!important}table[class=body] .column td.eleven,table[class=body] .columns td.eleven{width:91.666666%!important}table[class=body] .column td.twelve,table[class=body] .columns td.twelve{width:100%!important}table[class=body] td.offset-by-eight,table[class=body] td.offset-by-eleven,table[class=body] td.offset-by-five,table[class=body] td.offset-by-four,table[class=body] td.offset-by-nine,table[class=body] td.offset-by-one,table[class=body] td.offset-by-seven,table[class=body] td.offset-by-six,table[class=body] td.offset-by-ten,table[class=body] td.offset-by-three,table[class=body] td.offset-by-two{padding-left:0!important}table[class=body] table.columns td.expander{width:1px!important}table[class=body] .text-pad-right{padding-left:10px!important}table[class=body] .text-pad-left{padding-right:10px!important}table[class=body] .hide-for-small,table[class=body] .show-for-desktop{display:none!important}table[class=body] .hide-for-desktop,table[class=body] .show-for-small{display:inherit!important}table[class=body] .right-text-pad{padding-left:10px!important}table[class=body] .left-text-pad{padding-right:10px!important}}</style>';    
    END print_global_css;

    /* Email Header */
    FUNCTION print_global_header return clob IS
    BEGIN
        return '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' ||
                '<html xmlns="http://www.w3.org/1999/xhtml">' ||
                '<head>' ||
                    '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />' ||
                    '<meta name="viewport" content="width=device-width"/>' ||
                '</head>';
    END print_global_header;

    /* 
    An empty (and invisible) element added after the content element in a .columns table.
    It forces the content td to expand to the full width of the screen on small devices,
    instead of just the width of the content within the td.
    */
    FUNCTION print_expander return clob IS
    BEGIN
        return '<td class="expander" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; visibility: hidden; width: 0px; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 0;" align="left" valign="top"></td>';
    END print_expander;
    
    /* Email Footer */
    FUNCTION print_global_footer return clob IS
    BEGIN
        return '</html>';
    END print_global_footer;

    FUNCTION outer_body(p_content in clob) return clob IS
    BEGIN
        return '<body style="width: 100% !important; min-width: 100%; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; text-align: left; line-height: 19px; font-size: 14px; margin: 0; padding: 0;">'
            || p_content
            || '</body>';
    END outer_body;

    FUNCTION inner_body(p_content in clob) return clob IS
    BEGIN
        return '<table class="body" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; height: 100%; width: 100%; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">'
            || p_content
            || '</tr></table>';
    END inner_body;

    FUNCTION center_content(p_content in clob) return clob IS
    BEGIN
        return '<center style="width: 100%; min-width: 580px;">'
            || p_content
            || '</center>';
    END center_content;

    FUNCTION print_image(l_img_url in varchar2) return clob IS
    BEGIN
        return '<img src="' || l_img_url || '" style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; width: auto; max-width: 100%; float: left; clear: both; display: block;" align="left" />';
    END print_image;

    FUNCTION print_hr return clob IS
    BEGIN
        return '<hr style="color: #d9d9d9; height: 1px; background: #d9d9d9; border: none;" />';
    END print_hr;
    
    FUNCTION print_col_6 (p_content in clob) return clob IS
    BEGIN
        return '<table class="six columns" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 280px; margin: 0 auto; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' || p_content || print_expander || '</tr></table>';
    END print_col_6;
    
    FUNCTION print_col_12 (p_content in clob) return clob IS
    BEGIN
        return '<table class="twelve columns" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 580px; margin: 0 auto; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' || p_content || print_expander || '</tr></table>';
    END print_col_12;
    
    FUNCTION print_sub_col_6 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return '<td class="six sub-columns" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: middle; text-align: ' || p_align || '; min-width: 0px; width: 50%; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 0px 10px 10px 0px;" align="' || p_align || '" valign="middle">'
            || p_content
            || '</td>';
    END print_sub_col_6;    
    
    FUNCTION print_container (p_content in clob) return clob IS
    BEGIN
        return '<table class="container" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: inherit; width: 580px; margin: 0 auto; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' || p_content || '</tr></table>';
    END print_container;
    
    FUNCTION print_row (p_content in clob) return clob IS
    BEGIN
        return '<table class="row" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; position: relative; display: block; padding: 0px;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' || p_content || '</tr></table>';
    END print_row;
    
    FUNCTION print_row_header (p_content in clob) return clob IS
    BEGIN
        return '<table class="row header" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; position: relative; background: ' || g_header_background_color || '; padding: 0px;" bgcolor="' || g_header_background_color || '"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' || p_content || '</tr></table>';
    END print_row_header;
    
    FUNCTION print_wrapper (p_content in clob) return clob IS
    BEGIN
        return '<td class="wrapper" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; position: relative; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 10px 20px 0px 0px;" align="left" valign="top">' || p_content || '</td>';
    END print_wrapper;
    
    FUNCTION print_panel (p_content in clob, p_background_color in varchar2 default '#f2f2f2', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<td class="panel" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; color: ' || p_text_color || '; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; background: ' || p_background_color || '; margin: 0; padding: 10px; border: 1px solid #d9d9d9;" align="left" bgcolor="' || p_background_color || '" valign="top">' || p_content || '</td>';
    END print_panel;
    
    FUNCTION print_standard_container (p_content in clob) return clob IS
    BEGIN
        return '<td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 0px 0px 10px;" align="left" valign="top">' || p_content || '</td>';
    END print_standard_container;
    
    FUNCTION print_center_container (p_content in clob) return clob IS
    BEGIN
        return '<td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: center; color: #222222; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; margin: 0; padding: 0px 0px 10px;" align="center" valign="top">' || p_content || '</td>';
    END print_center_container;

    FUNCTION print_paragraph (p_text in varchar2, p_align in varchar2 default 'left', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<p style="color: ' || p_text_color || '; font-family: ' || g_font_family || ' font-weight: normal; text-align: ' || p_align || '; line-height: 19px; font-size: 14px; margin: 0 0 10px; padding: 0;" align="' || p_align || '">' || p_text || '</p>';
    END print_paragraph;

    FUNCTION print_paragraph_lead (p_text in varchar2, p_align in varchar2 default 'left', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<p class="lead" style="color: ' || p_text_color || '; font-family: ' || g_font_family || ' font-weight: normal; text-align: ' || p_align || '; line-height: 21px; font-size: 18px; margin: 0 0 10px; padding: 0;" align="' || p_align || '">' || p_text || '</p>';
    END print_paragraph_lead;

    FUNCTION print_h1(p_text in varchar2, p_align in varchar2 default 'left', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<h1 style="color: ' || p_text_color || '; font-family: ' || g_font_family || ' font-weight: normal; text-align: ' || p_align || '; line-height: 1.3; word-break: normal; font-size: 40px; margin: 0; padding: 0;" align="' || p_align || '">' || p_text || '</h1>';
    END print_h1;

    FUNCTION print_h3(p_text in varchar2, p_align in varchar2 default 'left', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<h3 style="color: ' || p_text_color || '; font-family: ''Helvetica'',''Arial'', sans-serif; font-weight: normal; text-align: ' || p_align || '; line-height: 1.3; word-break: normal; font-size: 32px; margin: 0; padding: 0;" align="' || p_align || '">' || p_text || '</h3>';
    END print_h3;

    FUNCTION print_h6(p_text in varchar2, p_align in varchar2 default 'left', p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<h6 style="color: ' || p_text_color || '; font-family: ' || g_font_family || ' font-weight: normal; text-align: ' || p_align || '; line-height: 1.3; word-break: normal; font-size: 20px; margin: 0 0 5px; padding: 0;" align="' || p_align || '">' || p_text || '</h6>';
    END print_h6;

    FUNCTION print_small_text(p_text in varchar2, p_text_color in varchar2 default '#222222') return clob IS
    BEGIN
        return '<small style="font-size: 10px;">' || p_text || '</small>';
    END print_small_text;

    FUNCTION print_template_label(p_text in varchar2, p_text_color in varchar2 default '#ffffff') return clob IS
    BEGIN
        return '<span class="template-label" style="color: ' || p_text_color || '; font-weight: bold; font-size: 11px;">' || p_text || '</span>';
    END print_template_label;   

    FUNCTION print_plain_link (p_url in clob, p_label in clob) return clob IS
    BEGIN
        return '<table style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' 
            || print_standard_container(
                '<a href="' || p_url || '" style="color: ' || g_primary_button_color || '; text-decoration: none;">' || p_label || '</a>'
            )
            || '</tr></table>';
    END print_plain_link;
    
    FUNCTION print_button (p_url in clob, p_label in clob) return clob IS
    BEGIN
        return '<table class="button" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; overflow: hidden; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left"><td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: center; color: #ffffff; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; display: block; width: auto !important; background: ' || g_primary_button_color || '; margin: 0; padding: 8px 0; border: 1px solid #2284a1;" align="center" bgcolor="' || g_primary_button_color || '" valign="top">'
            || '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: bold; font-family: Helvetica, Arial, sans-serif; font-size: 16px;">' || p_label || '</a>'
            || '</td></tr></table>';
    END print_button;

    FUNCTION print_button_facebook (p_url in clob, p_label in clob) return clob IS
    BEGIN
        return '<table class="tiny-button facebook" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; overflow: hidden; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left"><td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: center; color: #ffffff; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; display: block; width: auto !important; background: #3b5998; margin: 0; padding: 5px 0 4px; border: 1px solid #2d4473;" align="center" bgcolor="#3b5998" valign="top">'
            || '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: normal; font-family: Helvetica, Arial, sans-serif; font-size: 12px;">' || p_label || '</a>'
            || '</td></tr></table>';
    END print_button_facebook;
    
    FUNCTION print_button_twitter (p_url in clob, p_label in clob) return clob IS
    BEGIN
        return '<table class="tiny-button twitter" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; overflow: hidden; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left"><td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: center; color: #ffffff; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; display: block; width: auto !important; background: #00acee; margin: 0; padding: 5px 0 4px; border: 1px solid #0087bb;" align="center" bgcolor="#00acee" valign="top">'
            || '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: normal; font-family: Helvetica, Arial, sans-serif; font-size: 12px;">' || p_label || '</a>'
            || '</td></tr></table>';
    END print_button_twitter;
    
    FUNCTION print_button_google_plus (p_url in clob, p_label in clob) return clob IS
    BEGIN
        return '<table class="tiny-button google-plus" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; overflow: hidden; padding: 0;"><tr style="vertical-align: top; text-align: left; padding: 0;" align="left"><td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: center; color: #ffffff; font-family: ' || g_font_family || ' font-weight: normal; line-height: 19px; font-size: 14px; display: block; width: auto !important; background: #DB4A39; margin: 0; padding: 5px 0 4px; border: 1px solid #cc0000;" align="center" bgcolor="#DB4A39" valign="top">'
            || '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: normal; font-family: Helvetica, Arial, sans-serif; font-size: 12px;">' || p_label || '</a>'
            || '</td></tr></table>';
    END print_button_google_plus; 
    
    FUNCTION print_default_body_header(p_logo_url in varchar2, p_title in varchar2) return clob IS
    BEGIN
        return 	print_row_header(
	                print_center_container(
	                    center_content(
	                        print_container(
	                            print_wrapper(
	                                print_col_12(
	                                    print_sub_col_6(print_image(p_logo_url), 'left')
	                                    || print_sub_col_6(print_template_label(p_title), 'right')
	                                )
	                            )
	                        )
	                    )
	                )
	            )
                || '<br />';
    END print_default_body_header;
    
    FUNCTION print_default_body_footer(p_footer_links in varchar2) return clob IS
    BEGIN
        return 	'<br /><br />'
                || print_row(
                    print_wrapper(
                        print_col_12(
                            print_center_container(
                                center_content(
                                    print_paragraph(p_footer_links, 'center')
                                )
                            )
                        )
                    )
                );
    END print_default_body_footer;
    
    FUNCTION print_global_body(p_content in clob) return clob IS
    BEGIN
        return 	print_global_header 
                || outer_body(
                    print_global_css
                        || inner_body(
                            print_center_container(p_content)
                        )
                    )
                || print_global_footer;
    END print_global_body;  

    /* Basic Template */
    PROCEDURE basic (p_to in varchar2, p_from in varchar2) IS
        l_body              clob;
        l_subj              varchar2(100) := 'This is a "basic" responsive email.';
        
        l_logo_url          varchar2(4000);
        l_title             varchar2(4000);
        l_welcome_title     varchar2(4000);
        l_sub_welcome_title varchar2(4000);
        l_top_paragraph     varchar2(4000);
        l_bottom_paragraph  varchar2(4000);
        l_social_title      varchar2(4000);
        l_contact_info      varchar2(4000);
        l_contact_phone     varchar2(4000);
        l_contact_email     varchar2(4000);
        l_footer_links      varchar2(4000);
    BEGIN
        /* 
        Initialize Variables
        Your code goes here
        */  
        l_logo_url := 'http://insum.ca/ia/swinsum/build/assets/img/logo-insum.png';
        l_title := 'BASIC';
        l_welcome_title := 'Vincent,';
        l_sub_welcome_title := 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.';
        l_top_paragraph := 'Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.';
        l_bottom_paragraph := 'A small river named Duden flows by their place and supplies it with the necessary regelialia. <a href="#">This link! »</a>';
        l_social_title := 'Connect With Us:';
        l_contact_info := 'Contact Info:';
        l_contact_phone := 'Phone: <b>514.387.1670</b>';
        l_contact_email := 'Email: <a href="mailto:vmorneau@insum.ca">vmorneau@insum.ca</a>';
        l_footer_links := '<a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Unsubscribe</a>';
        
        /* Build the email body */
        l_body :=   print_global_body(
                        print_default_body_header(l_logo_url, l_title)
                    	|| print_container(
                            print_standard_container(
                                print_row(
                                    print_wrapper(
                                        print_col_12(
                                            print_standard_container(
                                                print_h1(l_welcome_title)
                                                || print_paragraph_lead(l_sub_welcome_title)
                                                || print_paragraph(l_top_paragraph)
                                                || print_paragraph(l_top_paragraph)
                                                || print_paragraph(l_top_paragraph)
                                            ) 
                                        )
                                        || print_col_12(
                                            print_panel(p_content => print_paragraph(p_text => l_bottom_paragraph)
                                                        , p_background_color => '#ECF8FF')
                                        )
                                    )
                                )
                                || '<br />'
                                || print_row(
                                    print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_social_title)
                                                || print_button_facebook('#', 'Facebook')
                                                || print_hr
                                                || print_button_twitter('#', 'Twitter')
                                                || print_hr
                                                || print_button_google_plus('#', 'Google+')
                                            )
                                        )
                                    )
                                    || print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_contact_info)
                                                || print_paragraph(l_contact_phone)
                                                || print_paragraph(l_contact_email)
                                            )
                                        )
                                    )
                                )
                            	|| print_default_body_footer(l_footer_links)
                            )
                        )
                    );
    
        /* Send email */
        apex_mail.send (
            p_to        => p_to,
            p_from      => p_from,
            p_body      => l_body,
            p_body_html => l_body,
            p_subj      => l_subj);
            
        apex_mail.push_queue;
    END basic;

    /* Hero Template */
    PROCEDURE hero (p_to in varchar2, p_from in varchar2) IS
        l_body              		clob;
        l_subj              		varchar2(100) := 'This is a "hero" responsive email.';
        
        l_logo_url          		varchar2(4000);
        l_title             		varchar2(4000);
        l_welcome_title     		varchar2(4000);
        l_sub_welcome_title 		varchar2(4000);
        l_big_picture_url   		varchar2(4000);
        l_top_paragraph     		varchar2(4000);
        l_bottom_paragraph  		varchar2(4000);
        l_bottom_paragraph_title  	varchar2(4000);
        l_bottom_paragraph_subtitle varchar2(4000);
        l_social_title      		varchar2(4000);
        l_contact_info      		varchar2(4000);
        l_contact_phone     		varchar2(4000);
        l_contact_email     		varchar2(4000);
        l_footer_links      		varchar2(4000);
    BEGIN
        /* 
        Initialize Variables
        Your code goes here
        */  
        l_logo_url := 'http://insum.ca/ia/swinsum/build/assets/img/logo-insum.png';
        l_title := 'HERO';
        l_welcome_title := 'Vincent,';
        l_sub_welcome_title := 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.';
        l_big_picture_url := 'http://insum.ca/ia/swinsum/build/assets/img/bg1.jpg';
        l_top_paragraph := 'Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.';
        l_bottom_paragraph_title := 'Bottom Paragraph Title';
        l_bottom_paragraph_subtitle := ' This is a note.';
        l_bottom_paragraph := 'A small river named Duden flows by their place and supplies it with the necessary regelialia. <a href="#">This link! »</a>';
        l_social_title := 'Connect With Us:';
        l_contact_info := 'Contact Info:';
        l_contact_phone := 'Phone: <b>514.387.1670</b>';
        l_contact_email := 'Email: <a href="mailto:vmorneau@insum.ca">vmorneau@insum.ca</a>';
        l_footer_links := '<a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Unsubscribe</a>';
        
        /* Build the email body */
        l_body :=   print_global_body(
                        print_default_body_header(l_logo_url, l_title)
                        || print_container(
                            print_standard_container(
                                print_row(
                                    print_wrapper(
                                        print_col_12(
                                            print_standard_container(
                                                print_h1(l_welcome_title)
                                                || print_paragraph_lead(l_sub_welcome_title)
                                                || print_image(l_big_picture_url)
                                            ) 
                                        )
                                        || print_col_12(
                                            print_panel(
                                                p_content           =>  print_paragraph(
                                                                            p_text => l_top_paragraph)
                                                ,p_background_color => '#ECF8FF')
                                        )
                                        || '<br />'
                                        || print_col_12(
                                            print_h3(l_bottom_paragraph_title
                                                    || print_small_text(l_bottom_paragraph_subtitle))
                                            || print_paragraph(
                                                    p_text => l_bottom_paragraph)
                                        )
                                    )
                                )
                                || '<br />'
                                || print_row(
                                    print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_social_title)
                                                || print_button_facebook('#', 'Facebook')
                                                || print_hr
                                                || print_button_twitter('#', 'Twitter')
                                                || print_hr
                                                || print_button_google_plus('#', 'Google+')
                                            )
                                        )
                                    )
                                    || print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_contact_info)
                                                || print_paragraph(l_contact_phone)
                                                || print_paragraph(l_contact_email)
                                            )
                                        )
                                    )
                                )
                            	|| print_default_body_footer(l_footer_links)
                            )
                        )
                    );
    
        /* Send email */
        apex_mail.send (
            p_to        => p_to,
            p_from      => p_from,
            p_body      => l_body,
            p_body_html => l_body,
            p_subj      => l_subj);
            
        apex_mail.push_queue;
    END hero;
    
    /* Sidebar Template */
    PROCEDURE sidebar (p_to in varchar2, p_from in varchar2) IS
        l_body              clob;
        l_subj              varchar2(100) := 'This is a "sidebar" responsive email.';
        
        l_logo_url          varchar2(4000);
        l_title             varchar2(4000);
        l_welcome_title     varchar2(4000);
        l_sub_welcome_title varchar2(4000);
        l_big_picture_url   varchar2(4000);
        l_top_paragraph     varchar2(4000);
        l_left_paragraph    varchar2(4000);
        l_right_header      varchar2(4000);
        l_right_sub_header  varchar2(4000);
        l_social_title      varchar2(4000);
        l_contact_info      varchar2(4000);
        l_contact_phone     varchar2(4000);
        l_contact_email     varchar2(4000);
        l_footer_links      varchar2(4000);
    BEGIN
        /* 
        Initialize Variables
        Your code goes here
        */  
        l_logo_url := 'http://insum.ca/ia/swinsum/build/assets/img/logo-insum.png';
        l_title := 'SIDEBAR';
        l_welcome_title := 'Vincent,';
        l_sub_welcome_title := 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.';
        l_top_paragraph := 'Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra vitae. <a href="#">Click it! »</a>';
        l_left_paragraph := 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.';
        l_right_header := 'Header Thing';
        l_right_sub_header := 'Sub-head or something';
        l_social_title := 'Connect With Us:';
        l_contact_info := 'Contact Info:';
        l_contact_phone := 'Phone: <b>514.387.1670</b>';
        l_contact_email := 'Email: <a href="mailto:vmorneau@insum.ca">vmorneau@insum.ca</a>';
        l_footer_links := '<a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Unsubscribe</a>';
        
        /* Build the email body */
        l_body :=   print_global_body(
                        print_default_body_header(l_logo_url, l_title)
                    	|| print_container(
                            print_standard_container(
                                print_row(
                                    print_wrapper(
                                        print_col_6(
                                            print_standard_container(
                                                print_h1(l_welcome_title)
                                                || print_paragraph(l_sub_welcome_title)
                                                || print_paragraph(l_left_paragraph)
                                            )
                                        )
                                        || '<br />'
                                        || print_col_6(
                                        	print_panel(print_paragraph(l_top_paragraph))
                                        )
                                        || '<br />'
                                        || print_col_6(
                                            print_standard_container(
                                            	print_paragraph(l_left_paragraph)
                                                || print_button ('#', 'Click Me!')
                                            )
                                        )
                                    )
                                    || print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_right_header)
                                                || print_paragraph(l_right_sub_header)
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                            )
                                        )
                                        || '<br />'
                                        || print_col_6(
                                            print_panel(
                                                print_h6(l_social_title)
                                                || print_button_facebook('#', 'Facebook')
                                                || print_hr
                                                || print_button_twitter('#', 'Twitter')
                                                || print_hr
                                                || print_button_google_plus('#', 'Google+')
                                                || '<br />'
                                                || print_h6(l_contact_info)
                                                || print_paragraph(l_contact_phone)
                                                || print_paragraph(l_contact_email)
                                            )
                                        )
                                    )
                                )
                            	|| print_default_body_footer(l_footer_links)
                            )
                        )
                    );
    
        /* Send email */
        apex_mail.send (
            p_to        => p_to,
            p_from      => p_from,
            p_body      => l_body,
            p_body_html => l_body,
            p_subj      => l_subj);
            
        apex_mail.push_queue;
    END sidebar;
    
    /* Sidebar Hero Template */
    PROCEDURE sidebar_hero (p_to in varchar2, p_from in varchar2) IS
        l_body              clob;
        l_subj              varchar2(100) := 'This is a "sidebar hero" responsive email.';
        
        l_logo_url          varchar2(4000);
        l_title             varchar2(4000);
        l_welcome_title     varchar2(4000);
        l_sub_welcome_title varchar2(4000);
        l_big_picture_url   varchar2(4000);
        l_top_paragraph     varchar2(4000);
        l_left_paragraph    varchar2(4000);
        l_right_header      varchar2(4000);
        l_right_sub_header  varchar2(4000);
        l_social_title      varchar2(4000);
        l_contact_info      varchar2(4000);
        l_contact_phone     varchar2(4000);
        l_contact_email     varchar2(4000);
        l_footer_links      varchar2(4000);
    BEGIN
        /* 
        Initialize Variables
        Your code goes here
        */  
        l_logo_url := 'http://insum.ca/ia/swinsum/build/assets/img/logo-insum.png';
        l_title := 'SIDEBAR HERO';
        l_welcome_title := 'Welcome, Vincent Morneau';
        l_sub_welcome_title := 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.';
        l_big_picture_url := 'http://insum.ca/ia/swinsum/build/assets/img/bg1.jpg';
        l_top_paragraph := 'Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra vitae. <a href="#">Click it! »</a>';
        l_left_paragraph := 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.';
        l_right_header := 'Header Thing';
        l_right_sub_header := 'Sub-head or something';
        l_social_title := 'Connect With Us:';
        l_contact_info := 'Contact Info:';
        l_contact_phone := 'Phone: <b>514.387.1670</b>';
        l_contact_email := 'Email: <a href="mailto:vmorneau@insum.ca">vmorneau@insum.ca</a>';
        l_footer_links := '<a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Unsubscribe</a>';
        
        /* Build the email body */
        l_body :=   print_global_body(
                        print_default_body_header(l_logo_url, l_title)
                        || print_container(
                            print_standard_container(
                                print_row(
                                    print_wrapper(
                                        print_col_12(
                                            print_standard_container(
                                                print_h1(l_welcome_title)
                                                || print_paragraph(l_sub_welcome_title)
                                                || print_image(l_big_picture_url)
                                            ) 
                                        )
                                        || print_col_12(
                                            print_panel(print_paragraph(l_top_paragraph))
                                        )
                                    )
                                )
                                || '<br />'
                                || print_row(
                                    print_wrapper(
                                        print_col_6(
                                            print_standard_container(
                                                print_paragraph(l_left_paragraph)
                                                || print_paragraph(l_left_paragraph)
                                                || print_paragraph(l_left_paragraph)
                                                || print_button ('#', 'Click Me!')
                                            )
                                        )
                                    )
                                    || print_wrapper(
                                        print_col_6(
                                            print_panel(
                                                print_h6(l_right_header)
                                                || print_paragraph(l_right_sub_header)
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                                || print_hr
                                                || print_plain_link('#', 'Just a Plain Link »')
                                            )
                                        )
                                        || '<br />'
                                        || print_col_6(
                                            print_panel(
                                                print_h6(l_social_title)
                                                || print_button_facebook('#', 'Facebook')
                                                || print_hr
                                                || print_button_twitter('#', 'Twitter')
                                                || print_hr
                                                || print_button_google_plus('#', 'Google+')
                                                || '<br />'
                                                || print_h6(l_contact_info)
                                                || print_paragraph(l_contact_phone)
                                                || print_paragraph(l_contact_email)
                                            )
                                        )
                                    )
                                )
                                || print_default_body_footer(l_footer_links)
                            )
                        )
                    );
    
        /* Send email */
        apex_mail.send (
            p_to        => p_to,
            p_from      => p_from,
            p_body      => l_body,
            p_body_html => l_body,
            p_subj      => l_subj);
            
        apex_mail.push_queue;
    END sidebar_hero;
    
END rwd_email;
/