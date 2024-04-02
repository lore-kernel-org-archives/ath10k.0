Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A377FCD1292
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P6lCXGL05+i1lMIsQ7f0v/gdohz3mD8/93L+hdgx8k=; b=pARgnnHAKtSKfDMHJlUyJzw+bu
	03wQSiazM4TnzOajutueV3pJEsDOQZc0qP09ugi20dd5hFJ9sAiPzsqPZ5GA8mZY6QchcZTTdJtAa
	Gqlzx5tTgFgqSffgw3bsyROFHWQA6mupw44EwA2ilZK0KLw1Kqkx9uTnSNZA5Yw6gzzMf8Uq73xEH
	dRF2eS/FW7dLiOzBzZagS7M5KyZvOz8SVEZ5Nmuwmlp85p0HegzYaESumpzGGOMZLe8Oww4e5G9sk
	AVTdlX47vmJyPPNhvnsieiOL+a/JIw+FjVJ3xjjLy2jt64uXMXRTwnrtwh4KL+sOTwZrq6n/nx0fS
	B4T/z3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrimM-0000000CLih-49Xd;
	Tue, 02 Apr 2024 18:22:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrimJ-0000000CLec-0Ien
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 18:22:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432HE0Qd004187;
	Tue, 2 Apr 2024 18:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1P6lCXGL05+i1lMIsQ7f0v/gdohz3mD8/93L+hdgx8k=; b=io
	C1Dld9hy88+kFw4SzQlW4J3xTTreB6pXhcTow1GmtQ04zmEbvTSozHIgaZBYr6pk
	OUc9FCnQm3eAblCF3FNJ+GNZSJXSfpeanzt8hNjXyzHc3kSOCOW28BkXdnhzEHHB
	CJMT6tKv5R03ieG9jm47z8aMuqKIa62KdxxWsgJBzVYZlFs8ETZg6cPuu6nHw3Jm
	zD85yGLzgK2+aNPs5v2liekOFamlxOU5dAw2Whs8aN4e1ZgGEpQkxZ8dImY8K3Co
	9wLkc6oUGoKQckZQbP+7nuQEZJSrcN7c8zSwU6fTyA7qZsN1Zj7cxAuQMWdzM8FA
	ki+WjSTyMLHHYP64Sd6A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ny5g77x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 18:22:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432IMM8K025645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 18:22:22 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 11:22:21 -0700
Message-ID: <36890ee7-ab9e-448c-ae30-7a75ac28b496@quicinc.com>
Date: Tue, 2 Apr 2024 11:22:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Kalle Valo <kvalo@kernel.org>, ath10k
	<ath10k@lists.infradead.org>,
        wireless <linux-wireless@vger.kernel.org>,
        DT
	<devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>,
        Jami Kettunen
	<jamipkettunen@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BZ45NmR5DTuKqoKSo_ocI3CiLNdpmfFC
X-Proofpoint-ORIG-GUID: BZ45NmR5DTuKqoKSo_ocI3CiLNdpmfFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_12,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_112235_359283_11E1CD5A 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 4/2/2024 8:55 AM, Dmitry Baryshkov wrote:
> I'd say, we should take a step back and actually verify how this was
> handled in the vendor kernel.

(error handling and other non-QMI code removed from the following for readability)

In ath10k we unconditionally call the following in
ath10k_qmi_event_server_arrive():
	ret = ath10k_qmi_host_cap_send_sync(qmi);
	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
	ret = ath10k_qmi_setup_msa_permissions(qmi);
	ret = ath10k_qmi_msa_ready_send_sync_msg(qmi);
	ret = ath10k_qmi_cap_send_sync_msg(qmi);

In vendor icnss2 there is conditional logic in icnss_driver_event_server_arrive():
	if (priv->device_id == WCN6750_DEVICE_ID ||
	    priv->device_id == WCN6450_DEVICE_ID) {
		ret = wlfw_host_cap_send_sync(priv);
	}

	if (priv->device_id == ADRASTEA_DEVICE_ID) {
		ret = wlfw_msa_mem_info_send_sync_msg(priv);
		ret = wlfw_msa_ready_send_sync_msg(priv);
	}

	ret = wlfw_cap_send_sync_msg(priv);

reference:
https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/platform/-/blob/wlan-platform.lnx.1.0.r1-rel/icnss2/main.c?ref_type=heads#L890

/jeff

