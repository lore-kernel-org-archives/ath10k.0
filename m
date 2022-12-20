Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB31C3DA7A
	for <ath10k@archiver.kernel.org>; Tue, 20 Dec 2022 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qLlOSrJmLRgbedq7bEkeJkpl84Ik7wfWsfq3wPDqgU=; b=NENJHr+PhzLnQa
	/gjNoKaxTFHDQTGvZGiFQuwh+vRiIyoQQL/oq6/uNIC2LwzBkLVHp2WPV+0tQYZh9jL5KWpIWt+Re
	8evSLWQQVTcKhp069G82bsLEx0MAIsMR+LRlRbQca79f/rjb9HdETO+LV6YfHFbn42uqEGckfyIuJ
	x0p/U6KOQuEcBzC/sQ4tHnYdvkbhQPi5SJ0nrQivN6jC39rQTJp4qg0+xAxfwdJSfaSr6Kf8Yrv63
	j5O7el4aC2FCGcgF81Y4vjueLWT9j9ioqGVaX80WGtyFS3L/K0Bw435nxD+v8gyPJpjs/Bbg+rBE/
	XRffg1ZmCdcuG9t77qJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bah-00Ec0U-WC; Tue, 20 Dec 2022 12:19:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bWF-00EWQy-PT
	for ath10k@lists.infradead.org; Tue, 20 Dec 2022 12:14:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKABAMI032452;
	Tue, 20 Dec 2022 12:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wLqDcO+Wsi26P0nos/+8/kSQfghM5ThFrgbZ4/Pqpn8=;
 b=jVXUPoovH6l3UXbdHTkvrxkegxnp9pGaYIGsoK8PPCPQqIyEgHztqL+dn0fLRDj1dAQu
 iVegfwcwYkmvD2UQPSwNMS2B2SShNkEtJx7yCngp7RifeS5cWlhdQCF+FkduNx3GfLkx
 gz4XDNWR8wDM8u/0Fq/+H6MIhFWPntWkzgJRWDCfUxgl+8uhFbY/ouyXdLn+1Jz90cKP
 Mr/XgXuSbtZ7Ut9LuS3NsGwdI2Rq1YHTM1W8dYwJFjjG/oAPY1HJIQ6OeHTtJWBe4uqT
 i4s9LMEvJ88oz6PZNOcWWFWHpQMr8MBRmiKlq8nPGGz+YqX2vRiYydjb/+PzzdshSYQZ hQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk39t96pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 12:14:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BKCEdqR003361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 12:14:39 GMT
Received: from [10.216.28.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 20 Dec
 2022 04:14:35 -0800
Message-ID: <56d4941a-ad35-37ca-48ca-5f1bf7a86d25@quicinc.com>
Date: Tue, 20 Dec 2022 17:44:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ath10k: snoc: enable threaded napi on WCN3990
Content-Language: en-US
To: Abhishek Kumar <kuabhs@chromium.org>, <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
References: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y7oCJvTmlbthnqGTIZ5zOR0qIdiaHjqF
X-Proofpoint-GUID: y7oCJvTmlbthnqGTIZ5zOR0qIdiaHjqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_05,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_041451_970107_0FEA5FBD 
X-CRM114-Status: GOOD (  22.57  )
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

On 12/20/2022 1:25 PM, Abhishek Kumar wrote:
> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
> 
> Based on testing, it was observed that on WCN3990, the CPU0 reaches
> 100% utilization when napi runs in softirq context. At the same
> time the other CPUs are at low consumption percentage. This
> does not allow device to reach its maximum throughput potential.
> After enabling threaded napi, CPU load is balanced across all CPUs
> and following improvments were observed:
> - UDP_RX increase by ~22-25%
> - TCP_RX increase by ~15%
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
> 
>   drivers/net/wireless/ath/ath10k/core.c | 16 ++++++++++++++++
>   drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
>   drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 5eb131ab916fd..ee4b6ba508c81 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -100,6 +100,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA988X_HW_2_0_VERSION,
> @@ -140,6 +141,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9887_HW_1_0_VERSION,
> @@ -181,6 +183,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_2_VERSION,
> @@ -217,6 +220,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA6174_HW_2_1_VERSION,
> @@ -257,6 +261,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA6174_HW_2_1_VERSION,
> @@ -297,6 +302,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_0_VERSION,
> @@ -337,6 +343,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_2_VERSION,
> @@ -381,6 +388,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA99X0_HW_2_0_DEV_VERSION,
> @@ -427,6 +435,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9984_HW_1_0_DEV_VERSION,
> @@ -480,6 +489,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9888_HW_2_0_DEV_VERSION,
> @@ -530,6 +540,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_0_DEV_VERSION,
> @@ -570,6 +581,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> @@ -612,6 +624,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> @@ -645,6 +658,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = QCA4019_HW_1_0_DEV_VERSION,
> @@ -692,6 +706,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = false,
>   		.use_fw_tx_credits = true,
>   		.delay_unmap_buffer = false,
> +		.enable_threaded_napi = false,
>   	},
>   	{
>   		.id = WCN3990_HW_1_0_DEV_VERSION,
> @@ -725,6 +740,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.hw_restart_disconnect = true,
>   		.use_fw_tx_credits = false,
>   		.delay_unmap_buffer = true,
> +		.enable_threaded_napi = true,
>   	},
>   };
>   
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 9643031a4427a..adf3076b96503 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -639,6 +639,8 @@ struct ath10k_hw_params {
>   	bool use_fw_tx_credits;
>   
>   	bool delay_unmap_buffer;
> +
> +	bool enable_threaded_napi;
>   };
>   
>   struct htt_resp;
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index cfcb759a87dea..b94150fb6ef06 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -927,6 +927,9 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>   
>   	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
>   
> +	if (ar->hw_params.enable_threaded_napi)
> +		dev_set_threaded(&ar->napi_dev, true);
> +

Since this is done in the API specific to WCN3990, we do not need 
hw_param for this.

Thanks,
Manikanta

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
