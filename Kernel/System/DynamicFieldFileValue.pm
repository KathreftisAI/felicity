# --
# Kernel/System/DynamicFieldFileValue.pm
# -- 

package Kernel::System::DynamicFieldFileValue;

use strict;
use warnings;
use MIME::Base64;

use Kernel::System::VariableCheck qw(:all);
use Kernel::System::Time;
use Kernel::System::Cache;
use Data::Dumper;
use Encode;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::Valid',
    'Kernel::System::YAML',
    'Kernel::System::Time',
    'Kernel::System::Cache',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Encode',
);
=head1 NAME

Kernel::System::DynamicFieldFileValue

=head1 SYNOPSIS

DynamicField values backend

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create a DynamicFieldFileValue backend object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::DB;
    use Kernel::System::DynamicFieldFileValue;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $DynamicFieldValueObject = Kernel::System::DynamicFieldFileValue->new(
        ConfigObject        => $ConfigObject,
        EncodeObject        => $EncodeObject,
        LogObject           => $LogObject,
        MainObject          => $MainObject,
        DBObject            => $DBObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item ValueSet()

sets a dynamic field value. This is represented by one or more rows in the dynamic_field_value
table, each storing one text, date and int field. Please see how they will be returned by
L</ValueGet()>.

    my $Success = $DynamicFieldValueObject->ValueSet(
        FieldID  => $FieldID,                 # ID of the dynamic field
        ObjectID => $ObjectID,                # ID of the current object that the field
                                              #   must be linked to, e. g. TicketID
        Value    => [
            {
                ValueText          => 'some text',            # optional, one of these fields must be provided
                ValueDateTime      => '1977-12-12 12:00:00',  # optional
                ValueInt           => 123,                    # optional
            },
            ...
        ],
        UserID   => $UserID,
    );

=cut

sub ValueSet {
    my ( $Self, %Param ) = @_;

        
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => "SELECT count(*) FROM df_attachment where form_id=\'".$Param{FormID}."\'",
    );  
    my @Count =  $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray();
#    $Kernel::OM->Get('Kernel::System::Log')->Log(
#            Priority => 'error',
#            Message  => "Count=".@Count[0]
#    );   
	# a workaround for postrgreSQL
	 $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => "SELECT count(*) FROM df_attachment where article_id=\'".$Param{ObjectID}."\'",
    );  
    my @Check =  $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray();
    if ( !$Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('DirectBlob') ) {
        $Kernel::OM->Get('Kernel::System::Encode')->EncodeOutput( \$Param{Plik}{Content} );
        $Param{Plik}{Content} = encode_base64( $Param{Plik}{Content} );
    }
	my $ContentID=$Check[0];
	if($Param{Plik} && $Count[0]==0){
		$ContentID++;
		$Kernel::OM->Get('Kernel::System::DB')->Do(
			SQL => 'INSERT INTO df_attachment '
				. ' (article_id, filename, content_type, content_size, content, '
				. ' content_id, content_alternative, create_time, create_by, change_time, change_by, deleted, form_id) '
				. ' VALUES (?, ?, ?, 1, ?, ?, 1, current_timestamp, 1, current_timestamp, 1, 0, ?)',
			Bind => [
				\$Param{ObjectID}, \$Param{Plik}{Filename}, \$Param{Plik}{ContentType}, 
				\$Param{Plik}{Content}, \$ContentID, \$Param{FormID},

			],
		);
	}

    return 1;
}

=item ValueGet()

get a dynamic field value. For each table row there will be one entry in the
result list.

    my $Value = $DynamicFieldValueObject->ValueGet(
        FieldID            => $FieldID,                 # ID of the dynamic field
        ObjectID           => $ObjectID,                # ID of the current object that the field
                                                        #   is linked to, e. g. TicketID
    );

    Returns [
        {
            ID                 => 437,
            ValueText          => 'some text',
            ValueDateTime      => '1977-12-12 12:00:00',
            ValueInt           => 123,
        },
    ];

=cut

sub ValueGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

	my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
	my $BaseAction = $ParamObject->GetParam( Param => 'Action' );
	my $TicketID = $ParamObject->GetParam( Param => 'TicketID' );

	my $DynamicField = $Kernel::OM->Get('Kernel::System::DB')->SelectAll(
			SQL   => "select id,filename,content,content_type,content_id from df_attachment where article_id=? and deleted=0",
			Bind => [
				\$TicketID,
			],
	);

    my %CacheData;
	#opgk db 
	my $BaseLink=$Kernel::OM->Get('Kernel::Output::HTML::Layout')->{Baselink};
    #opgk KG
    my @BaselinkSplit = split('/',$BaseLink);
    my $Action;
    my $ValueText;
    #opgk KG
    for my $DataRow ( @$DynamicField ) {
        #opgk KG
        if($BaselinkSplit[2] eq 'index.pl?'){
            $Action = 'AgentDFFileAttachment';
        }elsif($BaselinkSplit[2] eq 'customer.pl?'){
            $Action = 'CustomerDFFileAttachment';   
        }
        $ValueText = "<a href='".$BaseLink."Action=".$Action.";FieldID=$TicketID;ObjectID=@$DataRow[0]'>".@$DataRow[1]."</a><a href='".$BaseLink."Action=".$Action.";Subaction=Delete;BaseAction=$BaseAction;TicketID=$TicketID;FieldID=$TicketID;ObjectID=@$DataRow[0]'> (Remove)</a>";
        #opgk KG
		if ( !$Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('DirectBlob') ) {
			push @{ $CacheData{ $Param{FieldID} } }, {
				ID            => @$DataRow[0],
				ValueText     => $ValueText,
				Content     => decode_base64( @$DataRow[2] ),
				Filename     => @$DataRow[1],
				ContentType     => @$DataRow[3],
			};
		}
		else{
			push @{ $CacheData{ $Param{FieldID} } }, {
				ID            => @$DataRow[0],
				ValueText     => $ValueText,
				
				Content    	 => @$DataRow[2],
				Filename     => @$DataRow[1],
				ContentType  => @$DataRow[3],
			};
		}
    }

    if ( exists $CacheData{ $Param{FieldID} } ) {
        return $CacheData{ $Param{FieldID} }
    }

    return [];
}

sub ValueGetFile {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }
	
	my $DynamicField = $Kernel::OM->Get('Kernel::System::DB')->SelectAll(
		SQL   => "select id,filename,content,content_type,content_id from df_attachment where article_id=? and id=? and deleted=0",
		Bind => [
			\$Param{FieldID},
			\$Param{ObjectID},
		],
	);

    my %CacheDataFile;
	#opgk db 
	my $BaseLink=$Kernel::OM->Get('Kernel::Output::HTML::Layout')->{Baselink};
    #opgk kg
    my @BaselinkSplit = split('/',$BaseLink);
    my $Action;
    if($BaselinkSplit[2] eq 'index.pl?'){
        $Action = 'AgentDFFileAttachment';
    }elsif($BaselinkSplit[2] eq 'customer.pl?'){
        $Action = 'CustomerDFFileAttachment';
    }
    #opgk kg
    for my $DataRow ( @$DynamicField ) {
		if ( !$Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('DirectBlob') ) {
			push @{ $CacheDataFile{ $Param{FieldID} } }, {
				ID            => @$DataRow[0],
				ValueText     => "<p class='Value'><a href='".$BaseLink."Action=".$Action.";FieldID=$Param{FieldID};ObjectID=@$DataRow[0]'>".@$DataRow[1]."</a></p>",
				Content     => decode_base64( @$DataRow[2] ),
				Filename     => @$DataRow[1],
				ContentType     => @$DataRow[3],
			};
		}
		else{
			push @{ $CacheDataFile{ $Param{FieldID} } }, {
				ID            => @$DataRow[0],
				ValueText     => "<p class='Value'><a href='".$BaseLink."Action=".$Action.";FieldID=$Param{FieldID};ObjectID=@$DataRow[0]'>".@$DataRow[1]."</a></p>",
				
				Content     => @$DataRow[2],
				Filename     => @$DataRow[1],
				ContentType     => @$DataRow[3],
			};
		}
    }

    if ( exists $CacheDataFile{ $Param{FieldID} } ) {
        return $CacheDataFile{ $Param{FieldID} }
    }

    return [];
}

=item ValueDelete()

delete a Dynamic field value entry. All associated rows will be deleted.

    my $Success = $DynamicFieldValueObject->ValueDelete(
        FieldID            => $FieldID,                 # ID of the dynamic field
        ObjectID           => $ObjectID,                # ID of the current object that the field
                                                        #   is linked to, e. g. TicketID
        UserID  => 123,
    );

    Returns 1.

=cut

sub ValueDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }
	
	my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
	my $DriverData=$ConfigObject->Get("DynamicFields::Driver");


    # delete dynamic field value from database if 
	if($DriverData->{File}->{DeleteFileDB} eq 1){
		return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
			SQL => 'DELETE FROM df_attachment where article_id=? and id=?',
			Bind => [ \$Param{FieldID}, \$Param{ObjectID}],
		);
	}else{
		return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
			SQL => 'UPDATE df_attachment SET deleted=1 WHERE article_id=? and id=?',
			Bind => [ \$Param{FieldID}, \$Param{ObjectID}],
		);
	}


    # delete cache
    $Self->_DeleteFromCache(%Param);

    return 1;
}

=item AllValuesDelete()

delete all entries of a dynamic field .

    my $Success = $DynamicFieldValueObject->AllValuesDelete(
        FieldID            => $FieldID,                 # ID of the dynamic field
        UserID  => 123,
    );

    Returns 1.

=cut

sub AllValuesDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    # delete dynamic field value
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM dynamic_field_value WHERE field_id = ?',
        Bind => [ \$Param{FieldID} ],
    );

    # Cleanup entire cache!
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => 'DynamicFieldValue',
    );

    return 1;
}

=item ValueValidate()

checks if the given value is valid for the value type.

    my $Success = $DynamicFieldValueObject->ValueValidate(
        Value    =>  {
                ValueText          => 'some text',            # optional, one of these fields must be provided
                ValueDateTime      => '1977-12-12 12:00:00',  # optional
                ValueInt           => 123,                    # optional
            },
        UserID   => $UserID,
    );

=cut

sub ValueValidate {
    my ( $Self, %Param ) = @_;

    return if !IsHashRefWithData( $Param{Value} );

    my %Value = %{ $Param{Value} };

    # validate date
    if ( $Value{ValueDateTime} ) {

        # convert the DateTime value to system time to check errors
        my $SystemTime = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
            String => $Value{ValueDateTime},
        );

        return if !defined $SystemTime;

        # convert back to time stamp to check errors
        my $TimeStamp = $Kernel::OM->Get('Kernel::System::Time')->SystemTime2TimeStamp(
            SystemTime => $SystemTime,
        );

        return if !$TimeStamp;

        # compare if the date is the same
        return if !( $Value{ValueDateTime} eq $TimeStamp )
    }

    # validate integer
    if ( $Value{ValueInt} ) {

        if ( $Value{ValueInt} !~ m{\A  -? \d+ \z}smx ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error', Message => "Invalid Integer '$Value{ValueInt}'!"
            );

            return;
        }
    }

    return 1;
}

=item HistoricalValueGet()

get all distinct values from a field stored on the database

    my $HistoricalValues = $DynamicFieldValueObject->HistoricalValueGet(
        FieldID   => $FieldID,                  # ID of the dynamic field
        ValueType => 'Text',                    # or 'DateTime' or 'Integer'. Default 'Text'
    );

    Returns:

    $HistoricalValues{
        ValueA => 'ValueA',
        ValueB => 'ValueB',
        ValueC => 'ValueC'
    };

=cut

sub HistoricalValueGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $ValueType = 'value_text';
    if ( $Param{ValueType} && $Param{ValueType} eq 'DateTime' ) {
        $ValueType = 'value_date';
    }
    elsif ( $Param{ValueType} && $Param{ValueType} eq 'Integer' ) {
        $ValueType = 'value_int';
    }

    # check cache
    my $CacheKey = 'HistoricalValueGet::FieldID::' . $Param{FieldID} . '::ValueType::' . $ValueType;

    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => 'DynamicFieldValue',
        Key  => $CacheKey,
    );

    # get data from cache
    return $Cache if ($Cache);

    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL =>
            "SELECT DISTINCT($ValueType) FROM dynamic_field_value WHERE field_id = ?",
        Bind => [ \$Param{FieldID} ],
    );

    my %Data;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {

        # check if the value is already stored
        if ( $Row[0] && !$Data{ $Row[0] } ) {

            if ( $ValueType eq 'value_date' ) {

                # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
                # and 0000-00-00 00:00:00 time stamps)
                if ( $Row[0] eq '0000-00-00 00:00:00' ) {
                    $Row[0] = undef;
                }
                $Row[0] =~ s/^(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2})\..+?$/$1/;
            }

            # store the results
            $Data{ $Row[0] } = $Row[0];
        }
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => 'DynamicFieldValue',
        Key   => $CacheKey,
        Value => \%Data,
        TTL   => $Self->{CacheTTL},
    );

    return \%Data;
}

#
# Deletes all needed cache entries for a given DynamicFieldValue.
#
sub _DeleteFromCache {

    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    } 

    # Clear ValueGet cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => 'DynamicFieldValue',
        Key  => 'ValueGet::ObjectID::' . $Param{ObjectID},
    );

    # Clear HistoricalValueGet caches
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => 'DynamicFieldValue',
        Key  => 'HistoricalValueGet::FieldID::' . $Param{FieldID} . '::ValueType::Text',
    );
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => 'DynamicFieldValue',
        Key  => 'HistoricalValueGet::FieldID::' . $Param{FieldID} . '::ValueType::DateTime',
    );
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => 'DynamicFieldValue',
        Key  => 'HistoricalValueGet::FieldID::' . $Param{FieldID} . '::ValueType::Integer',
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
