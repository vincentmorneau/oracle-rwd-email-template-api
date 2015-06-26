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
    TYPES
    ***********************************************
    ***********************************************
    **********************************************/
    type t_content is record (
        logo_url                    varchar2(4000)
        , title                     varchar2(4000)
        , welcome_title             varchar2(4000)
        , sub_welcome_title         varchar2(4000)
        , big_picture_url           varchar2(4000)
        , top_paragraph             varchar2(4000)
        , bottom_paragraph          varchar2(4000)
        , bottom_paragraph_title    varchar2(4000)
        , bottom_paragraph_subtitle varchar2(4000)
        , left_paragraph            varchar2(4000)
        , right_header              varchar2(4000)
        , right_sub_header          varchar2(4000)
        , social_title              varchar2(4000)
        , contact_info              varchar2(4000)
        , contact_phone             varchar2(4000)
        , contact_email             varchar2(4000)
        , footer_links              varchar2(4000)
    );
    
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
    FUNCTION outer_body(
        p_content in clob)
    return clob;

    /*
    Global Mandatory Table to wrap the body content
    */
    FUNCTION inner_body(
        p_content in clob)
    return clob;

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
    FUNCTION print_container (
        p_content in clob)
    return clob;

    /*
    Separates each row of content.
    */
    FUNCTION print_row (
        p_content in clob
        , p_classes in varchar2 default null
        , p_display in varchar2 default 'block'
        , p_header_background_color in varchar2 default 'transparent')
    return clob;

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
    FUNCTION print_standard_td_center (
        p_content in clob) return clob;

    /*
    Wraps each .columns table, in order to create a gutter between columns
    and force them to expand to full width on small screens.
    */
    FUNCTION print_column_wrapper (
        p_content in clob) return clob;

    /*
    Can be any number between one and twelve (spelled out).
    Used to determine how wide your .columns tables are.
    The number of columns in each row should add up to 12, including offset columns .
    */
    FUNCTION print_col (
        p_content in clob
        , p_number in varchar2
        , p_width in varchar2) return clob;

    /*
    1 Columns
    */
    FUNCTION print_col_1 (
        p_content in clob) return clob;

    /*
    2 Columns
    */
    FUNCTION print_col_2 (
        p_content in clob) return clob;

    /*
    3 Columns
    */
    FUNCTION print_col_3 (
        p_content in clob) return clob;

    /*
    4 Columns
    */
    FUNCTION print_col_4 (
        p_content in clob) return clob;

    /*
    5 Columns
    */
    FUNCTION print_col_5 (
        p_content in clob) return clob;

    /*
    6 Columns
    */
    FUNCTION print_col_6 (
        p_content in clob) return clob;

    /*
    7 Columns
    */
    FUNCTION print_col_7 (
        p_content in clob) return clob;

    /*
    8 Columns
    */
    FUNCTION print_col_8 (
      p_content in clob) return clob;

    /*
    9 Columns
    */
    FUNCTION print_col_9 (
      p_content in clob) return clob;

    /*
    10 Columns
    */
    FUNCTION print_col_10 (
      p_content in clob) return clob;

    /*
    11 Columns
    */
    FUNCTION print_col_11 (
      p_content in clob) return clob;

    /*
    12 Columns
    */
    FUNCTION print_col_12 (
      p_content in clob) return clob;

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
    FUNCTION print_sub_col_1 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    2 Sub Columns
    */
    FUNCTION print_sub_col_2 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    3 Sub Columns
    */
    FUNCTION print_sub_col_3 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    4 Sub Columns
    */
    FUNCTION print_sub_col_4 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    5 Sub Columns
    */
    FUNCTION print_sub_col_5 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    6 Sub Columns
    */
    FUNCTION print_sub_col_6 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    7 Sub Columns
    */
    FUNCTION print_sub_col_7 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    8 Sub Columns
    */
    FUNCTION print_sub_col_8 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    9 Sub Columns
    */
    FUNCTION print_sub_col_9 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    10 Sub Columns
    */
    FUNCTION print_sub_col_10 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

    /*
    11 Sub Columns
    */
    FUNCTION print_sub_col_11 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;
    /*

    12 Sub Columns
    */
    FUNCTION print_sub_col_12 (
        p_content in clob
        , p_align in varchar2 default 'left') return clob;

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
        , p_text_color in varchar2 default g_text_color) return clob;

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
    FUNCTION print_small_text(
        p_text in varchar2
        , p_text_color in varchar2 default g_text_color) return clob;

    /*
    Prints a label for the title bar
    */
    FUNCTION print_title(
        p_text in varchar2
        , p_text_color in varchar2 default '#ffffff') return clob;

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

    FUNCTION print_plain_link (
        p_url in clob
        , p_label in clob) return clob;

    FUNCTION print_primary_button (
        p_url in clob
        , p_label in clob) return clob;

    FUNCTION print_button_facebook (
        p_url in clob
        , p_label in clob) return clob;

    FUNCTION print_button_twitter (
        p_url in clob
        , p_label in clob) return clob;

    FUNCTION print_button_google_plus (
        p_url in clob
        , p_label in clob) return clob;

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
        , p_align in varchar2 default 'left') return clob;

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

    FUNCTION print_default_body_header(
        p_logo_url in varchar2
        , p_title in varchar2) return clob;

    FUNCTION print_default_body_footer(
        p_footer_links in varchar2) return clob;

    FUNCTION print_global_body(
        p_content in clob) return clob;

    /**********************************************
    ***********************************************
    ***********************************************
    PRESET TEMPLATES
    ***********************************************
    ***********************************************
    **********************************************/
    FUNCTION basic (p_content in t_content) return clob;
    FUNCTION hero (p_content in t_content) return clob;
    FUNCTION sidebar (p_content in t_content) return clob;
    FUNCTION sidebar_hero (p_content in t_content) return clob;

end rwd_email;