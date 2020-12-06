#! /bin/bash
echo >webdeployDEV2.sh;
echo >windowsdeployDEV2.sh;

echo "Paste token:"
read token

#Creating sh file for web deploy.
var1=$(grep -i IVRRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/ivrrestapiservice/job/gb_wkab_ivr_restapi_service/build" >>webdeployDEV2.sh

var1=$(grep -i CustomerPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/workabilitycustomerportal/job/gb_wkab_customer_portal/build" >>webdeployDEV2.sh

var1=$(grep -i ExternalPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/workabilityexternalportal/job/gb_wkab_external_portal/build" >>webdeployDEV2.sh

var1=$(grep -i ClaimService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/claimservice/job/gb_wkab_claim_service/build" >>webdeployDEV2.sh

var1=$(grep -i CommunicationsIndexer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/communicationsindexer/job/gb_wkab_communications_indexer/build" >>webdeployDEV2.sh

var1=$(grep -i CommunicationsMaintenance ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/communicationsmaintenance/job/gb_wkab_communications_maintenance/build" >>webdeployDEV2.sh

var1=$(grep -i DQManager_Web ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/DQManager_Web/job/gb_wkab_dq_mgr_web/build" >>webdeployDEV2.sh

var1=$(grep -i EchoSignRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/echosignrestapiservice/job/gb_wkab_echo_sign_rest_api_service/build" >>webdeployDEV2.sh

var1=$(grep -i GroupInsuranceLandingUI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/GroupInsuranceLandingUI/job/gb_wkab_group_insurance_landing_ui/build" >>webdeployDEV2.sh

var1=$(grep -i MemberService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/memberservice/job/gb_wkab_member_service/build" >>webdeployDEV2.sh

var1=$(grep -i TaskService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/taskservice/job/gb_wkab_task_service/build" >>webdeployDEV2.sh

var1=$(grep -i THAAPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/ThaaPortalServices/job/gb_wkab_thaa_portal_services/build" >>webdeployDEV2.sh

var1=$(grep -i UtilityService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/utilityservice/job/gb_wkab_utility_service/build" >>webdeployDEV2.sh

var1=$(grep -i WcpWebService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wcpwebservice/job/gb_wkab_wcp_web_service/build" >>webdeployDEV2.sh

var1=$(grep -i ApplicationIntegration ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabapplicationintegration/job/gb_wkab_application_integration/build" >>webdeployDEV2.sh

var1=$(grep -i WKABPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabportalservice/job/gb_wkab_portal_service/build" >>webdeployDEV2.sh

var1=$(grep -i ReportingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/reportingservice/job/gb_wkab_reporting_service/build" >>webdeployDEV2.sh

var1=$(grep -i RestLetterService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/WKABRestLetterService/job/gb_wkab_rest_letter_service/build" >>webdeployDEV2.sh

var1=$(grep -i "WorkAbilityExt\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/WorkAbilityExt/job/gb_wkab_workability_ext/build" >>webdeployDEV2.sh

var1=$(grep -i WorkAbilityExtWebAPI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/WorkAbilityExtWebAPI/job/gb_wkab_workability_ext_web_api/build" >>webdeployDEV2.sh

var1=$(grep -i WorkAbilityRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wkabrestapiservice/job/gb_wkab_restapi_service/build" >>webdeployDEV2.sh

var1=$(grep -i Tools ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/workabilitytools/job/gb_wkab_tools/build" >>webdeployDEV2.sh

var1=$(grep -i WKABTransProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/WorkabilityTransaction/job/gb_wkab_workability_transaction/build" >>webdeployDEV2.sh

var1=$(grep -i WoteService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/woteservice/job/gb_wkab_wote_service/build" >>webdeployDEV2.sh

var1=$(grep -i CaseContactEmailProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CaseContactEmailProcess/job/gb_wkab_case_contact_email_process/build" >> windowsdeployDEV2.sh

echo "sleep 2m" >> webdeployDEV2.sh
var1=$(grep -i "ARMS\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/arms/job/gb_wkab_arms/build" >>webdeployDEV2.sh

echo "sleep 1m" >> webdeployDEV2.sh
var1=$(grep -i BenEngStoredProcPull ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/benefitengine/job/gb_wkab_benefit_engine/build" >>webdeployDEV2.sh

echo "sleep 1m" >> webdeployDEV2.sh
var1=$(grep -i ScriptPageRewrite ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/scriptengine/job/gb_wkab_script_engine/build" >>webdeployDEV2.sh

echo "sleep 1m" >> webdeployDEV2.sh
var1=$(grep -i WotesApplication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/wotesapplication/job/gb_wkab_wotes_application/build" >>webdeployDEV2.sh

echo "sleep 90s" >> webdeployDEV2.sh
var1=$(grep -i "WorkAbility\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/workability/job/gb_wkab_workability/build" >>webdeployDEV2.sh

#VendorPortalUI new
var1=$(grep -i "VendorPortalUI\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/vendorportalui/job/gb_wkab_vendor_portal_ui/build" >>webdeployDEV2.sh

#THAADisClaimRESTService new
var1=$(grep -i "DisClaimRESTService\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/THAADisClaimRESTService/job/gb_wkab_thaa_dis_claim_rest_service/build" >>webdeployDEV2.sh

#THAATMIntegration
var1=$(grep -i "THAATMIntegration\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WEB_SERVICES/job/THAATMIntegration/job/gb_wkab_thaatm_integration/build" >>webdeployDEV2.sh

##########Creating sh file for windows deploy.

var1=$(grep -i AccumulatorEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/accumulatoreventprocessor/job/gb_wkab_accumulator_event_processor/build" >> windowsdeployDEV2.sh

var1=$(grep -i AlertNotification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/alertnotificationbatchjob/job/gb_wkab_alert_notification_batch_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i AppointmentReminder ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/appointmentreminderbatchjob/job/gb_wkab_appointment_reminder_batch_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i AutoSetParmsBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/autosetparmsbatch/job/gb_wkab_auto_set_parms_batch/build" >> windowsdeployDEV2.sh

var1=$(grep -i BenEngineLockingPayments ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/benenginelockingpayments/job/gb_wkab_ben_engine_locking_payments/build" >> windowsdeployDEV2.sh

var1=$(grep -i ComModeUpdateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/commodeupdatebatch/job/gb_wkab_com_mode_update_batch/build" >> windowsdeployDEV2.sh

var1=$(grep -i CommonBackgroundProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CommonBackgroundProcess/job/gb_wkab_common_background_process/build" >> windowsdeployDEV2.sh

var1=$(grep -i DisabilityAutoAdjudication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/disabilityautoadjudication/job/gb_wkab_disability_auto_adjudication/build" >> windowsdeployDEV2.sh

var1=$(grep -i EligibilityVerification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/EligibilityVerification/job/gb_wkab_eligibility_verification/build" >> windowsdeployDEV2.sh

var1=$(grep -i HIGGoLiveDateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/HIGGoLiveDateBatch/job/gb_wkab_hig_go_live_date_batch/build" >> windowsdeployDEV2.sh

var1=$(grep -i LTDClaimsLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ltdclaimsloadbalancer/job/gb_wkab_ltd_claims_load_balancer/build" >> windowsdeployDEV2.sh

var1=$(grep -i MemberEnrollmentProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/MemberEnrollmentProcessor/job/gb_wkab_member_enrollment_processor/build" >> windowsdeployDEV2.sh

var1=$(grep -i MonitorFileUpload ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/monitorfileupload/job/gb_wkab_monitor_file_upload/build" >> windowsdeployDEV2.sh

var1=$(grep -i PlanMaintNotificationBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/planmaintnotificationbatch/job/gb_wkab_plan_maint_notification_batch/build" >> windowsdeployDEV2.sh

var1=$(grep -i PRPacketCreator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/PRPacketCreator/job/gb_wkab_pr_packet_creator/build" >> windowsdeployDEV2.sh

var1=$(grep -i QueueListener ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/QueueListener/job/gb_wkab_queue_listener/build" >> windowsdeployDEV2.sh

var1=$(grep -i ScheduledRestAPIEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ScheduledRestAPIEventProcessor/job/gb_wkab_scheduled_restapi_event_processor/build" >> windowsdeployDEV2.sh

var1=$(grep -i ScheduledTaskToQueueProcessors ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/ScheduledTaskToQueueProcessors/job/gb_wkab_scheduled_task_to_queue_processors/build" >> windowsdeployDEV2.sh

var1=$(grep -i SendEmailBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/SendEmailBatchJob/job/gb_wkab_send_email_batch_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i StageCCICompanyData ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/StageCCICompanyData/job/gb_wkab_stage_cci_company_data/build" >> windowsdeployDEV2.sh

var1=$(grep -i StagedMessageProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/StagedMessageProcessor/job/gb_wkab_staged_message_processor/build" >> windowsdeployDEV2.sh

var1=$(grep -i STDFSMLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/STDFSMLoadBalancer/job/gb_wkab_stdfsm_load_balancer/build" >> windowsdeployDEV2.sh

var1=$(grep -i SuspendedPaymentsBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/SuspendedPaymentsBatchJob/job/gb_wkab_suspended_payments_batch_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i TaskStagingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/TaskStagingService/job/gb_wkab_task_staging_service/build" >> windowsdeployDEV2.sh

var1=$(grep -i TriggerForTextMessagingJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/TriggerForTextMessagingJob/job/gb_wkab_trigger_for_text_messaging_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i UnStructuredDataMigrator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UnStructuredDataMigrator/job/gb_wkab_unstructured_datamigrator/build" >> windowsdeployDEV2.sh

var1=$(grep -i UpdateFICALDW ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UpdateFICALDW/job/gb_wkab_update_ficaldw/build" >> windowsdeployDEV2.sh

var1=$(grep -i UserUploadedFilesBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/UserUploadedFilesBatchJob/job/gb_wkab_user_uploaded_files_batch_job/build" >> windowsdeployDEV2.sh

var1=$(grep -i VendorPortalDocumentUploadBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/VendorPortalDocumentUploadBatch/job/gb_wkab_vendor_portal_document_upload_batch/build" >> windowsdeployDEV2.sh

var1=$(grep -i TaxFileTransferSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WcpDPPFileNotifier/job/gb_wkab_wcp_dpp_file_notifier/build" >> windowsdeployDEV2.sh

var1=$(grep -i BatchPrint ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabBatchPrint/job/gb_wkab_batch_print/build" >> windowsdeployDEV2.sh

var1=$(grep -i EchoSignSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabEchoSignSvc/job/gb_wkab_echo_sign_svc/build" >> windowsdeployDEV2.sh

var1=$(grep -i FaxStatusRequestor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABFaxStatusRequestor/job/gb_wkab_fax_status_requestor/build" >> windowsdeployDEV2.sh

var1=$(grep -i MonitoringService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABMonitoringService/job/gb_wkab_monitoring_service/build" >> windowsdeployDEV2.sh

var1=$(grep -i WKABQueueProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABQueueProcessor/job/gb_wkab_queue_processor/build" >> windowsdeployDEV2.sh

var1=$(grep -i WKABReportsAutoAssignment ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABReportsAutoAssignment/job/gb_wkab_reports_auto_assignment/build" >> windowsdeployDEV2.sh

var1=$(grep -i ReportScheduler ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WkabScheduling/job/gb_wkab_scheduling/build" >> windowsdeployDEV2.sh

var1=$(grep -i WKABTaskProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/WKABTaskProcessor/job/gb_wkab_task_processor/build" >> windowsdeployDEV2.sh

#OnlineStatusQueueProcessor new
var1=$(grep -i "OnlineStatusQueueProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/OnlineStatusQueueProcessor/job/gb_wkab_online_status_queue_processor/build" >>webdeployDEV2.sh

#CMTHAAIntgProcessor new
var1=$(grep -i "CMTHAAIntgProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/CMTHAAIntgProcessor/job/gb_wkab_cm_thaa_intg_processor/build" >>windowsdeployDEV2.sh

#MUDIProcessor
var1=$(grep -i "MUDIProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_INT/job/WINDOWS_SERVICES/job/MUDIProcessor/job/gb_wkab_mudi_processor/build" >>windowsdeployDEV2.sh

#gb_wkab_thaa_thpa_DEV2

sh windowsdeployDEV2.sh
sh webdeployDEV2.sh

