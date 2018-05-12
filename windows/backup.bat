@ECHO OFF

IF NOT DEFINED RESTIC_REPOSITORY (
	ECHO RESTIC_REPOSITORY not defined
	EXIT 1
)
IF NOT DEFINED RESTIC_PASSWORD_FILE (
	ECHO RESTIC_PASSWORD_FILE not defined
	EXIT 1
)
IF NOT EXIST "%RESTIC_PASSWORD_FILE%" (
	ECHO file %RESTIC_PASSWORD_FILE% does not exist
	EXIT 1
)

IF NOT DEFINED GOOGLE_APPLICATION_CREDENTIALS (
	ECHO GOOGLE_APPLICATION_CREDENTIALS not defined
	EXIT 1
)
IF NOT EXIST "%GOOGLE_APPLICATION_CREDENTIALS%" (
	ECHO file %GOOGLE_APPLICATION_CREDENTIALS% does not exist
	EXIT 1
)

IF NOT DEFINED EXCLUDE_FILE (
	ECHO EXCLUDE_FILE not defined
	EXIT 1
)
IF NOT EXIST "%EXCLUDE_FILE%" (
	ECHO file %EXCLUDE_FILE% does not exist
	EXIT 1
)

restic backup --exclude-file="%EXCLUDE_FILE%" "%HOMEPATH%\Documents"