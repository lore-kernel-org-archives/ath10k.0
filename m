Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15C3FA3740
	for <ath10k@archiver.kernel.org>; Thu, 27 Oct 2022 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUmFlxya5DDf2C3p4Z41ai0qCNAEokpVhyDniWyENm8=; b=KGNBVwdDOiVHiX
	7Ni6LDPGDXxtw4lJvKdioy7asDAfdntEIvsMH23yA/tOXjVdqhppY+ubgftBt6HBlWjgjZAI8ec1m
	MGrRPRH7fHSVlhnwBVQACaMXNw1P5UiDlNUWlMJFHw2TdGMTI3x0SZVjSUSJkUCt9+B1w/MD0ZLO/
	CCZNpJmRsjY45wuW7/F8Eba1dhtCYiRqGhg1P+FsaAxUCnVE83MqRccmxWooCgf1s7KIuBe/Bt7tC
	pa9LilpBOZJ4i96QddIHsq49C9NVusl+wVzw0maCmfPwLLIq/GUqg5ouDrSBNFwBNbHpro0izWwYQ
	YWtlxs/CVf1veq8TUxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo7wg-00EYTq-SC; Thu, 27 Oct 2022 18:49:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo7we-00EYTA-5D
	for ath10k@lists.infradead.org; Thu, 27 Oct 2022 18:49:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RIeTfB031496;
	Thu, 27 Oct 2022 18:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qU80G5IuJewnRXuhuLqjRrKAm2ZbJgQy4RLbVLj79cM=;
 b=JjAajOYr3YCxIC1ZpS2F2U3M/ozuYTNj5LYOGcLRztIeKeZSbfQnM6/9bpxRpO5lqX52
 VrOh70tbMefnTm0PInmJLCtYnrXpzpLP4IzN7qlULXpP9tyt8PbOyINFrJzI3/oLbkzh
 by6FFA6XcQPFXgU52LRCPdCNAMgn4DUfvo7uQHUVdS11c+AYlN0Mpfe/KXNhNc0ppNKd
 EbONDpWzb3nZ4F5wrxIl5UZaXXMHCHuRGCYhsBmHUJF9TTfX5e6Jk+twh4mEenyz0psm
 S5BJjL32527vcbLodVV7NR7l00rAXsctW0dApZHznNuC0xEYUXb5826o56FiyzUiAPdY pA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfyf7g0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 18:49:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29RInVx2027745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 18:49:31 GMT
Received: from [10.110.107.43] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 27 Oct
 2022 11:49:30 -0700
Message-ID: <b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
Date: Thu, 27 Oct 2022 11:49:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] wifi: ath10k: Add WLAN firmware image version info into
 smem
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221026102257.19919-1-quic_youghand@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221026102257.19919-1-quic_youghand@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hGvc-8cdkhodk9piGoKBBcbHnO_obbVa
X-Proofpoint-GUID: hGvc-8cdkhodk9piGoKBBcbHnO_obbVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_114936_235294_A190D40A 
X-CRM114-Status: GOOD (  23.94  )
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

On 10/26/2022 3:22 AM, Youghandhar Chintala wrote:
> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
> 
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
> 
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
> 
> This change is applicable only for WCN399X targets.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath10k/qmi.c | 28 +++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 66cb7a1e628a..e88bcfd96859 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -14,6 +14,7 @@
>   #include <linux/net.h>
>   #include <linux/platform_device.h>
>   #include <linux/qcom_scm.h>
> +#include <linux/soc/qcom/smem.h>
>   #include <linux/string.h>
>   #include <net/sock.h>
>   
> @@ -22,6 +23,8 @@
>   
>   #define ATH10K_QMI_CLIENT_ID		0x4b4e454c
>   #define ATH10K_QMI_TIMEOUT		30
> +#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469
> +#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13
>   
>   static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>   					 struct ath10k_msa_mem_info *mem_info)
> @@ -536,6 +539,29 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>   	return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>   }
>   
> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, char *fw_build_id)

const char *fw_build_id?

> +{
> +	u8 *smem_table_ptr;
> +	size_t smem_block_size;
> +	const u32 version_string_size = 128;

should you s/128/MAX_BUILD_ID_LEN/ since that is what is used to size 
qmi->fw_build_id?

or alternately have the caller pass fw_build_id length as a separate param?


> +	const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;
> +
> +	smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +				       ATH10K_SMEM_IMAGE_VERSION_TABLE,
> +				       &smem_block_size);
> +	if (IS_ERR(smem_table_ptr)) {
> +		ath10k_dbg(ar, ATH10K_DBG_QMI, "smem image version table not found");
> +		return;
> +	}
> +	if (smem_img_idx_wlan + version_string_size > smem_block_size) {
> +		ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %i",
> +			   smem_block_size);
> +		return;
> +	}
> +	memcpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id,
> +	       version_string_size);
> +}
> +
>   static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>   {
>   	struct wlfw_cap_resp_msg_v01 *resp;
> @@ -606,6 +632,8 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>   			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
>   	}
>   
> +	ath10k_qmi_add_wlan_ver_smem(ar, qmi->fw_build_id);
> +
>   	kfree(resp);
>   	return 0;
>   


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
