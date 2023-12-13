Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B72CC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kN410wwRUNkyfPB7ahiFKEuZhRz6mV89Ym+9lK+dfNQ=; b=iUijIbS7ggzM/b
	5lGTsJ4pZMAj9HIg1yXT9abedVSdmPE2Aw5z++Z5oTXzuK6C8oFE0PQrIVzjAR08/hkghVvw4pomU
	K6UgGyKDIsQhl8rxVlXohwerGKjvo8gg7fZTPjUWjy3tGR+0eSbCNvYn7e38VdgR5pRxm/d0N7Mzz
	IU6hVrtEteiLFoH/nf+U6OMbhncKy9DQ24QDJbZ0rzFEeqSCUwhb2viLQe9o/dhVcKIurC2CCNnBV
	uKBzoXh2/1oxWPfjxDM4WGoQC+CQakqV9A9OHv94TNlLU2QuQs8QyR/B/bcapTHFVbLIadxlvtOT1
	z1HN3jftf+WGTnXWbmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShk-00FXPj-22;
	Wed, 13 Dec 2023 17:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShh-00FXO8-11
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 17:07:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDGd2JP030010;
	Wed, 13 Dec 2023 17:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=kN410wwRUNkyfP
	B7ahiFKEuZhRz6mV89Ym+9lK+dfNQ=; b=U2BFaeSVEh4jQX0pbjz/c1bRKiSRNR
	cKg83IDMph3fuNpeMFtBzfsFkTiyymvHnb2icXcM3NRTWpzlvzFQwC7sgSgu1Ly+
	IlXwOkYcbt9z5mxAHUwdnQSNr6lVPOblEUEyv49zq+J7mg77O1q7k0W3oocGmr7F
	U/e9S+7cE0J8bRv/7fFho/CyVzWJZ2yDH2/BZ9nVNx5me2WGwBv6M0Wy5Jjp2Z7E
	sKK5RKfJOx8hAWspFtP/q/lVYYi1613ArYmwlwagycg9GKIO7z47ezRKDzDGEPcr
	u4GCmcHhuskGb0kF0JHpUsGJjCAVixXLSHHA87qQp+ShVUwoA09ca65g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tvhpv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDH6eVM031494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:40 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:06:40 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/6] wifi: ath10k: use flexible arrays
Date: Wed, 13 Dec 2023 09:06:38 -0800
Message-ID: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/keWUC/5XNyw6CMBCF4VchXVvjDDd15XsYQ2qZ2okC2kKFE
 N5dYOdOl/9ZfGcUnhyTF8doFI4Ce27qOWATCW1VfSPJ5dwCdxgDAsp3xYVtfFtUVBXadvXdF+Z
 BvXJODTLfY5YQJFkeg5iNpyPD/eqfL3Nb9m3jhvUuwLL+KgeQIFON6aFUKWUGTq+ONdd6q5tKL
 HbAvzyUO2nwmua6NACgvr1pmj4ibXffHAEAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva"
	<gustavo@embeddedor.com>,
        <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lRec6QprZZ2S4zgOuvxWwXKHU4hYWDQ3
X-Proofpoint-GUID: lRec6QprZZ2S4zgOuvxWwXKHU4hYWDQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=600 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090725_364603_543268B2 
X-CRM114-Status: UNSURE (   7.11  )
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

Clean up the last remaining zero-length and one-element arrays in
ath10k to comply with:
https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays

With these cleanups done the ath10k-check script no longer reports any
issues.

---
Jeff Johnson (6):
      wifi: ath10k: use flexible array in struct wmi_host_mem_chunks
      wifi: ath10k: use flexible arrays for WMI start scan TLVs
      wifi: ath10k: remove struct wmi_pdev_chanlist_update_event
      wifi: ath10k: remove unused template structs
      wifi: ath10k: use flexible array in struct wmi_tdls_peer_capabilities
      wifi: ath10k: remove duplicate memset() in 10.4 TDLS peer update

 drivers/net/wireless/ath/ath10k/wmi.c | 10 +++----
 drivers/net/wireless/ath/ath10k/wmi.h | 55 +++++++++--------------------------
 2 files changed, 17 insertions(+), 48 deletions(-)
---
base-commit: 7133b072dfbfac8763ffb017642c9c894894c50d
change-id: 20231212-wmi_host_mem_chunks_flexarray-78264e146731


