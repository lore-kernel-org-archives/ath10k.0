Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D43C4332F
	for <ath10k@archiver.kernel.org>; Thu, 17 Nov 2022 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xPC/OPir3Z3RgjJfQXDaXoQVuoKGVFLdS/TioKc2ec=; b=HJIJUZMsl594vb
	NxX8ojYncp2DZ870voLZh1SHRPiuEmC6mqX7gk4TVOpQlWAjCjczYWuQYYCwH0fCDJDYC11pZfPcu
	asPdN+m5l1KH+Hj9f81mJtADEB9lxk4WJoeLKcKDV5J2Dfd/ZRZiNLwrTnIZEpd8svv2z1neMJnLx
	w+ny2GLRoNeSc06K7ZFGbQkcYL47Hud2eUCyzen083Ddg6TC2GTep3ToDPMixc7rXNEuiOmS+/dXF
	nWH/mzmkJ1U9IUpYb+utFo+//Lzxgx+LF3YM7UMCJM4I0FGQH8Q9Ohb9y5qbVtBL2pdHPHYZW3kOu
	dEbZqQzVOTk3O+lXLiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovj8D-00GXTT-VQ; Thu, 17 Nov 2022 17:56:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovj84-00GXL4-Jf
	for ath10k@lists.infradead.org; Thu, 17 Nov 2022 17:56:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AHHpvnP007922;
	Thu, 17 Nov 2022 17:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CWJAfnwyh5Q9V5PWdy4ziO9VlLOg/mrmsCUrHWibKhM=;
 b=hSuESqvVxDH4K0PFc83716rKu7EQE+N/6UQ1SJqF5oURw+3BqcoOrjcOv6Qf6dW767NW
 R8QAZBvGg1FMyq2lfCXg74ZuntF4Z2fx02Bjwgq9Qubpqjixgj4JmWvIvmjtdI7cIwRh
 JXxgJdvK01U3j1aEjm29FgYOMhPM2Umep74Yf0BKBxKvGRmA7aSGfy+J8wuaIsXKiU2U
 F7a803nBKNz+vaA4MDRhio9elVJdooxnUmm26GkO2nNoTY6wss580aJpKywxA9nszie6
 o5lt3bQTinOvpLkb7WmXudcPkNgSN+u4G8MBSKqd6G8XR1GdkicGQx+AcC6np0g+ylox cw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kws2m87sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 17:56:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AHHubOr013696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 17:56:37 GMT
Received: from [10.216.15.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 17 Nov
 2022 09:56:35 -0800
Message-ID: <9ba8f115-9f21-9edd-059d-638ad11b781f@quicinc.com>
Date: Thu, 17 Nov 2022 23:26:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3] wifi: ath10k: Add WLAN firmware image version info
 into smem
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>, <ath10k@lists.infradead.org>
References: <20221111114235.10287-1-quic_youghand@quicinc.com>
 <87edu5bsjw.fsf@kernel.org>
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <87edu5bsjw.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JvzufnOMUDgRPdNxsOKLbd7ZmP2wWX92
X-Proofpoint-GUID: JvzufnOMUDgRPdNxsOKLbd7ZmP2wWX92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_095648_749985_82C43D99 
X-CRM114-Status: GOOD (  19.34  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


On 11/14/2022 6:29 PM, Kalle Valo wrote:
> Youghandhar Chintala <quic_youghand@quicinc.com> writes:
>
>> In a SoC based solution, it would be useful to know the versions of the
>> various binary firmware blobs the system is running on. On a QCOM based
>> SoC, this info can be obtained from socinfo debugfs infrastructure. For
>> this to work, respective subsystem drivers have to export the firmware
>> version information to an SMEM based version information table.
>>
>> Having firmware version information at one place will help quickly
>> figure out the firmware versions of various subsystems on the device
>> instead of going through builds/logs in an event of a system crash.
>>
>> Fill WLAN firmware version information in SMEM version table to be
>> printed as part of socinfo debugfs infrastructure on a Qualcomm based
>> SoC.
>>
>> This change is applicable only for WCN399X targets.
>>
>> Example:
>> cat /sys/kernel/debug/qcom_socinfo/cnss/name
>> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>> ---
>> Changes from v2:
>>   - Removed blank line between trailers
>>   - Changed memcpy to strscpy
>>   - Removed version_string_size
>>   - Added new condition fw_build_id against max length
>>   - Added depends on QCOM_SMEM for ath10k_snoc
>> ---
>>   drivers/net/wireless/ath/ath10k/Kconfig |  1 +
>>   drivers/net/wireless/ath/ath10k/qmi.c   | 34 +++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
>> index ca007b800f75..e6ea884cafc1 100644
>> --- a/drivers/net/wireless/ath/ath10k/Kconfig
>> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
>> @@ -44,6 +44,7 @@ config ATH10K_SNOC
>>   	tristate "Qualcomm ath10k SNOC support"
>>   	depends on ATH10K
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on QCOM_SMEM
>>   	select QCOM_SCM
>>   	select QCOM_QMI_HELPERS
> Is there a reason why you used "depends on"? Other QCOM dependencies
> used "select", so I'm wondering if QCOM_SMEM should also use select?
Sure Kalle. As suggested will change it to select.
>
> Please also use ath10k list for ath10k patches, not ath11k.
Apologies, My bad.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
