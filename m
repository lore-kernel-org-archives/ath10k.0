Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69955C54E5D
	for <ath10k@archiver.kernel.org>; Thu, 14 Mar 2024 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIji4b2JeI41GT7wexHROmx9KAP8DekVDJtbPMjgATE=; b=bFD+ivQuK7TgytV4gMqnlM3J+J
	/eou/FnFW8zO8QMb1bjhoRqA9wIWNhzboA4utfF52yj7z92I+tYi/wUT4R/O9FwpCG93wymWLloaM
	W7JWUir0MYFqf/EM8ylOO73X4MZohxdLJxqYQ7pSZmNUPov+SGyCshQ+nRUyhaMyK772UcnJbHKKw
	Zr/+VmWDiYsRAM+zHB2X073b9QPD6iBiXyNRNFCw91EDpHFKuHn0QDrueH0D7BQB+sFNcOaNRVZkD
	a7FmzcP0L7Tfgg1+w6E+kxKedlDXYqnKBpxCMiJyP9vuvnAqZ3X/4Cn1xShs/2EJ4bBx/V6E8WXv1
	BUOPmBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkqkO-0000000FUa5-3ltF;
	Thu, 14 Mar 2024 19:28:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkqkL-0000000FUZg-2Ljz
	for ath10k@lists.infradead.org;
	Thu, 14 Mar 2024 19:28:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42ECtWlT021812;
	Thu, 14 Mar 2024 19:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nIji4b2JeI41GT7wexHROmx9KAP8DekVDJtbPMjgATE=; b=Cb
	erFUkZi8WHB6CJn+ypoGMJQhVVZHTnW6g2XRsRNpaRPYlUj2v89ryLSySuwyFQWQ
	56FCxZSWvVcmwXXLb+XlrQIEfqsdEW+NY/14Nt/kYkT1Saeagxs8sQoGhYJNxrzn
	YrO04EveDnnFfFzOmgex7/Rxpd6mWQGw3IqiZx/Y2ehAhb1/EGReR11DwrKkuLh1
	9Fy/Ez3jaryxGTXyYAvf15UZUZDOWOTbUaHpkEhGkLqXrM2B3/2a0f3Wk4ALXo9v
	bqnobWxoEItBlu3pYNBdIfM+PGQrpLBOKgXXXutPXLc03pvMW3PyeptKKTTcXpLp
	W7kbKbZELKxuhY0PdxoA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv1njrvs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 19:28:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EJS2EF030663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 19:28:02 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 12:28:02 -0700
Message-ID: <03b7f82d-531b-4d7f-a13e-a05713939050@quicinc.com>
Date: Thu, 14 Mar 2024 12:28:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>
CC: ath10k <ath10k@lists.infradead.org>,
        wireless
	<linux-wireless@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Jami Kettunen
	<jamipkettunen@gmail.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <c48ead11-0e2a-4066-b324-84f802215c9a@quicinc.com>
 <2f588948-0261-4985-91e8-d5060e673cd9@freebox.fr>
 <15db6593-c474-43a5-ad20-b0e108137713@quicinc.com>
 <cbedb60c-c849-4b7e-a00e-c75ec8429adb@quicinc.com>
 <150c9705-e5ed-4d4a-b935-c0101a27795e@freebox.fr>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <150c9705-e5ed-4d4a-b935-c0101a27795e@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6dzbbwoS5jRQAKWo5LCmEvv8htzXk0m-
X-Proofpoint-GUID: 6dzbbwoS5jRQAKWo5LCmEvv8htzXk0m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxlogscore=850 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403140150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_122809_702408_CE243B2D 
X-CRM114-Status: UNSURE (   8.78  )
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

On 3/14/2024 10:52 AM, Marc Gonzalez wrote:
> Is this the line you're after:
> [   32.367011] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2

perfect

> Is it legal for my company to publish our versions of qcom firmwares on linux-firmware?
> (Perhaps a generic set of FWs would work; but AFAIU, there is some kind
> of signature verification at some point)

I'll let Kalle respond to that since he has more expertise.


