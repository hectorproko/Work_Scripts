#! /bin/bash
echo >webdeploySTG2.sh;
echo >windowsdeploySTG2.sh;
#IN10195:Infy@1507
#Creating sh file for web deploy.

echo "Paste token:"
read token

var1=$(grep -i IVRRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/IVRRestAPIService/job/gb_wkab_ivr_restapi_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i CustomerPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/WorkabilityCustomerPortal/job/gb_wkab_customer_portal_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i ExternalPortal ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/WorkAbilityExternalPortal/job/gb_wkab_external_portal_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i ClaimService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/claimservice/job/gb_wkab_claim_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i CommunicationsIndexer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/communicationsindexer/job/gb_wkab_communications_indexer_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i CommunicationsMaintenance ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/communicationsmaintenance/job/gb_wkab_communications_maintenance_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i DQManager_Web ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/DQMgrWeb/job/gb_wkab_dq_mgr_web_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i EchoSignRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/echosignrestapiservice/job/gb_wkab_echo_sign_rest_api_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i GroupInsuranceLandingUI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/GroupInsuranceLandingUI/job/gb_wkab_group_insurance_landing_ui_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i MemberService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/memberservice/job/gb_wkab_member_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i TaskService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/taskservice/job/gb_wkab_task_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i THAAPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ThaaPortalServices/job/gb_wkab_thaa_portal_services_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i UtilityService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/UtilityService/job/gb_wkab_utility_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WcpWebService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WcpWebService/job/gb_wkab_wcp_web_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i ApplicationIntegration ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABApplicationIntegration/job/gb_wkab_application_integration_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WKABPortalService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABPortalService/job/gb_wkab_portal_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i ReportingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABReportingService/job/gb_wkab_reporting_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i RestLetterService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WKABRestLetterService/job/gb_wkab_rest_letter_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i "WorkAbilityExt\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityExt/job/gb_wkab_workability_ext_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WorkAbilityExtWebAPI ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityExtWebAPI/job/gb_wkab_workability_ext_web_api_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WorkAbilityRestAPIService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkAbilityRestAPIService/job/gb_wkab_restapi_service_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i Tools ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkabilityTools/job/gb_wkab_tools_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WKABTransProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WorkabilityTransaction/job/gb_wkab_workability_transaction_STG2/build" >>webdeploySTG2.sh

var1=$(grep -i WoteService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/WoteService/job/gb_wkab_wote_service_STG2/build" >>webdeploySTG2.sh

echo "sleep 5m" >> webdeploySTG2.sh
var1=$(grep -i "ARMS\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ARMS/job/gb_wkab_arms_STG2/build" >>webdeploySTG2.sh

echo "sleep 40s" >> webdeploySTG2.sh
var1=$(grep -i BenEngStoredProcPull ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/BENEFITENGINE/job/gb_wkab_benefit_engine_STG2/build" >>webdeploySTG2.sh

echo "sleep 40s" >> webdeploySTG2.sh
var1=$(grep -i ScriptPageRewrite ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/ScriptEngine/job/gb_wkab_script_engine_STG2/build" >>webdeploySTG2.sh

echo "sleep 1m" >> webdeploySTG2.sh
var1=$(grep -i WotesApplication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/wotesapplication/job/gb_wkab_wotes_application_STG2/build" >>webdeploySTG2.sh

echo "sleep 90s" >> webdeploySTG2.sh
var1=$(grep -i "WorkAbility\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/workability/job/gb_wkab_workability_STG2/build" >>webdeploySTG2.sh

#VendorPortalUI new
var1=$(grep -i "VendorPortalUI\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/vendorportalui/job/gb_wkab_vendor_portal_ui_STG2/build" >>webdeploySTG2.sh

#THAADisClaimRESTService new
var1=$(grep -i "DisClaimRESTService\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/THAADisClaimRESTService/job/gb_wkab_thaa_dis_claim_rest_service_STG2/build" >>webdeploySTG2.sh

#THAATMIntegration
var1=$(grep -i "THAATMIntegration\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/web_services/job/THAATMIntegration/job/gb_wkab_thaatm_integration_STG2/build" >>webdeploySTG2.sh


#Creating sh file for windows deploy.

var1=$(grep -i AccumulatorEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AccumulatorEventProcessor/job/gb_wkab_accumulator_event_processor_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i AlertNotification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AlertNotificationBatchJob/job/gb_wkab_alert_notification_batch_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i AppointmentReminder ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AppointmentReminderBatchJob/job/gb_wkab_appointment_reminder_batch_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i AutoSetParmsBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/AutoSetParmsBatch/job/gb_wkab_auto_set_parms_batch_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i BenEngineLockingPayments ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/BenEngineLockingPayments/job/gb_wkab_ben_engine_locking_payments_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i ComModeUpdateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ComModeUpdateBatch/job/gb_wkab_com_mode_update_batch_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i CommonBackgroundProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CommonBackgroundProcess/job/gb_wkab_common_background_process_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i DisabilityAutoAdjudication ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/DisabilityAutoAdjudication/job/gb_wkab_disability_auto_adjudication_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i EligibilityVerification ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/EligibilityVerification/job/gb_wkab_eligibility_verification_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i HIGGoLiveDateBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/HIGGoLiveDateBatch/job/gb_wkab_hig_go_live_date_batch_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i LTDClaimsLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/LTDClaimsLoadBalancer/job/gb_wkab_ltd_claims_load_balancer_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i MemberEnrollmentProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MemberEnrollmentProcessor/job/gb_wkab_member_enrollment_processor_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i MonitorFileUpload ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MonitorFileUpload/job/gb_wkab_monitor_file_upload_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i PlanMaintNotificationBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/PlanMaintNotificationBatch/job/gb_wkab_plan_maint_notification_batch_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i PRPacketCreator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/PRPacketCreator/job/gb_wkab_pr_packet_creator_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i QueueListener ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/QueueListener/job/gb_wkab_queue_listener_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i ScheduledRestAPIEventProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ScheduledRestAPIEventProcessor/job/gb_wkab_scheduled_restapi_event_processor_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i ScheduledTaskToQueueProcessors ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/ScheduledTaskToQueueProcessors/job/gb_wkab_scheduled_task_to_queue_processors_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i SendEmailBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/SendEmailBatchJob/job/gb_wkab_send_email_batch_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i StageCCICompanyData ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/StageCCICompanyData/job/gb_wkab_stage_cci_company_data_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i StagedMessageProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/StagedMessageProcessor/job/gb_wkab_staged_message_processor_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i STDFSMLoadBalancer ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/STDFSMLoadBalancer/job/gb_wkab_stdfsm_load_balancer_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i SuspendedPaymentsBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/SuspendedPaymentsBatchJob/job/gb_wkab_suspended_payments_batch_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i TaskStagingService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/TaskStagingService/job/gb_wkab_task_staging_service_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i TriggerForTextMessagingJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/TriggerForTextMessagingJob/job/gb_wkab_trigger_for_text_messaging_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i UnStructuredDataMigrator ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UnStructuredDataMigrator/job/gb_wkab_unstructured_datamigrator_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i UpdateFICALDW ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UpdateFICALDW/job/gb_wkab_update_ficaldw_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i UserUploadedFilesBatchJob ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/UserUploadedFilesBatchJob/job/gb_wkab_user_uploaded_files_batch_job_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i VendorPortalDocumentUploadBatch ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/VendorPortalDocumentUploadBatch/job/gb_vendor_portal_document_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i TaxFileTransferSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WcpDPPFileNotifier/job/gb_wkab_wcp_dpp_file_notifier_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i BatchPrint ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WkabBatchPrint/job/gb_wkab_batch_print_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i EchoSignSvc ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WkabEchoSignSvc/job/gb_wkab_echo_sign_svc_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i FaxStatusRequestor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABFaxStatusRequestor/job/gb_wkab_fax_status_requestor_STG2/job/gb_wkab_fax_status_requestor/build" >> windowsdeploySTG2.sh

var1=$(grep -i MonitoringService ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABMonitoringService/job/gb_wkab_monitoring_service_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i WKABQueueProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABQueueProcessor/job/gb_wkab_queue_processor_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i WKABReportsAutoAssignment ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABReportsAutoAssignment/job/gb_wkab_reports_auto_assignment_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i ReportScheduler ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABScheduling/job/gb_wkab_scheduling_STG2/build" >> windowsdeploySTG2.sh

var1=$(grep -i WKABTaskProcessor ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/WKABTaskProcessor/job/gb_wkab_task_processor_STG2/build" >> windowsdeploySTG2.sh

#CaseContactEmailProcess
var1=$(grep -i CaseContactEmailProcess ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CaseContactEmailProcess/job/gb_wkab_case_contact_email_process_STG2/build" >> windowsdeploySTG2.sh

#OnlineStatusQueueProcessor new
var1=$(grep -i "OnlineStatusQueueProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/OnlineStatusQueueProcessor/job/gb_wkab_online_status_queue_processor_STG2/build" >>windowsdeploySTG2.sh

#CMTHAAIntgProcessor new
var1=$(grep -i "CMTHAAIntgProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/CMTHAAIntgProcessor/job/gb_wkab_cm_thaa_intg_processor_STG2/build" >>windowsdeploySTG2.sh

#MUDIProcessor
var1=$(grep -i "MUDIProcessor\." ./version.txt | grep -o "1.*\..*\.0")
[ -z "$var1" ] && echo "NOT found <<<" || echo "Match found"
echo "curl -X POST -k --user IN10421:$token --data-urlencode json='{\"parameter\": [{\"name\":\"NexusArtifactVersion\", \"value\":\"$var1\"}]}' https://jenkins02.COMPANY.com/job/GB/job/WorkAbility/job/WKAB_APPS/job/Deploy_QA/job/windows_services/job/MUDIProcessor/job/gb_wkab_mudi_processor_STG2/build" >>windowsdeploySTG2.sh

sh windowsdeploySTG2.sh
sh webdeploySTG2.sh


> STG2done.txt