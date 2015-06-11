create or replace PACKAGE rwd_email IS

    /**********************************************
    ***********************************************
    ***********************************************
    CONSTANTS
    ***********************************************
    ***********************************************
    **********************************************/ 
    g_header_background_color   constant varchar2(25)   := '#4A96C9';
    g_primary_button_bgcolor    constant varchar2(25)   := '#4A96C9';
    g_primary_button_text_color constant varchar2(25)   := '#FFFFFF';
    g_text_color                constant varchar2(25)   := '#222222';
    g_body_background           constant varchar2(25)   := 'transparent';
    g_font_family               constant varchar2(100)  := '''Helvetica'', ''Arial'', sans-serif';
    g_line_height               constant varchar2(25)   := '19px';
    g_font_size                 constant varchar2(25)   := '14px';
    
        /**********************************************
    ***********************************************
    ***********************************************
    GLOBAL STUFF
    ***********************************************
    ***********************************************
    **********************************************/ 

    /* 
    Global Header
    */
    FUNCTION print_global_header return clob;

    /* 
    Global CSS 
    */
    FUNCTION print_global_css return clob;

    /* 
    Global Body HTML tag
    */
    FUNCTION outer_body(p_content in clob) return clob;

    /* 
    Global Mandatory Table to wrap the body content
    */
    FUNCTION inner_body(p_content in clob) return clob;
    
    /* Email Footer */
    FUNCTION print_global_end return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    GRID
    ***********************************************
    ***********************************************
    **********************************************/
    
    /* 
    Constrains the content to a 580px wrapper on large screens (95% on small screens) and centers it within the body.
    */
    FUNCTION print_container (p_content in clob) return clob;
    
    /* 
    Separates each row of content.
    */    
    FUNCTION print_row (
        p_content in clob
        , p_classes in varchar2 default null
        , p_display in varchar2 default 'block'
        , p_header_background_color in varchar2 default 'transparent') return clob;
    
    /* 
    Grid Standard TD
    */
    FUNCTION print_standard_td (
        p_content in clob
        , p_align in varchar2 default 'left'
        , p_padding in varchar2 default '0 0 10px'
        , p_background_color in varchar2 default 'transparent'
        , p_border in varchar2 default 'none'
        , p_extra_attributes in varchar2 default null)
    return clob;
    
    /* 
    Grid Standard TD Centered
    */
    FUNCTION print_standard_td_center (p_content in clob) return clob;
    
    /*
    Wraps each .columns table, in order to create a gutter between columns
    and force them to expand to full width on small screens.
    */
    FUNCTION print_column_wrapper (p_content in clob) return clob;
    
    /*
    Can be any number between one and twelve (spelled out). 
    Used to determine how wide your .columns tables are. 
    The number of columns in each row should add up to 12, including offset columns .
    */
    FUNCTION print_col (p_content in clob, p_number in varchar2, p_width in varchar2) return clob;
    
    /*
    1 Columns
    */
    FUNCTION print_col_1 (p_content in clob) return clob;
    
    /*
    2 Columns
    */
    FUNCTION print_col_2 (p_content in clob) return clob;
    
    /*
    3 Columns
    */
    FUNCTION print_col_3 (p_content in clob) return clob;
    
    /*
    4 Columns
    */
    FUNCTION print_col_4 (p_content in clob) return clob;
    
    /*
    5 Columns
    */
    FUNCTION print_col_5 (p_content in clob) return clob;
    
    /*
    6 Columns
    */
    FUNCTION print_col_6 (p_content in clob) return clob;
    
    /*
    7 Columns
    */
    FUNCTION print_col_7 (p_content in clob) return clob;
    
    /*
    8 Columns
    */
    FUNCTION print_col_8 (p_content in clob) return clob;
    
    /*
    9 Columns
    */
    FUNCTION print_col_9 (p_content in clob) return clob;
    
    /*
    10 Columns
    */
    FUNCTION print_col_10 (p_content in clob) return clob;
    
    /*
    11 Columns
    */
    FUNCTION print_col_11 (p_content in clob) return clob;
    
    /*
    12 Columns
    */
    FUNCTION print_col_12 (p_content in clob) return clob;

    /* 
    An empty (and invisible) element added after the content element in a .columns table.
    It forces the content td to expand to the full width of the screen on small devices,
    instead of just the width of the content within the td.
    */
    FUNCTION print_expander return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    SUB GRID
    ***********************************************
    ***********************************************
    **********************************************/
        
    /*
    Can be any number between one and twelve (spelled out). 
    Used to determine how wide your .columns tables are. 
    The number of sub columns in each row should add up to 12, including offset sub columns .
    */
    FUNCTION print_sub_col (p_content in clob
        , p_classes in varchar2
        , p_width in varchar2
        , p_align in varchar2 default 'left') return clob;
    
    /*
    1 Sub Columns
    */
    FUNCTION print_sub_col_1 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    2 Sub Columns
    */
    FUNCTION print_sub_col_2 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    3 Sub Columns
    */
    FUNCTION print_sub_col_3 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    4 Sub Columns
    */
    FUNCTION print_sub_col_4 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    5 Sub Columns
    */
    FUNCTION print_sub_col_5 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    6 Sub Columns
    */
    FUNCTION print_sub_col_6 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    7 Sub Columns
    */
    FUNCTION print_sub_col_7 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    8 Sub Columns
    */
    FUNCTION print_sub_col_8 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    9 Sub Columns
    */
    FUNCTION print_sub_col_9 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    10 Sub Columns
    */
    FUNCTION print_sub_col_10 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    11 Sub Columns
    */
    FUNCTION print_sub_col_11 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /*
    12 Sub Columns
    */
    FUNCTION print_sub_col_12 (p_content in clob, p_align in varchar2 default 'left') return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    PANELS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_panel (p_content in clob, p_background_color in varchar2 default '#f2f2f2', p_text_color in varchar2 default g_text_color) return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    TYPOGRAPHY
    ***********************************************
    ***********************************************
    **********************************************/
    
    /*
    Prints a standard paragraph
    */
    FUNCTION print_paragraph (
        p_text in varchar2
        , p_classes in varchar2 default null
        , p_font_size in varchar2 default '14px'
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints a bigger paragraph
    */
    FUNCTION print_paragraph_lead (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H tag
    */
    FUNCTION print_h (
        p_text in varchar2
        , p_h_size in varchar2
        , p_font_size in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H1 tag
    */
    FUNCTION print_h1 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H2 tag
    */
    FUNCTION print_h2 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H3 tag
    */
    FUNCTION print_h3 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H4 tag
    */
    FUNCTION print_h4 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H5 tag
    */
    FUNCTION print_h5 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints an H6 tag
    */
    FUNCTION print_h6(
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints a small text
    */
    FUNCTION print_small_text(p_text in varchar2, p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints a label for the title bar
    */
    FUNCTION print_title(p_text in varchar2, p_text_color in varchar2 default '#ffffff') return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    BUTTONS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_button (
        p_content in clob
        , p_button_classes in varchar2 default 'button'
        , p_align in varchar2 default 'left'
        , p_padding in varchar2 default '0 0 10px'
        , p_background_color in varchar2 default 'transparent'
        , p_border in varchar2 default 'none'
        , p_extra_style in varchar2 default null) return clob;

    FUNCTION print_plain_link (p_url in clob, p_label in clob) return clob;
    
    FUNCTION print_primary_button (p_url in clob, p_label in clob) return clob;

    FUNCTION print_button_facebook (p_url in clob, p_label in clob) return clob;
    
    FUNCTION print_button_twitter (p_url in clob, p_label in clob) return clob;
    
    FUNCTION print_button_google_plus (p_url in clob, p_label in clob) return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    OTHER FEATURES
    ***********************************************
    ***********************************************
    **********************************************/

    /*
    Print an image through a URL
    Can be aligned left, center or right
    */
    FUNCTION print_image(p_img_url in varchar2, p_align in varchar2 default 'left') return clob;
    
    /*
    Simple line to separate content
    */
    FUNCTION print_hr return clob;
    
    /**********************************************
    ***********************************************
    ***********************************************
    COMMON PATTERNS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_default_body_header(p_logo_url in varchar2, p_title in varchar2) return clob;
    
    FUNCTION print_default_body_footer(p_footer_links in varchar2) return clob;
    
    FUNCTION print_global_body(p_content in clob) return clob;

    /**********************************************
    ***********************************************
    ***********************************************
    PRESET TEMPLATES
    ***********************************************
    ***********************************************
    **********************************************/     
    FUNCTION basic return clob;
    FUNCTION hero return clob;
    FUNCTION sidebar return clob;
    FUNCTION sidebar_hero return clob; 
    
end rwd_email;
/
create or replace PACKAGE BODY rwd_email IS
    
    /**********************************************
    ***********************************************
    ***********************************************
    GLOBAL STUFF
    ***********************************************
    ***********************************************
    **********************************************/ 

    /* 
    Global Header
    */
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
    Global CSS 
    */
    FUNCTION print_global_css return clob IS
    BEGIN
        return '<style type="text/css">a:hover,a:active{color:#2795b6!important}a:visited,h1 a:active,h1 a:visited,h2 a:active,h2 a:visited,h3 a:active,h3 a:visited,h4 a:active,h4 a:visited,h5 a:active,h5 a:visited,h6 a:active,h6 a:visited{color:#2ba6cb!important}table.button:active td,table.button:visited td{background:#2795b6!important}table.button:visited td a{color:#fff!important}table.button:hover td,table.large-button:hover td,table.medium-button:hover td,table.small-button:hover td,table.tiny-button:hover td{background:#2795b6!important}table.button td a:visited,table.button:active td a,table.button:hover td a,table.large-button td a:visited,table.large-button:active td a,table.large-button:hover td a,table.medium-button td a:visited,table.medium-button:active td a,table.medium-button:hover td a,table.small-button td a:visited,table.small-button:active td a,table.small-button:hover td a,table.tiny-button td a:visited,table.tiny-button:active td a,table.tiny-button:hover td a{color:#fff!important}table.secondary:hover td{background:#d0d0d0!important;color:#555}table.secondary td a:visited,table.secondary:active td a,table.secondary:hover td a{color:#555!important}table.success:hover td{background:#457a1a!important}table.alert:hover td{background:#970b0e!important}table.facebook:hover td{background:#2d4473!important}table.twitter:hover td{background:#0087bb!important}table.google-plus:hover td{background:#C00!important}@media only screen and (max-width:600px){table[class=body] img{width:auto!important;height:auto!important}table[class=body] center{min-width:0!important}table[class=body] .container{width:95%!important}table[class=body] .row{width:100%!important;display:block!important}table[class=body] .wrapper{display:block!important;padding-right:0!important}table[class=body] .column,table[class=body] .columns{table-layout:fixed!important;float:none!important;width:100%!important;padding-right:0!important;padding-left:0!important;display:block!important}table[class=body] .wrapper.first .column,table[class=body] .wrapper.first .columns{display:table!important}table[class=body] table.column td,table[class=body] table.columns td{width:100%!important}table[class=body] .column td.one,table[class=body] .columns td.one{width:8.333333%!important}table[class=body] .column td.two,table[class=body] .columns td.two{width:16.666666%!important}table[class=body] .column td.three,table[class=body] .columns td.three{width:25%!important}table[class=body] .column td.four,table[class=body] .columns td.four{width:33.333333%!important}table[class=body] .column td.five,table[class=body] .columns td.five{width:41.666666%!important}table[class=body] .column td.six,table[class=body] .columns td.six{width:50%!important}table[class=body] .column td.seven,table[class=body] .columns td.seven{width:58.333333%!important}table[class=body] .column td.eight,table[class=body] .columns td.eight{width:66.666666%!important}table[class=body] .column td.nine,table[class=body] .columns td.nine{width:75%!important}table[class=body] .column td.ten,table[class=body] .columns td.ten{width:83.333333%!important}table[class=body] .column td.eleven,table[class=body] .columns td.eleven{width:91.666666%!important}table[class=body] .column td.twelve,table[class=body] .columns td.twelve{width:100%!important}table[class=body] td.offset-by-eight,table[class=body] td.offset-by-eleven,table[class=body] td.offset-by-five,table[class=body] td.offset-by-four,table[class=body] td.offset-by-nine,table[class=body] td.offset-by-one,table[class=body] td.offset-by-seven,table[class=body] td.offset-by-six,table[class=body] td.offset-by-ten,table[class=body] td.offset-by-three,table[class=body] td.offset-by-two{padding-left:0!important}table[class=body] table.columns td.expander{width:1px!important}table[class=body] .text-pad-right{padding-left:10px!important}table[class=body] .text-pad-left{padding-right:10px!important}table[class=body] .hide-for-small,table[class=body] .show-for-desktop{display:none!important}table[class=body] .hide-for-desktop,table[class=body] .show-for-small{display:inherit!important}table[class=body] .right-text-pad{padding-left:10px!important}table[class=body] .left-text-pad{padding-right:10px!important}}</style>';    
    END print_global_css;

    /* 
    Global Body HTML tag
    */
    FUNCTION outer_body(
        p_content in clob) return clob IS
    BEGIN
        return '<body style="background:' || g_body_background || '; width: 100% !important; min-width: 100%; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; text-align: left; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: 0;">'
            || p_content
            || '</body>';
    END outer_body;

    /* 
    Global Mandatory Table to wrap the body content
    */
    FUNCTION inner_body(
        p_content in clob) return clob IS
    BEGIN
        return '<table class="body" style="background:' || g_body_background || '; border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; height: 100%; width: 100%; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: 0;">'
            || '<tr style="vertical-align: top; text-align: left; padding: 0;" align="left">'
            || p_content
            || '</tr>'
            || '</table>';
    END inner_body;
    
    /* Email Footer */
    FUNCTION print_global_end return clob IS
    BEGIN
        return '</html>';
    END print_global_end;
    
    /**********************************************
    ***********************************************
    ***********************************************
    GRID
    ***********************************************
    ***********************************************
    **********************************************/
    
    /* 
    Constrains the content to a 580px wrapper on large screens (95% on small screens) and centers it within the body.
    */
    FUNCTION print_container (
        p_content in clob) return clob IS
    BEGIN
        return '<table class="container" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: inherit; width: 580px; margin: 0 auto; padding: 0;">'
            || '<tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' 
            || print_standard_td(p_content)
            || '</tr>'
            || '</table>';
    END print_container;
    
    /* 
    Separates each row of content.
    */    
    FUNCTION print_row (
        p_content in clob
        , p_classes in varchar2 default null
        , p_display in varchar2 default 'block'
        , p_header_background_color in varchar2 default 'transparent') return clob IS
    BEGIN
        return '<table class="row ' || p_classes || '" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; position: relative; background: ' || p_header_background_color || '; display: ' || p_display || '; padding: 0px;" bgcolor="' || p_header_background_color || '">'
            || '<tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' 
            || p_content 
            || '</tr>'
            || '</table>';
    END print_row;
    
    /* 
    Grid Standard TD
    */
    FUNCTION print_standard_td (
        p_content in clob
        , p_align in varchar2 default 'left'
        , p_padding in varchar2 default '0 0 10px'
        , p_background_color in varchar2 default 'transparent'
        , p_border in varchar2 default 'none'
        , p_extra_attributes in varchar2 default null)
    return clob IS
    BEGIN
        return '<td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: ' || p_align || '; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: ' || p_padding || ';" align="' || p_align || '" valign="top">' 
            || p_content 
            || '</td>';
    END print_standard_td;
    
    /* 
    Grid Standard TD Centered
    */
    FUNCTION print_standard_td_center (
        p_content in clob) return clob IS
    BEGIN
        return print_standard_td(
                p_content => '<center style="width: 100%; min-width: 580px;">'
                            || p_content
                            || '</center>'
                ,p_align => 'center'
            );
    END print_standard_td_center;
    
    /*
    Wraps each .columns table, in order to create a gutter between columns
    and force them to expand to full width on small screens.
    */
    FUNCTION print_column_wrapper (
        p_content in clob) return clob IS
    BEGIN
        return '<td class="wrapper" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; position: relative; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: 10px 20px 0px 0px;" align="left" valign="top">' 
        || p_content 
        || '</td>';
    END print_column_wrapper;
    
    /*
    Can be any number between one and twelve (spelled out). 
    Used to determine how wide your .columns tables are. 
    The number of columns in each row should add up to 12, including offset columns .
    */
    FUNCTION print_col (
        p_content in clob
        , p_number in varchar2
        , p_width in varchar2) return clob IS
    BEGIN
        return '<table class="' || p_number || ' columns" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: ' || p_width || '; margin: 0 auto; padding: 0;">'
            || '<tr style="vertical-align: top; text-align: left; padding: 0;" align="left">' 
            || p_content 
            || print_expander 
            || '</tr>'
            || '</table>';
    END print_col;
    
    /*
    1 Columns
    */
    FUNCTION print_col_1 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'one', '30px');
    END print_col_1;
    
    /*
    2 Columns
    */
    FUNCTION print_col_2 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'two', '80px');
    END print_col_2;
    
    /*
    3 Columns
    */
    FUNCTION print_col_3 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'three', '130px');
    END print_col_3;
    
    /*
    4 Columns
    */
    FUNCTION print_col_4 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'four', '180px');
    END print_col_4;
    
    /*
    5 Columns
    */
    FUNCTION print_col_5 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'five', '230px');
    END print_col_5;
    
    /*
    6 Columns
    */
    FUNCTION print_col_6 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'six', '280px');
    END print_col_6;
    
    /*
    7 Columns
    */
    FUNCTION print_col_7 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'seven', '330px');
    END print_col_7;
    
    /*
    8 Columns
    */
    FUNCTION print_col_8 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'eight', '380px');
    END print_col_8;
    
    /*
    9 Columns
    */
    FUNCTION print_col_9 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'nine', '430px');
    END print_col_9;
    
    /*
    10 Columns
    */
    FUNCTION print_col_10 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'ten', '480px');
    END print_col_10;
    
    /*
    11 Columns
    */
    FUNCTION print_col_11 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'eleven', '530px');
    END print_col_11;
    
    /*
    12 Columns
    */
    FUNCTION print_col_12 (p_content in clob) return clob IS
    BEGIN
        return print_col(p_content, 'twelve', '580px');
    END print_col_12;

    /* 
    An empty (and invisible) element added after the content element in a .columns table.
    It forces the content td to expand to the full width of the screen on small devices,
    instead of just the width of the content within the td.
    */
    FUNCTION print_expander return clob IS
    BEGIN
        return '<td class="expander" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; visibility: hidden; width: 0px; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: 0;" align="left" valign="top"></td>';
    END print_expander;
    
    /**********************************************
    ***********************************************
    ***********************************************
    SUB GRID
    ***********************************************
    ***********************************************
    **********************************************/
        
    /*
    Can be any number between one and twelve (spelled out). 
    Used to determine how wide your .columns tables are. 
    The number of sub columns in each row should add up to 12, including offset sub columns .
    */
    FUNCTION print_sub_col (p_content in clob
        , p_classes in varchar2
        , p_width in varchar2
        , p_align in varchar2 default 'left') return clob IS
    BEGIN
        return '<td class="sub-columns ' || p_classes || '" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: middle; text-align: ' || p_align || '; min-width: 0px; width: ' || p_width || '; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; margin: 0; padding: 0px 10px 10px 0px;" align="' || p_align || '" valign="middle">'
            || p_content
            || '</td>';
    END print_sub_col;
    
    /*
    1 Sub Columns
    */
    FUNCTION print_sub_col_1 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'one', round(100*1/12, 4) || '%', p_align);
    END print_sub_col_1;
    
    /*
    2 Sub Columns
    */
    FUNCTION print_sub_col_2 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'two', round(100*2/12, 4) || '%', p_align);
    END print_sub_col_2;
    
    /*
    3 Sub Columns
    */
    FUNCTION print_sub_col_3 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'three', round(100*3/12, 4) || '%', p_align);
    END print_sub_col_3;
    
    /*
    4 Sub Columns
    */
    FUNCTION print_sub_col_4 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'four', round(100*4/12, 4) || '%', p_align);
    END print_sub_col_4;
    
    /*
    5 Sub Columns
    */
    FUNCTION print_sub_col_5 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'five', round(100*5/12, 4) || '%', p_align);
    END print_sub_col_5;
    
    /*
    6 Sub Columns
    */
    FUNCTION print_sub_col_6 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'six', round(100*6/12, 4) || '%', p_align);
    END print_sub_col_6;
    
    /*
    7 Sub Columns
    */
    FUNCTION print_sub_col_7 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'seven', round(100*7/12, 4) || '%', p_align);
    END print_sub_col_7;
    
    /*
    8 Sub Columns
    */
    FUNCTION print_sub_col_8 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'eight', round(100*8/12, 4) || '%', p_align);
    END print_sub_col_8;
    
    /*
    9 Sub Columns
    */
    FUNCTION print_sub_col_9 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'nine', round(100*9/12, 4) || '%', p_align);
    END print_sub_col_9;
    
    /*
    10 Sub Columns
    */
    FUNCTION print_sub_col_10 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'ten', round(100*10/12, 4) || '%', p_align);
    END print_sub_col_10;
    
    /*
    11 Sub Columns
    */
    FUNCTION print_sub_col_11 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'eleven', round(100*11/12, 4) || '%', p_align);
    END print_sub_col_11;
    
    /*
    12 Sub Columns
    */
    FUNCTION print_sub_col_12 (p_content in clob, p_align in varchar2 default 'left') return clob IS
    BEGIN
        return print_sub_col(p_content, 'twelve', round(100*12/12, 4) || '%', p_align);
    END print_sub_col_12;
    
    /**********************************************
    ***********************************************
    ***********************************************
    PANELS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_panel (
        p_content in clob
        , p_background_color in varchar2 default '#f2f2f2'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return '<td class="panel" style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: left; color: ' || p_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; background: ' || p_background_color || '; margin: 0; padding: 10px; border: 1px solid #d9d9d9;" align="left" bgcolor="' || p_background_color || '" valign="top">' || p_content || '</td>';
    END print_panel;    
    
    /**********************************************
    ***********************************************
    ***********************************************
    TYPOGRAPHY
    ***********************************************
    ***********************************************
    **********************************************/
    
    /*
    Prints a standard paragraph
    */
    FUNCTION print_paragraph (
        p_text in varchar2
        , p_classes in varchar2 default null
        , p_font_size in varchar2 default '14px'
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return '<p class="' || p_classes || '" style="color: ' || p_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; text-align: ' || p_align || '; line-height: ' || g_line_height || '; font-size: ' || p_font_size || '; margin: 0 0 10px; padding: 0;" align="' || p_align || '">' || p_text || '</p>';
    END print_paragraph;

    /*
    Prints a bigger paragraph
    */
    FUNCTION print_paragraph_lead (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_paragraph (
            p_text => p_text
            , p_classes => 'lead'
            , p_font_size => '18px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_paragraph_lead;

    /*
    Prints an H tag
    */
    FUNCTION print_h (
        p_text in varchar2
        , p_h_size in varchar2
        , p_font_size in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return '<h' || p_h_size || ' style="color: ' || p_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; text-align: ' || p_align || '; line-height: 1.3; word-break: normal; font-size: ' || p_font_size || '; margin: 0; padding: 0;" align="' || p_align || '">' 
            || p_text 
            || '</h' || p_h_size || '>';
    END print_h;

    /*
    Prints an H1 tag
    */
    FUNCTION print_h1 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '1'
            , p_font_size => '40px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h1;

    /*
    Prints an H2 tag
    */
    FUNCTION print_h2 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '2'
            , p_font_size => '36px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h2;

    /*
    Prints an H3 tag
    */
    FUNCTION print_h3 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '3'
            , p_font_size => '32px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h3;

    /*
    Prints an H4 tag
    */
    FUNCTION print_h4 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '4'
            , p_font_size => '28px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h4;

    /*
    Prints an H5 tag
    */
    FUNCTION print_h5 (
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '5'
            , p_font_size => '24px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h5;

    /*
    Prints an H6 tag
    */
    FUNCTION print_h6(
        p_text in varchar2
        , p_align in varchar2 default 'left'
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return print_h (
            p_text => p_text
            , p_h_size => '6'
            , p_font_size => '20px'
            , p_align => p_align
            , p_text_color => p_text_color);
    END print_h6;

    /*
    Prints a small text
    */
    FUNCTION print_small_text(
        p_text in varchar2
        , p_text_color in varchar2 default g_text_color) return clob IS
    BEGIN
        return '<small style="font-size: 10px;">' || p_text || '</small>';
    END print_small_text;

    /*
    Prints a label for the title bar
    */
    FUNCTION print_title(
        p_text in varchar2
        , p_text_color in varchar2 default '#ffffff') return clob IS
    BEGIN
        return '<span class="template-label" style="color: ' || p_text_color || '; font-weight: bold; font-size: 11px;">' || p_text || '</span>';
    END print_title;   
    
    /**********************************************
    ***********************************************
    ***********************************************
    BUTTONS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_button (
        p_content in clob
        , p_button_classes in varchar2 default 'button'
        , p_align in varchar2 default 'left'
        , p_padding in varchar2 default '0 0 10px'
        , p_background_color in varchar2 default 'transparent'
        , p_border in varchar2 default 'none'
        , p_extra_style in varchar2 default null) return clob IS
    BEGIN
        return '<table class="' || p_button_classes || '" style="border-spacing: 0; border-collapse: collapse; vertical-align: top; text-align: left; width: 100%; overflow: hidden; padding: 0;">'
            || '<tr style="vertical-align: top; text-align: left; padding: 0;" align="left">'
            || '<td style="word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto; border-collapse: collapse !important; vertical-align: top; text-align: ' || p_align || '; color: ' || g_text_color || '; font-family: ' || g_font_family || '; font-weight: normal; line-height: ' || g_line_height || '; font-size: ' || g_font_size || '; background: ' || p_background_color || '; margin: 0; padding: ' || p_padding || '; border: ' || p_border || '; ' || p_extra_style || '" align="' || p_align || '" valign="top" bgcolor="' || p_background_color || '">' 
            || p_content 
            || '</td>'
            || '</tr>'
            || '</table>';
    END print_button;

    FUNCTION print_plain_link (
        p_url in clob
        , p_label in clob) return clob IS
    BEGIN
        return print_button(
                    p_content => '<a href="' || p_url || '" style="color: ' || g_text_color || '; text-decoration: none;">' || p_label || '</a>'
                );
    END print_plain_link;
    
    FUNCTION print_primary_button (
        p_url in clob
        , p_label in clob) return clob IS
    BEGIN
        return print_button(
                    p_content => '<a href="' || p_url || '" style="color: ' || g_primary_button_text_color || '; text-decoration: none; font-weight: bold; font-family: ' || g_font_family || '; font-size: 16px;">' || p_label || '</a>'
                    ,p_align => 'center'
                    ,p_padding => '8px 0'
                    ,p_background_color => g_primary_button_bgcolor
                    ,p_border => '1px solid #2284a1'
                    ,p_extra_style => 'display: block; width: auto !important;'
                );
    END print_primary_button;

    FUNCTION print_button_facebook (
        p_url in clob
        , p_label in clob) return clob IS
    BEGIN
        return print_button(
                    p_content => '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: bold; font-family: ' || g_font_family || '; font-size: 12px;">' || p_label || '</a>'
                    ,p_button_classes => 'tiny-button facebook'
                    ,p_align => 'center'
                    ,p_padding => '5px 0 4px'
                    ,p_background_color => '#3b5998'
                    ,p_border => '1px solid #2d4473'
                    ,p_extra_style => 'display: block; width: auto !important;'
                );
    END print_button_facebook;
    
    FUNCTION print_button_twitter (
        p_url in clob
        , p_label in clob) return clob IS
    BEGIN
        return print_button(
                    p_content => '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: bold; font-family: ' || g_font_family || '; font-size: 12px;">' || p_label || '</a>'
                    ,p_button_classes => 'tiny-button twitter'
                    ,p_align => 'center'
                    ,p_padding => '5px 0 4px'
                    ,p_background_color => '#00acee'
                    ,p_border => '1px solid #0087bb'
                    ,p_extra_style => 'display: block; width: auto !important;'
                );
    END print_button_twitter;
    
    FUNCTION print_button_google_plus (
        p_url in clob
        , p_label in clob) return clob IS
    BEGIN
        return print_button(
                    p_content => '<a href="' || p_url || '" style="color: #ffffff; text-decoration: none; font-weight: bold; font-family: ' || g_font_family || '; font-size: 12px;">' || p_label || '</a>'
                    ,p_button_classes => 'tiny-button google-plus'
                    ,p_align => 'center'
                    ,p_padding => '5px 0 4px'
                    ,p_background_color => '#DB4A39'
                    ,p_border => '1px solid #cc0000'
                    ,p_extra_style => 'display: block; width: auto !important;'
                );
    END print_button_google_plus; 
    
    /**********************************************
    ***********************************************
    ***********************************************
    OTHER FEATURES
    ***********************************************
    ***********************************************
    **********************************************/

    /*
    Print an image through a URL
    Can be aligned left, center or right
    */
    FUNCTION print_image(
        p_img_url in varchar2
        , p_align in varchar2 default 'left') return clob IS
    BEGIN
        return '<img src="' || p_img_url || '" style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; width: auto; max-width: 100%; float: left; clear: both; display: block;" align="' || p_align || '" />';
    END print_image;
    
    /*
    Simple line to separate content
    */
    FUNCTION print_hr return clob IS
    BEGIN
        return '<hr style="color: #d9d9d9; height: 1px; background: #d9d9d9; border: none;" />';
    END print_hr;
    
    /**********************************************
    ***********************************************
    ***********************************************
    COMMON PATTERNS
    ***********************************************
    ***********************************************
    **********************************************/
    
    FUNCTION print_default_body_header(
        p_logo_url in varchar2
        , p_title in varchar2) return clob IS
    BEGIN
        return  print_row(
                    p_content => print_standard_td_center(
                                    print_container(
                                        print_column_wrapper (
                                            print_col_12(
                                                print_sub_col_6(print_image(p_logo_url), 'left')
                                                || print_sub_col_6(print_title(p_title), 'right')
                                            )
                                        )
                                    )
                                )
                    , p_classes => 'header'
                    , p_display => 'table'
                    , p_header_background_color => g_header_background_color
                )
                || '<br />';
    END print_default_body_header;
    
    FUNCTION print_default_body_footer(
        p_footer_links in varchar2) return clob IS
    BEGIN
        return  '<br /><br />'
                || print_row(
                    print_column_wrapper (
                        print_col_12(
                            print_standard_td_center(
                                print_paragraph (
                                    p_text => p_footer_links
                                    , p_align => 'center')
                            )
                        )
                    )
                );
    END print_default_body_footer;
    
    FUNCTION print_global_body(
        p_content in clob) return clob IS
    BEGIN
        return  print_global_header 
                || outer_body(
                    print_global_css
                    || inner_body(
                        print_standard_td_center(p_content)
                    )
                )
                || print_global_end;
    END print_global_body;
    
    /**********************************************
    ***********************************************
    ***********************************************
    PRESET TEMPLATES
    ***********************************************
    ***********************************************
    **********************************************/

    /* Basic Template */
    FUNCTION basic return clob IS
        l_body              clob;
        
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
                            print_row(
                                print_column_wrapper(
                                    print_col_12(
                                        print_standard_td(
                                            print_h1(l_welcome_title)
                                            || print_paragraph_lead(l_sub_welcome_title)
                                            || print_paragraph(l_top_paragraph)
                                            || print_paragraph(l_top_paragraph)
                                            || print_paragraph(l_top_paragraph)
                                        ) 
                                    )
                                )
                            )
                            || print_row(
                                print_column_wrapper(
                                    print_col_12(
                                        print_panel(
                                            p_content => print_paragraph(
                                                            p_text => l_bottom_paragraph)
                                            , p_background_color => '#ECF8FF')
                                    )
                                )
                            )
                            || '<br />'
                            || print_row(
                                print_column_wrapper(
                                    print_col_6(
                                        print_panel(
                                            print_h6(l_social_title)
                                            || print_button_facebook(
                                                p_url => '#'
                                                ,p_label => 'Facebook')
                                            || print_hr
                                            || print_button_twitter(
                                                p_url => '#'
                                                ,p_label => 'Twitter')
                                            || print_hr
                                            || print_button_google_plus(
                                                p_url => '#'
                                                ,p_label => 'Google+')
                                        )
                                    )
                                )
                                || print_column_wrapper(
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
                    );
    
        /* Returns email body */
        return l_body;
    END basic;

    /* Hero Template */
    FUNCTION hero RETURN clob IS
        l_body                      clob;
        
        l_logo_url                  varchar2(4000);
        l_title                     varchar2(4000);
        l_welcome_title             varchar2(4000);
        l_sub_welcome_title         varchar2(4000);
        l_big_picture_url           varchar2(4000);
        l_top_paragraph             varchar2(4000);
        l_bottom_paragraph          varchar2(4000);
        l_bottom_paragraph_title    varchar2(4000);
        l_bottom_paragraph_subtitle varchar2(4000);
        l_social_title              varchar2(4000);
        l_contact_info              varchar2(4000);
        l_contact_phone             varchar2(4000);
        l_contact_email             varchar2(4000);
        l_footer_links              varchar2(4000);
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
                            print_row(
                                print_column_wrapper(
                                    print_col_12(
                                        print_standard_td(
                                            print_h1(l_welcome_title)
                                            || print_paragraph_lead(l_sub_welcome_title)
                                            || print_image(l_big_picture_url)
                                        ) 
                                    )
                                )
                            )
                            || print_row(
                                print_column_wrapper(
                                    print_col_12(
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
                                print_column_wrapper(
                                    print_col_6(
                                        print_panel(
                                            print_h6(l_social_title)
                                            || print_button_facebook(
                                                p_url => '#'
                                                ,p_label => 'Facebook')
                                            || print_hr
                                            || print_button_twitter(
                                                p_url => '#'
                                                ,p_label => 'Twitter')
                                            || print_hr
                                            || print_button_google_plus(
                                                p_url => '#'
                                                ,p_label => 'Google+')
                                        )
                                    )
                                )
                                || print_column_wrapper(
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
                    );
    
        /* Returns email body */
        return l_body;
    END hero;
    
    /* Sidebar Template */
    FUNCTION sidebar return clob IS
        l_body              clob;
        
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
                            print_row(
                                print_column_wrapper(
                                    print_col_6(
                                        print_standard_td(
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
                                        print_standard_td(
                                            print_paragraph(l_left_paragraph)
                                            || print_primary_button (
                                                p_url => '#'
                                                , p_label => 'Click Me!')
                                        )
                                    )
                                )
                                || print_column_wrapper(
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
                                            || print_button_facebook(
                                                p_url => '#'
                                                ,p_label => 'Facebook')
                                            || print_hr
                                            || print_button_twitter(
                                                p_url => '#'
                                                ,p_label => 'Twitter')
                                            || print_hr
                                            || print_button_google_plus(
                                                p_url => '#'
                                                ,p_label => 'Google+')
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
                    );
    
        /* Returns email body */
        return l_body;
    END sidebar;
    
    /* Sidebar Hero Template */
    FUNCTION sidebar_hero return clob IS
        l_body              clob;
        
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
                            print_row(
                                print_column_wrapper(
                                    print_col_12(
                                        print_standard_td(
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
                                print_column_wrapper(
                                    print_col_6(
                                        print_standard_td(
                                            print_paragraph(l_left_paragraph)
                                            || print_paragraph(l_left_paragraph)
                                            || print_paragraph(l_left_paragraph)
                                            || print_primary_button (
                                                    p_url => '#'
                                                    , p_label => 'Click Me!')
                                        )
                                    )
                                )
                                || print_column_wrapper(
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
                                            || print_button_facebook(
                                                p_url => '#'
                                                ,p_label => 'Facebook')
                                            || print_hr
                                            || print_button_twitter(
                                                p_url => '#'
                                                ,p_label => 'Twitter')
                                            || print_hr
                                            || print_button_google_plus(
                                                p_url => '#'
                                                ,p_label => 'Google+')
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
                    );
    
        /* Returns email body */
        return l_body;
    END sidebar_hero;
    
END rwd_email;
/