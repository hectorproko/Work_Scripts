#! /bin/bash

echo "Paste token:"
read token
user="IN10421"
echo >webdeployQA2.sh;
echo >windowsdeployQA2.sh;
#Log in user and password

#Need to add VendorPortal and THAAClaimService

#Creating sh file for web deploy.

var1=$(grep -i IVRRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/IVRRestAPIService/job/gb_wkab_ivr_restapi_service/build" >>webdeployQA2.sh

var1=$(grep -i CustomerPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/WorkabilityCustomerPortal/job/gb_wkab_customer_portal/build" >>webdeployQA2.sh

var1=$(grep -i ExternalPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/WorkAbilityExternalPortal/job/gb_wkab_external_portal/build" >>webdeployQA2.sh

var1=$(grep -i ClaimService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/claimservice/job/gb_wkab_claim_service/build" >>webdeployQA2.sh

var1=$(grep -i CommunicationsIndexer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/communicationsindexer/job/gb_wkab_communications_indexer/build" >>webdeployQA2.sh

var1=$(grep -i CommunicationsMaintenance ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/communicationsmaintenance/job/gb_wkab_communications_maintenance/build" >>webdeployQA2.sh

var1=$(grep -i DQManager_Web ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/DQMgrWeb/job/gb_wkab_dq_mgr_web/build" >>webdeployQA2.sh

var1=$(grep -i EchoSignRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/echosignrestapiservice/job/gb_wkab_echo_sign_rest_api_service/build" >>webdeployQA2.sh

var1=$(grep -i GroupInsuranceLandingUI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/GroupInsuranceLandingUI/job/gb_wkab_group_insurance_landing_ui/build" >>webdeployQA2.sh

var1=$(grep -i MemberService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/memberservice/job/gb_wkab_member_service/build" >>webdeployQA2.sh

var1=$(grep -i TaskService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/taskservice/job/gb_wkab_task_service/build" >>webdeployQA2.sh

var1=$(grep -i THAAPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ThaaPortalServices/job/gb_wkab_thaa_portal_services/build" >>webdeployQA2.sh

var1=$(grep -i UtilityService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/UtilityService/job/gb_wkab_utility_service/build" >>webdeployQA2.sh

var1=$(grep -i WcpWebService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WcpWebService/job/gb_wkab_wcp_web_service/build" >>webdeployQA2.sh

var1=$(grep -i ApplicationIntegration ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABApplicationIntegration/job/gb_wkab_application_integration/build" >>webdeployQA2.sh

var1=$(grep -i WKABPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABPortalService/job/gb_wkab_portal_service/build" >>webdeployQA2.sh

var1=$(grep -i ReportingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABReportingService/job/gb_wkab_reporting_service/build" >>webdeployQA2.sh

var1=$(grep -i RestLetterService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABRestLetterService/job/gb_wkab_rest_letter_service/build" >>webdeployQA2.sh

var1=$(grep -i "WorkAbilityExt\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityExt/job/gb_wkab_workability_ext/build" >>webdeployQA2.sh

var1=$(grep -i WorkAbilityExtWebAPI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityExtWebAPI/job/gb_wkab_workability_ext_web_api/build" >>webdeployQA2.sh

var1=$(grep -i WorkAbilityRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityRestAPIService/job/gb_wkab_restapi_service/build" >>webdeployQA2.sh

var1=$(grep -i Tools ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkabilityTools/job/gb_wkab_tools/build" >>webdeployQA2.sh

var1=$(grep -i WKABTransProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkabilityTransaction/job/gb_wkab_workability_transaction/build" >>webdeployQA2.sh

var1=$(grep -i WoteService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WoteService/job/gb_wkab_wote_service/build" >>webdeployQA2.sh

#CaseContactEmailProcess 4/9/2019 added
var1=$(grep -i CaseContactEmailProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CaseContactEmailProcess/job/gb_wkab_case_contact_email_process/build" >> windowsdeployQA2.sh

echo "sleep 5m" >> webdeployQA2.sh
var1=$(grep -i "ARMS\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ARMS/job/gb_wkab_arms/build" >>webdeployQA2.sh

echo "sleep 1m" >> webdeployQA2.sh
var1=$(grep -i BenEngStoredProcPull ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/BENEFITENGINE/job/gb_wkab_benefit_engine/build" >>webdeployQA2.sh

echo "sleep 1m" >> webdeployQA2.sh
var1=$(grep -i ScriptPageRewrite ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ScriptEngine/job/gb_wkab_script_engine/build" >>webdeployQA2.sh

echo "sleep 1m" >> webdeployQA2.sh
var1=$(grep -i WotesApplication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/wotesapplication/job/gb_wkab_wotes_application/build" >>webdeployQA2.sh

echo "sleep 90s" >> webdeployQA2.sh
var1=$(grep -i "WorkAbility\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/workability/job/gb_wkab_workability/build" >>webdeployQA2.sh

#VendorPortalUI
var1=$(grep -i "VendorPortalUI\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/vendorportalui/job/gb_wkab_vendor_portal_ui_QA2/build" >>webdeployQA2.sh

#THAADisClaimRESTService
var1=$(grep -i "DisClaimRESTService\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/THAADisClaimRESTService/job/gb_wkab_thaa_dis_claim_rest_service/build" >>webdeployQA2.sh

#THAATMIntegration
var1=$(grep -i "THAATMIntegration\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/THAATMIntegration/job/gb_wkab_thaatm_integration/build" >>webdeployQA2.sh


#Creating sh file for windows deploy.

var1=$(grep -i AccumulatorEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AccumulatorEventProcessor/job/gb_wkab_accumulator_event_processor/build" >> windowsdeployQA2.sh

var1=$(grep -i AlertNotification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AlertNotificationBatchJob/job/gb_wkab_alert_notification_batch_job/build" >> windowsdeployQA2.sh

var1=$(grep -i AppointmentReminder ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AppointmentReminderBatchJob/job/gb_wkab_appointment_reminder_batch_job/build" >> windowsdeployQA2.sh

var1=$(grep -i AutoSetParmsBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AutoSetParmsBatch/job/gb_wkab_auto_set_parms_batch/build" >> windowsdeployQA2.sh

var1=$(grep -i BenEngineLockingPayments ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/BenEngineLockingPayments/job/gb_wkab_ben_engine_locking_payments/build" >> windowsdeployQA2.sh

var1=$(grep -i ComModeUpdateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ComModeUpdateBatch/job/gb_wkab_com_mode_update_batch/build" >> windowsdeployQA2.sh

var1=$(grep -i CommonBackgroundProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CommonBackgroundProcess/job/gb_wkab_common_background_process/build" >> windowsdeployQA2.sh

var1=$(grep -i DisabilityAutoAdjudication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/DisabilityAutoAdjudication/job/gb_wkab_disability_auto_adjudication/build" >> windowsdeployQA2.sh

var1=$(grep -i EligibilityVerification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/EligibilityVerification/job/gb_wkab_eligibility_verification/build" >> windowsdeployQA2.sh

var1=$(grep -i HIGGoLiveDateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/HIGGoLiveDateBatch/job/gb_wkab_hig_go_live_date_batch/build" >> windowsdeployQA2.sh

var1=$(grep -i LTDClaimsLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/LTDClaimsLoadBalancer/job/gb_wkab_ltd_claims_load_balancer/build" >> windowsdeployQA2.sh

var1=$(grep -i MemberEnrollmentProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MemberEnrollmentProcessor/job/gb_wkab_member_enrollment_processor/build" >> windowsdeployQA2.sh

var1=$(grep -i MonitorFileUpload ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MonitorFileUpload/job/gb_wkab_monitor_file_upload/build" >> windowsdeployQA2.sh

var1=$(grep -i PlanMaintNotificationBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/PlanMaintNotificationBatch/job/gb_wkab_plan_maint_notification_batch/build" >> windowsdeployQA2.sh

var1=$(grep -i PRPacketCreator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/PRPacketCreator/job/gb_wkab_pr_packet_creator/build" >> windowsdeployQA2.sh

var1=$(grep -i QueueListener ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/QueueListener/job/gb_wkab_queue_listener/build" >> windowsdeployQA2.sh

var1=$(grep -i ScheduledRestAPIEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ScheduledRestAPIEventProcessor/job/gb_wkab_scheduled_restapi_event_processor/build" >> windowsdeployQA2.sh

var1=$(grep -i ScheduledTaskToQueueProcessors ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ScheduledTaskToQueueProcessors/job/gb_wkab_scheduled_task_to_queue_processors/build" >> windowsdeployQA2.sh

var1=$(grep -i SendEmailBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/SendEmailBatchJob/job/gb_wkab_send_email_batch_job/build" >> windowsdeployQA2.sh

var1=$(grep -i StageCCICompanyData ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/StageCCICompanyData/job/gb_wkab_stage_cci_company_data/build" >> windowsdeployQA2.sh

var1=$(grep -i StagedMessageProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/StagedMessageProcessor/job/gb_wkab_staged_message_processor/build" >> windowsdeployQA2.sh

var1=$(grep -i STDFSMLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/STDFSMLoadBalancer/job/gb_wkab_stdfsm_load_balancer/build" >> windowsdeployQA2.sh

var1=$(grep -i SuspendedPaymentsBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/SuspendedPaymentsBatchJob/job/gb_wkab_suspended_payments_batch_job/build" >> windowsdeployQA2.sh

var1=$(grep -i TaskStagingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/TaskStagingService/job/gb_wkab_task_staging_service/build" >> windowsdeployQA2.sh

var1=$(grep -i TriggerForTextMessagingJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/TriggerForTextMessagingJob/job/gb_wkab_trigger_for_text_messaging_job/build" >> windowsdeployQA2.sh

var1=$(grep -i UnStructuredDataMigrator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UnStructuredDataMigrator/job/gb_wkab_unstructured_datamigrator/build" >> windowsdeployQA2.sh

var1=$(grep -i UpdateFICALDW ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UpdateFICALDW/job/gb_wkab_update_ficaldw/build" >> windowsdeployQA2.sh

var1=$(grep -i UserUploadedFilesBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UserUploadedFilesBatchJob/job/gb_wkab_user_uploaded_files_batch_job/build" >> windowsdeployQA2.sh

var1=$(grep -i VendorPortalDocumentUploadBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/VendorPortalDocumentUploadBatch/job/gb_vendor_portal_document_QA2/build" >> windowsdeployQA2.sh

var1=$(grep -i TaxFileTransferSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WcpDPPFileNotifier/job/gb_wkab_wcp_dpp_file_notifier/build" >> windowsdeployQA2.sh

var1=$(grep -i BatchPrint ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WkabBatchPrint/job/gb_wkab_batch_print/build" >> windowsdeployQA2.sh

var1=$(grep -i EchoSignSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WkabEchoSignSvc/job/gb_wkab_echo_sign_svc/build" >> windowsdeployQA2.sh

var1=$(grep -i FaxStatusRequestor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABFaxStatusRequestor/job/gb_wkab_fax_status_requestor/job/gb_wkab_fax_status_requestor/build" >> windowsdeployQA2.sh

var1=$(grep -i MonitoringService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABMonitoringService/job/gb_wkab_monitoring_service/build" >> windowsdeployQA2.sh

var1=$(grep -i WKABQueueProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABQueueProcessor/job/gb_wkab_queue_processor/build" >> windowsdeployQA2.sh

var1=$(grep -i WKABReportsAutoAssignment ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABReportsAutoAssignment/job/gb_wkab_reports_auto_assignment/build" >> windowsdeployQA2.sh

var1=$(grep -i ReportScheduler ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABScheduling/job/gb_wkab_scheduling/build" >> windowsdeployQA2.sh

var1=$(grep -i WKABTaskProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABTaskProcessor/job/gb_wkab_task_processor/build" >> windowsdeployQA2.sh

#OnlineStatusQueueProcessor new
var1=$(grep -i "OnlineStatusQueueProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/OnlineStatusQueueProcessor/job/gb_wkab_online_status_queue_processor/build" >>windowsdeployQA2.sh

#CMTHAAIntgProcessor new
var1=$(grep -i "CMTHAAIntgProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CMTHAAIntgProcessor/job/gb_wkab_cm_thaa_intg_processor/build" >>windowsdeployQA2.sh

#MUDIProcessor
var1=$(grep -i "MUDIProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user $user:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MUDIProcessor/job/gb_wkab_mudi_processor/build" >>windowsdeployQA2.sh



sh windowsdeployQA2.sh
sh webdeployQA2.sh



> QA2done.txt