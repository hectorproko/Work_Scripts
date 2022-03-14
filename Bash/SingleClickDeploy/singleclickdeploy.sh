#! /bin/bash
echo >webdeployDEV1.sh;
echo >windowsdeployDEV1.sh;

echo "Paste token:"
read token

#Creating sh file for web deploy.
var1=$(grep -i IVRRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/ivrrestapiservice/job/_wkab_ivr_restapi_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i CustomerPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/appcustomerportal/job/_wkab_customer_portal_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i ExternalPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/appexternalportal/job/_wkab_external_portal_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i ClaimService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/claimservice/job/_wkab_claim_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i CommunicationsIndexer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/communicationsindexer/job/_wkab_communications_indexer_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i CommunicationsMaintenance ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/communicationsmaintenance/job/_wkab_communications_maintenance_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i DQManager_Web ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/DQManager_Web/job/_wkab_dq_mgr_web_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i EchoSignRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/echosignrestapiservice/job/_wkab_echo_sign_rest_api_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i GroupInsuranceLandingUI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/GroupInsuranceLandingUI/job/_wkab_group_insurance_landing_ui_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i MemberService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/memberservice/job/_wkab_member_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i TaskService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/taskservice/job/_wkab_task_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i THAAPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/ThaaPortalServices/job/_wkab_thaa_portal_services_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i UtilityService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/utilityservice/job/_wkab_utility_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i WcpWebService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wcpwebservice/job/_wkab_wcp_web_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i ApplicationIntegration ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabapplicationintegration/job/_wkab_application_integration_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i WKABPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabportalservice/job/_wkab_portal_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i ReportingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/reportingservice/job/_wkab_reporting_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i RestLetterService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/WKABRestLetterService/job/_wkab_rest_letter_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i "appExt\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/appExt/job/_wkab_app_ext_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i appExtWebAPI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/appExtWebAPI/job/_wkab_app_ext_web_api_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i appRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabrestapiservice/job/_wkab_restapi_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i Tools ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/apptools/job/_wkab_tools_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i WKABTransProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/appTransaction/job/_wkab_app_transaction_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i WoteService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/woteservice/job/_wkab_wote_service_DEV1/build" >>webdeployDEV1.sh

var1=$(grep -i CaseContactEmailProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CaseContactEmailProcess/job/_wkab_case_contact_email_process_DEV1/build" >> windowsdeployDEV1.sh

echo "sleep 2m" >> webdeployDEV1.sh
var1=$(grep -i "ARMS\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/arms/job/_wkab_arms_DEV1/build" >>webdeployDEV1.sh

echo "sleep 1m" >> webdeployDEV1.sh
var1=$(grep -i BenEngStoredProcPull ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/benefitengine/job/_wkab_benefit_engine_DEV1/build" >>webdeployDEV1.sh

echo "sleep 1m" >> webdeployDEV1.sh
var1=$(grep -i ScriptPageRewrite ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/scriptengine/job/_wkab_script_engine_DEV1/build" >>webdeployDEV1.sh

echo "sleep 1m" >> webdeployDEV1.sh
var1=$(grep -i WotesApplication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wotesapplication/job/_wkab_wotes_application_DEV1/build" >>webdeployDEV1.sh

echo "sleep 90s" >> webdeployDEV1.sh
var1=$(grep -i "app\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/app/job/_wkab_app_DEV1/build" >>webdeployDEV1.sh

#VendorPortalUI new
var1=$(grep -i "VendorPortalUI\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/vendorportalui/job/_wkab_vendor_portal_ui_DEV1/build" >>webdeployDEV1.sh

#THAADisClaimRESTService new
var1=$(grep -i "DisClaimRESTService\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/THAADisClaimRESTService/job/_wkab_thaa_dis_claim_rest_service_DEV1/build" >>webdeployDEV1.sh

#THAATMIntegration
var1=$(grep -i "THAATMIntegration\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/THAATMIntegration/job/_wkab_thaatm_integration_DEV1/build" >>webdeployDEV1.sh

##########Creating sh file for windows deploy.

var1=$(grep -i AccumulatorEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/accumulatoreventprocessor/job/_wkab_accumulator_event_processor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i AlertNotification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/alertnotificationbatchjob/job/_wkab_alert_notification_batch_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i AppointmentReminder ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/appointmentreminderbatchjob/job/_wkab_appointment_reminder_batch_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i AutoSetParmsBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/autosetparmsbatch/job/_wkab_auto_set_parms_batch_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i BenEngineLockingPayments ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/benenginelockingpayments/job/_wkab_ben_engine_locking_payments_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i ComModeUpdateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/commodeupdatebatch/job/_wkab_com_mode_update_batch_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i CommonBackgroundProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CommonBackgroundProcess/job/_wkab_common_background_process_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i DisabilityAutoAdjudication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/disabilityautoadjudication/job/_wkab_disability_auto_adjudication_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i EligibilityVerification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/EligibilityVerification/job/_wkab_eligibility_verification_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i HIGGoLiveDateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/HIGGoLiveDateBatch/job/_wkab_hig_go_live_date_batch_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i LTDClaimsLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ltdclaimsloadbalancer/job/_wkab_ltd_claims_load_balancer_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i MemberEnrollmentProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/MemberEnrollmentProcessor/job/_wkab_member_enrollment_processor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i MonitorFileUpload ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/monitorfileupload/job/_wkab_monitor_file_upload_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i PlanMaintNotificationBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/planmaintnotificationbatch/job/_wkab_plan_maint_notification_batch_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i PRPacketCreator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/PRPacketCreator/job/_wkab_pr_packet_creator_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i QueueListener ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/QueueListener/job/_wkab_queue_listener_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i ScheduledRestAPIEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ScheduledRestAPIEventProcessor/job/_wkab_scheduled_restapi_event_processor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i ScheduledTaskToQueueProcessors ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ScheduledTaskToQueueProcessors/job/_wkab_scheduled_task_to_queue_processors_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i SendEmailBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/SendEmailBatchJob/job/_wkab_send_email_batch_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i StageCCICompanyData ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/StageCCICompanyData/job/_wkab_stage_cci_company_data_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i StagedMessageProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/StagedMessageProcessor/job/_wkab_staged_message_processor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i STDFSMLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/STDFSMLoadBalancer/job/_wkab_stdfsm_load_balancer_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i SuspendedPaymentsBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/SuspendedPaymentsBatchJob/job/_wkab_suspended_payments_batch_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i TaskStagingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/TaskStagingService/job/_wkab_task_staging_service_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i TriggerForTextMessagingJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/TriggerForTextMessagingJob/job/_wkab_trigger_for_text_messaging_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i UnStructuredDataMigrator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UnStructuredDataMigrator/job/_wkab_unstructured_datamigrator_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i UpdateFICALDW ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UpdateFICALDW/job/_wkab_update_ficaldw_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i UserUploadedFilesBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UserUploadedFilesBatchJob/job/_wkab_user_uploaded_files_batch_job_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i VendorPortalDocumentUploadBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/VendorPortalDocumentUploadBatch/job/_wkab_vendor_portal_document_upload_batch_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i TaxFileTransferSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WcpDPPFileNotifier/job/_wkab_wcp_dpp_file_notifier_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i BatchPrint ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabBatchPrint/job/_wkab_batch_print_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i EchoSignSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabEchoSignSvc/job/_wkab_echo_sign_svc_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i FaxStatusRequestor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABFaxStatusRequestor/job/_wkab_fax_status_requestor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i MonitoringService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABMonitoringService/job/_wkab_monitoring_service_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i WKABQueueProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABQueueProcessor/job/_wkab_queue_processor_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i WKABReportsAutoAssignment ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABReportsAutoAssignment/job/_wkab_reports_auto_assignment_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i ReportScheduler ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabScheduling/job/_wkab_scheduling_DEV1/build" >> windowsdeployDEV1.sh

var1=$(grep -i WKABTaskProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABTaskProcessor/job/_wkab_task_processor_DEV1/build" >> windowsdeployDEV1.sh

#OnlineStatusQueueProcessor new
var1=$(grep -i "OnlineStatusQueueProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/OnlineStatusQueueProcessor/job/_wkab_online_status_queue_processor_DEV1/build" >>webdeployDEV1.sh

#CMTHAAIntgProcessor new
var1=$(grep -i "CMTHAAIntgProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CMTHAAIntgProcessor/job/_wkab_cm_thaa_intg_processor_DEV1/build" >>windowsdeployDEV1.sh

#MUDIProcessor
var1=$(grep -i "MUDIProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job//job/app/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/MUDIProcessor/job/_wkab_mudi_processor_DEV1/build" >>windowsdeployDEV1.sh


sh windowsdeployDEV1.sh
sh webdeployDEV1.sh

