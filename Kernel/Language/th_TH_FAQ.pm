# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::th_TH_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'เพิ่มบทความ FAQ';
    $Self->{Translation}->{'Keywords'} = 'คีย์เวิร์ด';
    $Self->{Translation}->{'A category is required.'} = 'ต้องระบุหมวดหมู่';
    $Self->{Translation}->{'Approval'} = 'การอนุมัติ';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'การจัดการหมวดหมู่ FAQ';
    $Self->{Translation}->{'Add category'} = 'เพิ่มหมวดหมู่';
    $Self->{Translation}->{'Delete Category'} = 'ลบหมวดหมู่';
    $Self->{Translation}->{'Ok'} = 'โอเค';
    $Self->{Translation}->{'Add Category'} = 'เพิ่มหมวดหมู่';
    $Self->{Translation}->{'Edit Category'} = 'แก้ไขหมวดหมู่';
    $Self->{Translation}->{'Subcategory of'} = 'หมวดหมู่ย่อยของ';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'กรุณาเลือกอย่างน้อยหนึ่งกลุ่มที่ได้รับอนุญาต';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'กลุ่มเอเย่นต์ที่สามารถเข้าถึงบทความในหมวดหมู่นี้';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'จะแสดงเป็นความคิดเห็นในExplorer';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'คุณต้องการที่จะลบหมวดหมู่นี้หรือไม่?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'คุณไม่สามารถลบหมวดหมู่นี้ได้เพราะหมวดหมู่นี้ถูกใช้ในอย่างน้อยหนึ่งบทความ FAQ หรือ หมวดหมู่นี้คือ หมวดหมู่หลัก';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'หมวดหมู่นี้ใช้ในการติดตามบทความ FAQ (s)';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'หมวดหมู่นี้คือหมวดหมู่หลักของหมวดหมู่ย่อยต่อไปนี้';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'คุณต้องการลบหัวข้อ FAQ นี้หรือไม่?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'นักสำรวจ FAQ';
    $Self->{Translation}->{'Quick Search'} = 'การค้นหาแบบรวดเร็ว';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'ไวลด์การ์ดได้รับอนุญาต';
    $Self->{Translation}->{'Advanced Search'} = 'การค้นหาแบบละเอียด';
    $Self->{Translation}->{'Subcategories'} = 'หมวดหมู่ย่อย';
    $Self->{Translation}->{'FAQ Articles'} = 'บทความ FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'ไม่พบหมวดหมู่ย่อย';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'ประวัติของ';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'ไม่พบวารสาร FAQ ';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'การจัดการภาษา FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = 'เพิ่มภาษา';
    $Self->{Translation}->{'Delete Language %s'} = 'ลบภาษา %';
    $Self->{Translation}->{'Add Language'} = 'เพิ่มภาษา';
    $Self->{Translation}->{'Edit Language'} = 'แก้ไขภาษา';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'คุณต้องการลบภาษานี้หรือไม่?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'คุณไม่สามารถลบภาษานี้เพราะภาษานี้กำลังใช้ในอย่างน้อยหนึ่งในบทความ FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'ภาษานี้ใช้ในบทความ FAQ(s) เหล่านี้';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'การตั้งค่าข้อความ';
    $Self->{Translation}->{'FAQ articles per page'} = 'บทความ FAQ ของแต่ละหน้า';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'ไม่พบข้อมูล FAQ';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'คีย์เวิร์ด';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'โหวต (เช่น เท่ากับ 10 หรือมากกว่า60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'เรต (เช่น เท่ากับ 25% หรือ มากกว่า 75%)';
    $Self->{Translation}->{'Approved'} = 'อนุมัติแล้ว';
    $Self->{Translation}->{'Last changed by'} = 'การเปลี่ยนแปลงล่าสุดโดย';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'เวลาที่สร้างบทความ FAQ (ก่อน/หลัง)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'เวลาที่สร้างบทความ FAQ (ในระหว่าง)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'เวลาที่เปลี่ยนแปลงบทความ FAQ (ก่อน/หลัง)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'เวลาที่เปลี่ยนแปลงบทความ FAQ (ในระหว่าง)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'ข้อความFAQฉบับเต็ม';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'การค้นหาโดย FAQ';
    $Self->{Translation}->{'Profile Selection'} = 'การเลือกโปรไฟล์';
    $Self->{Translation}->{'Vote'} = 'โหวต';
    $Self->{Translation}->{'No vote settings'} = 'ไม่มีการตั้งค่าการโหวต';
    $Self->{Translation}->{'Specific votes'} = 'การโหวตที่เฉพาะเจาะจง';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'เช่น เท่ากับ 10 หรือมากกว่า60';
    $Self->{Translation}->{'Rate'} = 'เรต';
    $Self->{Translation}->{'No rate settings'} = 'ไม่มีการตั้งค่าการเรต';
    $Self->{Translation}->{'Specific rate'} = 'การประเมินที่เฉพาะเจาะจง';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'เช่น เท่ากับ 25% หรือ มากกว่า 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'เวลาที่สร้างบทความ FAQ ';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'เวลาที่เปลี่ยนแปลงบทความ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'ข้อมูล FAQ';
    $Self->{Translation}->{'Rating'} = 'เรตติ้ง';
    $Self->{Translation}->{'out of 5'} = '1 ใน  5';
    $Self->{Translation}->{'Votes'} = 'โหวต';
    $Self->{Translation}->{'No votes found!'} = 'ไม่พบการโหวต!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'ไม่พบการโหวต! เป็นคนแรกในการประเมินหัวข้อ FAQ นี้';
    $Self->{Translation}->{'Download Attachment'} = 'ดาวน์โหลดสิ่งที่แนบมา';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'ในการเปิดการลิงค์ในบล็อกคำอธิบายต่อไปนี้ คุณอาจจะต้องกดปุ่ม Ctrl หรือ Cmd หรือ Shift ในขณะที่กดลิงค์ (ขึ้นอยุ่กับเบราเซอร์และระบบปฎิบัติการของคุณ)';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'หัวข้อนี้ได้ประโยชน์กับคุณหรือไม่? กรุณาให้คะแนนของคุณและช่วยในการปรับปรุงฐานข้อมูล FAQ. ขอบคุณ!';
    $Self->{Translation}->{'not helpful'} = 'ไม่มีประโยชน์';
    $Self->{Translation}->{'very helpful'} = 'มีประโยชน์มาก';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'เพิ่มหัวข้อ FAQ ในตัวบทของบทความ';
    $Self->{Translation}->{'Insert FAQ Text'} = 'ป้อนข้อความ FAQ';
    $Self->{Translation}->{'Insert Full FAQ'} = 'ป้อน FAQ ฉบับเต็ม';
    $Self->{Translation}->{'Insert FAQ Link'} = 'ป้อนลิงค์ FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'ป้อนลิงค์และข้อความ FAQ';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'ป้อน FAQ ฉบับเต็มและลิงค์';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'ไม่พบบทความ FAQ ';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'ค้นหาแบบฉบับเต็มในบทความ FAQ (เช่น "John*n" or "Will*")';
    $Self->{Translation}->{'Vote restrictions'} = 'ข้อจำกัดการโหวต';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'เฉพาะบทความFAQ โดยการโหวด...';
    $Self->{Translation}->{'Rate restrictions'} = 'ข้อจำกัดการประเมิน';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'เฉพาะบทความFAQ โดยการประเมิน...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'เฉพาะบทความ FAQที่สร้างแล้ว';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'เฉพาะบทความ FAQที่สร้างในระหว่าง';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Search-Profile เป็นแม่แบบ?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'หมายเลขบทความ';
    $Self->{Translation}->{'Search for articles with keyword'} = 'ค้นหาบทความด้วยคีย์เวิร์ด';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'สาธารณะ';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'กลับไปที่ FAQ Explorer';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'ต้องระบุชื่อหมวดหมู่!';
    $Self->{Translation}->{'This category already exists'} = 'หมวดหมู่นี้มีอยู่แล้ว!';
    $Self->{Translation}->{'FAQ category updated!'} = 'อัปเดตหมวดหมู่ FAQ แล้ว!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'เพิ่มหมวดหมู่ FAQ แล้ว!';
    $Self->{Translation}->{'No CategoryID is given!'} = '';
    $Self->{Translation}->{'Was not able to delete the category %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQDelete.pm
    $Self->{Translation}->{'No ItemID is given!'} = '';
    $Self->{Translation}->{'You have no permission for this category!'} = '';
    $Self->{Translation}->{'Was not able to delete the FAQ article %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQExplorer.pm
    $Self->{Translation}->{'The CategoryID %s is invalid.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ItemID is given!'} = '';
    $Self->{Translation}->{'FAQ History'} = '';

    # Perl Module: Kernel/Modules/AgentFAQJournal.pm
    $Self->{Translation}->{'FAQ Journal'} = 'วารสาร FAQ';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'ต้องระบุชื่อ!';
    $Self->{Translation}->{'This language already exists!'} = 'ภาษานี้มีอยู่แล้ว!';
    $Self->{Translation}->{'FAQ language updated!'} = 'อัปเดตภาษา FAQ แล้ว!';
    $Self->{Translation}->{'FAQ language added!'} = 'เพิ่มภาษา FAQ แล้ว!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'อัปเดตล่าสุด';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'ไดมานิคฟิลด์ของ FAQ';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'ไม่มีผลลัพธ์!';
    $Self->{Translation}->{'FAQ Number'} = 'หมายเลข FAQ';
    $Self->{Translation}->{'Last Changed by'} = '';
    $Self->{Translation}->{'FAQ Item Create Time (before/after)'} = '';
    $Self->{Translation}->{'FAQ Item Create Time (between)'} = '';
    $Self->{Translation}->{'FAQ Item Change Time (before/after)'} = '';
    $Self->{Translation}->{'FAQ Item Change Time (between)'} = '';
    $Self->{Translation}->{'Equals'} = '';
    $Self->{Translation}->{'Greater than'} = '';
    $Self->{Translation}->{'Greater than equals'} = '';
    $Self->{Translation}->{'Smaller than'} = '';
    $Self->{Translation}->{'Smaller than equals'} = '';

    # Perl Module: Kernel/Modules/AgentFAQZoom.pm
    $Self->{Translation}->{'Need FileID!'} = '';
    $Self->{Translation}->{'Thanks for your vote!'} = 'ขอบคุณสำหรับการโหวตของคุณ!';
    $Self->{Translation}->{'You have already voted!'} = 'คุณได้ทำการโหวตแล้ว!';
    $Self->{Translation}->{'No rate selected!'} = 'ไม่มีเรทที่ถูกเลือก';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'พิมพ์บทความ FAQ ';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'บทความ FAQ (เพิ่งสร้างใหม่)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'บทความ FAQ (เพิ่งเปลี่ยนแปลง)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'บทความ FAQ (10 อันดับยอดนิยม)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '';
    $Self->{Translation}->{'This article is empty!'} = 'บทความนี้ว่างเปล่า';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'บทความ FAQ ที่สร้างล่าสุด';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'บทความ FAQ ที่อัปเดตล่าสุด';
    $Self->{Translation}->{'Top 10 FAQ articles'} = '10 บทความ FAQ ยอดนิยม';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        'ตัวกรองสำหรับการแสดงผล HTMLเพื่อเพิ่มการเชื่อมโยงที่อยู่เบื้องหลังของอักขระที่กำหนดไว้ องค์ประกอบของภาพที่จะช่วยให้สามารถป้อนข้อมูลสองชนิดได้ หนึ่งคือชื่อของภาพ (เช่น faq.png)ในกรณีนี้เส้นทางของภาพOTRS จะถูกนำมาใช้ สองคือการแทรกการเชื่อมโยงไปยังภาพ';
    $Self->{Translation}->{'Add FAQ article'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'สี CSS สำหรับผลการโหวต';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'เวลาแคชที่จะปล่อยให้สำหรับรายการFAQ';
    $Self->{Translation}->{'Category Management'} = 'การจัดการหมวดหมู่';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'ตำแหน่งทศนิยมของผลการนับคะแนน';
    $Self->{Translation}->{'Default category name.'} = 'ชื่อหมวดหมู่เริ่มต้น';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'ภาษาเริ่มต้นสำหรับ FAQ ในโหมดภาษาเดียว';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'ขนาดเริ่มต้นที่สูงสุดของหัวข้อในบทความ FAQ ที่จะแสดง';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'ลำดับความสำคัญเริ่มต้นของตั๋วสำหรับการอนุมัติของบทความ FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'สถานภาพเริ่มต้นสำหรับการกรอกข้อมูล FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'สถานภาพตั๋วเริ่มต้นสำหรับการอนุมัติบทความ FAQ.';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'ประเภทตั๋วเริ่มต้นสำหรับการอนุมัติบทความ FAQ.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        'ค่าเริ่มต้นสำหรับพารามิเตอร์การดำเนินการในหน้าสาธารณะ พารามิเตอร์การดำเนินการถูกนำมาใช้ในสคริปต์ของระบบ';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        'กำหนดค่าถ้าหากหัวข้อFAQ ควรได้รับการตัดแบ่งข้อความไปยังบทความ';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        'กำหนดโมดูลภาพรวมที่จะแสดงมุมมองเล็ก ๆ ของวารสาร FAQ.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        'กำหนดโมดูลภาพรวมที่จะแสดงมุมมองเล็ก ๆ ของรายการ FAQ.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับFAQ ในการค้นหาของFAQ ในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับFAQ ในการค้นหาของ FAQ ในอินเตอร์เฟซลูกค้า';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับ FAQ ในการค้นหาของFAQ ในอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับFAQ ใน FAQ Explorer ของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับ  FAQ ในFAQ Explorer ของอินเตอร์เฟซลูกค้า';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        'กำหนดคแอตทริบิวต์ FAQ เริ่มต้นสำหรับการเรียงลำดับ  FAQ ในFAQ Explorer ของอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ในผลการค้นหา FAQ Explorer ของอินเตอร์เฟซเอเย่นต์ ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ในผลการค้นหา FAQ Explorer ของอินเตอร์เฟซลูกค้า ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ในผลการค้นหา FAQ Explorer ของอินเตอร์เฟซสาธารณะ ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ของผลการค้นหาในอินตอร์เฟซเอเย่นต์ ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ของผลการค้นหาในอินตอร์เฟซลูกค้า ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        'กำหนด FAQ order เริ่มต้น ของผลการค้นหาในอินตอร์เฟซสาธารณะ ขึ้น: เก่าที่สุดด้านบน ลง: ล่าสุดด้านบน';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        'กำหนดค่าค่าเริ่มต้นที่แสดงแอตทริบิวต์ของการค้นหาของFAQ สำหรับหน้าจอการค้นหาของFAQ';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        'กำหนดข้อมูลที่จะแทรกในFAQ ตาทตั๋ว "FAQ ฉบับเต็ม" จะรวมถึงข้อความและภาพที่แนบมาแบบอินไลน์';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        'กำหนดพารามิเตอร์สำหรับแดชบอร์ดเบื้องหลัง  "จำกัด" คือกำหนดจำนวนของรายการที่แสดงโดยค่าเริ่มต้น "กลุ่ม" จะถูกนำมาใช้เพื่อจำกัดการเข้าถึงปลั๊กอิน (เช่นกลุ่ม: ผู้ดูแลระบบ; กลุ่ม 1; กลุ่ม2;) "เริ่มต้น" ระบุว่าถ้าปลั๊กอินถูกเปิดใช้งานโดยค่าเริ่มต้นหรือหากผู้ใช้ต้องการเพื่อเปิดใช้งานได้ด้วยตนเอง';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        'กำหนดคอลัมน์ที่แสดงอยู่ใน FAQ Explorer  ซึ่งตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        'กำหนดคอลัมน์ที่แสดงอยู่ในนิตยสาร FAQ ซึ่งตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        'กำหนดคอลัมน์ที่แสดงอยู่ในการค้นหา FAQ ซึ่งตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'กำหนดสถานที่ที่ลิงค์ \'แทรกFAQ \' จะปรากฏ';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'คำนิยามของช่องข้อความของรายการ FAQ';
    $Self->{Translation}->{'Delete this FAQ'} = 'ลบ FAQ นี้!';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการเพิ่มFAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและจำเป็นต้องใช้';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการแก้ไขFAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและจำเป็นต้องใช้';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'ไดนามิคฟิลด์แสดงในหน้าุมุมมองภาพรวมของ FAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและจำเป็นต้องใช้';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'ไดนามิคฟิลด์แสดงในหน้าุมุมมองภาพรวมของ FAQ ในอินเตอร์เฟซสาธารณะ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและจำเป็นต้องใช้';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการพิมพ์ FAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการพิมพ์ FAQ ในอินเตอร์เฟซของลูกค้า การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการพิมพ์ FAQ ในอินเตอร์เฟซสาธารณะการตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการค้นหาFAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและแสดงค่าเริ่มต้น';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการค้นหาFAQ ในอินเตอร์เฟซของลูกค้า การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและแสดงค่าเริ่มต้น';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการค้นหาFAQ ในอินเตอร์เฟซสาธารณะ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน 2 = เปิดใช้งานและแสดงค่าเริ่มต้น';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้ามุมมองภาพรวมของ FAQ ขนาดเล็กในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการซูมFAQ ในอินเตอร์เฟซของเอเย่นต์ การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการซูมFAQ ในอินเตอร์เฟซของลูกค้า การตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'ไดนามิคฟิลด์แสดงในหน้าการซูม FAQ ในอินเตอร์เฟซสาธารณะการตั้งค่าที่เป็นไปได้คือ 0 = ปิดการใช้งาน 1 = เปิดการใช้งาน';
    $Self->{Translation}->{'Edit this FAQ'} = 'แก้ไข FAQ นี้';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'เปิดใช้งานหลากหลายภาษา ในโมดูล FAQ.';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'เปิดใช้งานกลไกการโหวตในโมดูลFAQ.';
    $Self->{Translation}->{'Explorer'} = 'นักสำรวจ';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = '';
    $Self->{Translation}->{'FAQ Area.'} = '';
    $Self->{Translation}->{'FAQ Delete.'} = '';
    $Self->{Translation}->{'FAQ Edit.'} = '';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'ภาพรวมของวารสารFAQ"ขนาดเล็ก"';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'ภาพรวมของFAQ"ขนาดเล็ก"';
    $Self->{Translation}->{'FAQ Print.'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'จำนวน FAQ ที่จำกัดในแต่ละหน้าสำหรับภาพรวมวารสาร FAQ "ขนาดเล็ก"';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'จำกัด FAQ ในแต่ละหน้าของภาพรวม FAQ "ขนาดเล็ก"';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'backend router ค้นหา FAQ ของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Field4'} = 'ฟิลด์4';
    $Self->{Translation}->{'Field5'} = 'ฟิลด์5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'การลงทะเบียนโมดูล Frontend สำหรับอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'กลุ่มสำหรับการอนุมัติบทความ FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = 'ประวัติของ FAQ นี้';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'รวมเขตข้อมูลภายในเกี่ยวกับFAQ ตามตั๋ว';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'รวมถึงชื่อของแต่ละเขตข้อมูลภายในFAQ ตามตั๋ว';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = 'อินเตอร์เฟซที่การค้นหาแบบรวดเร็วควรจะแสดง';
    $Self->{Translation}->{'Journal'} = 'วารสาร';
    $Self->{Translation}->{'Language Management'} = 'การจัดการภาษา';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'ลิงค์ออบเจกต์อื่นไปยัง FAQ นี้';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        'รายชื่อของประเภทสถานภาพต่างๆที่สามารถใช้งานในอินเตอร์เฟซของเอเย่นต์ได้';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        'รายชื่อของประเภทสถานภาพต่างๆที่สามารถใช้งานในอินเตอร์เฟซของลูกค้าได้';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        'รายชื่อของประเภทสถานภาพต่างๆที่สามารถใช้งานในอินเตอร์เฟซสาธารณะได้';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงใน FAQ  Explorer ในอินเตอร์เฟซที่สาธารณะ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงในวารสาร FAQ ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงในผลการค้นหาในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงในผลการค้นหาในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        'จำนวนบทความ FAQ สูงสุดที่จะแสดงในผลการค้นหาในอินเตอร์เฟซที่สาธารณะ';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงในการค้นหาของ FAQ ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงในการค้นหาของ FAQ ในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ  ที่จะแสดงในการค้นหาของ FAQ ในอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        'จำนวนหัวข้อสูงสุดในบทความ FAQ ที่จะแสดงในวารสาร FAQ ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        'โมดูลในการสร้างโปรไฟล์ OpenSearch html สำหรับการค้นหา FAQ แบบกระชับ ในอินเตอร์เฟซที่สาธารณะ';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = 'หัวข้อ FAQ ใหม่';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'บทความFAQ ใหม่ต้องที่ได้รับการอนุมัติก่อนได้รับการตีพิมพ์';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        'จำนวนบทความ FAQ ที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        'จำนวนบทความ FAQ ที่จะแสดงใน FAQ Explorer ในอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        'จำนวนบทความ FAQ ที่จะแสดงบนแต่ละหน้าของผลการค้นหาในอินเตอร์เฟซของลูกค้า';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        'จำนวนบทความ FAQ ที่จะแสดงบนแต่ละหน้าของผลการค้นหาในอินเตอร์เฟซสาธารณะ';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'จำนวน items ที่แสดงในช่วงที่เปลี่ยนแปลงครั้งล่าสุด';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'จำนวน items ที่แสดงในช่วงที่สร้างขึ้นครั้งล่าสุด';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'จำนวนรายการที่แสดงฟีเจอร์ใน 10 อันดับแรก';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        'พารามิเตอร์สำหรับหน้าในรายการ (ซึ่งจะแสดงรายการ FAQ ) ของวารสาร FAQ ขนาดเล็ก';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        'พารามิเตอร์สำหรับหน้าในรายการ  (ซึ่งจะแสดงรายการ FAQ) ของ ภาพรวม FAQขนาดเล็ก';
    $Self->{Translation}->{'Print this FAQ'} = 'พิมพ์ FAQ นี้';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'คิวในการอนุมัติบทความFAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'เรตสำหรับการโหวตต้องกำหนดเป็นร้อยละ';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = 'ค้นหา FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'เซตค่าความสูงเริ่มต้น(พิกเซล) ของฟิลด์HTML แบบอินไลน์ใน AgentFAQZoom.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'เซตค่าความสูงเริ่มต้น(พิกเซล) ของฟิลด์HTML แบบอินไลน์ในCustomerFAQZoom  (และ PublicFAQZoom)';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'เซตค่าความสูงสูงสุด(พิกเซล) ของฟิลด์HTML แบบอินไลน์ใน AgentFAQZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'เซตค่าความสูงสูงสุด(พิกเซล) ของฟิลด์HTML แบบอินไลน์ในCustomerFAQZoom (และ PublicFAQZoom)';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'แสดงปุ่ม "แทรกลิงค์ FAQ " ใน AgentFAQZoomSmall สำหรับบทความFAQ สาธารณะ';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'แสดงปุ่ม "แทรกข้อความ FAQและลิงค์ " ใน AgentFAQZoomSmall สำหรับบทความ FAQ สาธารณะ';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        'แสดงปุ่ม "แทรกข้อความ FAQ " ใน AgentFAQZoomSmall';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'แสดงบทความFAQ ด้วย HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'แสดง ใช่/ ไม่ใช่ พาธFAQ ';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'แสดงรายการของหมวดหมู่ย่อย';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'แสดงรายการการเปลี่ยนแปลงที่ผ่านมาล่าสุดในอินเตอร์เฟซที่กำหนดไว้';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'แสดงรายการที่สร้างล่าสุดในอินเตอร์เฟซที่กำหนดไว้.';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'แสดง10 รายการยอดนิยมในอินเตอร์เฟซที่กำหนดไว้';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'แสดงการโหวตในอินเตอร์เฟซที่กำหนดไว้';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อลิงค์ FAQ กับออบเจกค์อื่นในการซูมในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่ออนุญาตการลบ FAQในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อเข้าดูประวัติของ FAQ ในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อแก้ไข FAQ ในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อย้อนกลับ FAQ ในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อพิมพ์ FAQ ในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Solution'} = 'วิธีแก้ปัญหา';
    $Self->{Translation}->{'Symptom'} = 'เครื่องแสดง';
    $Self->{Translation}->{'Text Only'} = '';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'ตัวบ่งชี้สำหรับ FAQ, เช่น FAQ#,  KB#, MyFAQ #. ค่าเริ่มต้นคือ FAQ#';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'การตั้งค่านี้กำหนดว่าออบเจกค์  \'FAQ\' สามารถลิงค์กับออบเจกค์  \'FAQ\' อื่น โดยการใช้ลิงค์  \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'การตั้งค่านี้กำหนดว่าออบเจกค์ \'FAQ\' สามารถลิงค์กับออบเจกค์ \'FAQ\' อื่น โดยการใช้ลิงค์ \'ParentChild\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'การตั้งค่านี้กำหนดว่าออบเจกค์  \'FAQ\' สามารถลิงค์กับออบเจกค์  \'ตั๋ว\' อื่น โดยการใช้ลิงค์  \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'การตั้งค่านี้กำหนดว่าออบเจกค์ \'FAQ\' สามารถลิงค์กับออบเจกค์ \'FAQ\' อื่น โดยการใช้ลิงค์ \'ParentChild\'';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'เนื้อเรื่องของตั๋วสำหรับการอนุมัติของบทความ FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'หัวข้อของตั๋วสำหรับการอนุมัติของบทความFAQ.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = '';
    $Self->{Translation}->{'external (customer)'} = 'ภายนอก (ลูกค้า)';
    $Self->{Translation}->{'internal (agent)'} = 'ภายใน (เอเย่นต์)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
