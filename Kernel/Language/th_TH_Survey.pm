# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::th_TH_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'สร้างแบบสอบถามใหม่';
    $Self->{Translation}->{'Introduction'} = 'บทนำ';
    $Self->{Translation}->{'Survey Introduction'} = 'คำนำแบบสอบถาม';
    $Self->{Translation}->{'Notification Body'} = 'การแจ้งเตือนส่วนเนื้อเรื่อง';
    $Self->{Translation}->{'Internal Description'} = 'รายละเอียดภายใน';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'แก้ไขข้อมูลทั่วไป';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'แก้ไขคำถาม';
    $Self->{Translation}->{'Survey Questions'} = 'คำถามแบบสอบถาม';
    $Self->{Translation}->{'Add Question'} = 'เพิ่มคำถาม';
    $Self->{Translation}->{'Type the question'} = 'ประเภทคำถาม';
    $Self->{Translation}->{'Answer required'} = 'ต้องการคำตอบ';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'ไม่มีคำถามบันทึกในแบบสอบถามนี้';
    $Self->{Translation}->{'Question'} = 'คำถาม';
    $Self->{Translation}->{'Answer Required'} = 'ต้องการคำตอบ';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'เมื่อคุณการแก้ไขคำถามในแบบสอบถามเสร็จสิ้นแล้วเพียงแค่ปิดหน้าจอนี้';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'คุณแน่ใจหรือไม่ที่จะลบคำถามนี้? ข้อมูลที่เกี่ยวข้องทั้งหมดจะหายไป!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'แก้ไขคำถาม';
    $Self->{Translation}->{'go back to questions'} = 'กลับไปที่คำถาม';
    $Self->{Translation}->{'Question:'} = 'คำถาม:';
    $Self->{Translation}->{'Possible Answers For'} = 'คำตอบที่เป็นไปได้';
    $Self->{Translation}->{'Add Answer'} = 'เพิ่มคำตอบ';
    $Self->{Translation}->{'No answers saved for this question.'} = 'ไม่มีคำตอบบันทึกในคำถามนี้';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'คุณต้องการลบการตอบนี้หรือไม่?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'มีบางคำถามที่ยังไม่ตอบ textarea จะปรากฏ ';
    $Self->{Translation}->{'Edit Answer'} = 'แก้ไขคำตอบ';
    $Self->{Translation}->{'go back to edit question'} = 'กลับไปที่แก้ไขคำถาม';
    $Self->{Translation}->{'Answer:'} = 'คำตอบ:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'จำนวนสูงสุดที่จะแสดงแบบสอบถามในแต่ละหน้า';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'การแจ้งเตือนผู้ส่ง';
    $Self->{Translation}->{'Notification Subject'} = 'การแจ้งเตือนเรื่อง';
    $Self->{Translation}->{'Changed By'} = 'เปลี่ยนแปลงโดย';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'สถิติภาพรวมของ';
    $Self->{Translation}->{'Requests Table'} = 'การร้องขอตาราง';
    $Self->{Translation}->{'Send Time'} = 'เวลาส่ง';
    $Self->{Translation}->{'Vote Time'} = 'เวลาโหวต';
    $Self->{Translation}->{'See Details'} = 'ดูเนื้อหา';
    $Self->{Translation}->{'Survey Stat Details'} = 'เนื้อหาของสถิติแบบสอบถาม';
    $Self->{Translation}->{'go back to stats overview'} = 'กลับไปที่สถิติภาพรวม';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'ข้อมูลแบบสอบถาม';
    $Self->{Translation}->{'Sent requests'} = 'ส่งคำร้อง';
    $Self->{Translation}->{'Received surveys'} = 'ได้รับแบบสอบถามแล้ว';
    $Self->{Translation}->{'Survey Details'} = 'เนื้อหาของแบบสอบถาม';
    $Self->{Translation}->{'Ticket Services'} = 'การบริการของตั๋ว';
    $Self->{Translation}->{'Survey Results Graph'} = 'กราฟคำตอบของแบบสอบถาม';
    $Self->{Translation}->{'No stat results.'} = 'ไม่มีคำตอบของสถิติ';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'แบบสอบถาม';
    $Self->{Translation}->{'Please answer these questions'} = 'โปรดตอบคำถามเหล่านี้';
    $Self->{Translation}->{'Show my answers'} = 'แสดงคำตอบของฉัน';
    $Self->{Translation}->{'These are your answers'} = 'นี่คือคำตอบของคุณ';
    $Self->{Translation}->{'Survey Title'} = 'หัวข้อแบบสอบถาม';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'เพิ่มแบบสอบถาม';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'แก้ไขแบบสอบถาม';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'แบบสอบถามแก้ไขคำถาม';
    $Self->{Translation}->{'Yes/No'} = 'ใช่/ไม่ใช่';
    $Self->{Translation}->{'Radio (List)'} = 'เรดิโอ(รายชื่อ)';
    $Self->{Translation}->{'Checkbox (List)'} = 'กล่องตรวจสอบ (รายชื่อ)';
    $Self->{Translation}->{'Question Type'} = 'ประเภทของคำถาม';
    $Self->{Translation}->{'Complete'} = 'เสร็จ';
    $Self->{Translation}->{'Incomplete'} = 'ไม่เสร็จ';
    $Self->{Translation}->{'Question Edit'} = 'แก้ไขคำถาม';
    $Self->{Translation}->{'Answer Edit'} = 'แก้ไขคำตอบ';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'สถิติภาพรวม';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'เนื้อหาสถิติ';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'ไม่สามารถตั้งค่าสถานภาพใหม่! ยังไม่ได้กำหนดคำถาม';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'สถานภาพเปลี่ยนแล้ว';
    $Self->{Translation}->{'- No queue selected -'} = '- ไม่มีคิวที่ถูกเลือก -';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- เปลี่ยนสถานะ -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = 'สถานะใหม่';
    $Self->{Translation}->{'Survey Description'} = 'คำอธิบายแบบสอบถาม';
    $Self->{Translation}->{'answered'} = 'ตอบแล้ว';
    $Self->{Translation}->{'not answered'} = 'ยังไม่ตอบ';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'ขอบคุณสำหรับความคิดเห็นของคุณ';
    $Self->{Translation}->{'The survey is finished.'} = 'แบบสอบถามเสร็จเรียบร้อยแล้ว';
    $Self->{Translation}->{'Survey Message!'} = '';
    $Self->{Translation}->{'Module not enabled.'} = '';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        '';
    $Self->{Translation}->{'Survey Error!'} = '';
    $Self->{Translation}->{'Invalid survey key.'} = '';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        '';
    $Self->{Translation}->{'Survey Vote'} = '';
    $Self->{Translation}->{'Survey Vote Data'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = 'คุณได้ตอบแบบสอบถามนี้แล้ว';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'โมดูลแบบสอบถาม';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'โมดูลสำหรับแก้ไขคำถามแบบสอบถาม';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'พารามิเตอร์ทั้งหมดสำหรับออบเจกต์ของแบบสอบถามในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'จํานวนวันหลังจากส่งอีเมล์ในการสอบถามที่ไม่มีการร้องขอการสอบถามครั้งใหม่จะถูกส่งไปยังลูกค้ารายเดียวกัน เลือก 0 เพื่อส่งอีเมล์ในการสอบถามตลอด';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'ค่าเริ่มต้นของส่วนเนื้อเรื่องสำหรับการแจ้งเตือนอีเมล์เกี่ยวกับแบบสอบถามใหม่ถึงลูกค้า';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'ค่าเริ่มต้นของผู้ส่งสำหรับการแจ้งเตือนอีเมล์เกี่ยวกับแบบสอบถามใหม่ถึงลูกค้า';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'ค่าเริ่มต้นของเนื้อหาสำหรับการแจ้งเตือนอีเมล์เกี่ยวกับแบบสอบถามใหม่ถึงลูกค้า';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'กำหนดโมดูลภาพรวมที่จะแสดงมุมมองเล็ก ๆ ของรายชื่อแบบสอบถาม';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'กำหนดจำนวนสูงสุดของการสำรวจที่ได้รับการส่งให้กับลูกค้าภายใน 30 วัน (0 หมายถึงไม่มีการกำหนดจำนวนสูงสุด ซึ่งแบบสำรวจที่เรียกขอทั้งหมดจะถูกส่ง)';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'กำหนดความสูงเริ่มต้นสำหรับมุมมอง Richtext สำหรับองค์ประกอบของ SurveyZoom';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'กำหนดคอลัมน์ที่จะแสดงในภาพรวมของแบบสอบถามตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'เปิดหรือปิดการใช้งานสกรีน ที่แสดงข้อมูลการโหวตในอินเตอร์เฟซสาธารณะเพื่อจะแสดงผลของแบบสอบถาม เมื่อลูกค้าพยายามที่จะตอบแบบสอบถามครั้งที่สอง';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'เปิดหรือปิดการตรวจสอบเงื่อนไขการส่งสำหรับการบริการ';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'เปิดหรือปิดการตรวจสอบเงื่อนไขการส่งสำหรับประเภทของตั๋ว';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'การลงทะเบียนโมดูล Frontend สำหรับการเพิ่มแบบสอบถามในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'การลงทะเบียนโมดูล Frontend สำหรับการแก้ไขแบบสอบถามในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'การลงทะเบียนโมดูล Frontend สำหรับสถิติของแบบสอบถามในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'การลงทะเบียนโมดูล Frontend สำหรับการซูมแบบสอบถามในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'การลงทะเบียนโมดูล Frontend สำหรับออบเจกค์แบบสอบถามทั่วไปในพื้นที่สำรวจสาธารณะ';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'ถ้าหาก regex ตรงกัน จะไม่มีการส่งแบบสอบถามให้ลูกค้า';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'พารามิเตอร์สำหรับเพจ (ซึ่งจะแสดงแบบสอบถาม) ของภาพรวมแบบสอบถามขนาดเล็ก';
    $Self->{Translation}->{'Public Survey.'} = 'แบบสอบถามสาธารณะ';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อแก้ไขแบบสอบถามในมุมมองการซูมในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อแก้ไขคำถามในแบบสอบถามในมุมมองการซูมในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อย้อนกลับในการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อซูฒไปที่รายละเอียดสถิติของแบบสอบถามในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Stats Details'} = 'เนื้อหาสถิติ';
    $Self->{Translation}->{'Survey Add Module.'} = 'แบบสอบถามเพิ่มโมดูล';
    $Self->{Translation}->{'Survey Edit Module.'} = 'แบบสอบถามแก้ไขโมดูล';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'การจำกัดภาพรวมของแบบสอบถาม "ขนาดเล็ก"';
    $Self->{Translation}->{'Survey Stats Module.'} = 'การสำรวจสถิติโมดูล';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'โมดูลซูมแบบสอบถาม';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'จะไม่มีการส่งแบบสอบถามที่อีเมลที่ถูกกำหนดค่า';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'ตัวบ่งชี้สำหรับแบบสอบถาม, ตัวอย่างเช่น แบบสอบถาม# แบบสอบถามของฉัน#. ค่าเริ่มต้นคือแบบสอบถาม#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'โมดูลตั๋วกิจกรรมที่จะส่งอีเมลแบบสอบถามของการร้องขออัตโนมัติให้ลูกค้าในกรณีที่ตั๋วถูกปิด';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'การกระตุ้นการส่งการร้องขอแบบสอบที่ล่าช้า';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
