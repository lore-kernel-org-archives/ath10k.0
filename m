Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2BAC982FC
	for <ath10k@archiver.kernel.org>; Tue, 22 Sep 2026 01:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=; b=g/d+IuiBlfLTdqSr+MwUfoLfNg
	8sAQ0VUd21rtNiVcX/CxFEDDVNeGWMjbpUqOCbrwf8PmxmNGIWpcoiAg3YqGpJN/WMyypU44wCFbI
	JFINh5zkiWIOC+XSmVhA/hatBpNXdX5dFk3hrzfEKzFiXcjgPuJr/9NjvN+9lPHTNFv3vnV9gs5gw
	xrV+Hnhb1fUYfge/yUIflphBfRk3+6Cc9pxzgt1/0crWCwhFnAZq4loTwipjm3C5Mb2r8gUcNtH9f
	WCcNkdsnA5zGMiXuqLC0RcGPvl/hM9VuFNy6oQSCrSuHvvZbldaU3ZKCUklIRgTBKNWU8uvFXaqj8
	gAaxRZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pG6-00000003stq-21oQ;
	Tue, 22 Sep 2026 01:25:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pG3-00000003st5-0ZpB
	for ath10k@lists.infradead.org;
	Tue, 22 Sep 2026 01:25:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00JYB2578884
	for <ath10k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v66LYWtKI8kl0sQYCAEnWh
	cI4TUzobxM+G7V+VWy7YA=; b=IfZgR2ujMWGQcEz/UR6Zju4tHgRvaYK9eBrWXF
	oHAMfFV0V5DSpCNoka8lw+n99HXDBDL7Yp56o1ynk92YQ2kUZceFTsXONB9T303v
	pTWsuZ1H515EL+ZYW2M4JF+SmKHGLnMB7h/js0OYKqvF7n1i2yErUEKd866tC9zJ
	3fxgaL5sOWUqIJgZviyNCr6fXLmlnFTxjfHWseIYmflxFdaheziu7SsMbT2MNu0S
	GipnThY+3kT5wxatjNFwKUi/QvgbXuXAyQYvvzrix6TJeUVDVUk/dM97v2QJeMtq
	R0Td3CZXjcLyxR/JXGHO5WUMUCB+lPxMK5v3gLRpcuQ8vxNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub32901d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso3125786a12.1
        for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790040317; x=1790645117; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=RonEnZFP4PFq0ggkiJdTm4lgScUE6Z5DKhuOI8Te+JzGbhY0tUueDXd+IRmq6DCpFp
         J8+XsHYE2ud0T1iPo131NyAwhEMp7bW+r/IeXLJmKEG4/xQOvwHss+3G6iBNNkPSNFpW
         babS5A5j9s4JkRXxnZnafWP3jXep9WrvOj2imvMWzfLFgD32rbKP3m5iYGwvT57508uH
         QdF2R9ZZSfhuxripKp4in4q3Moxx9d6KdmR1Q7Vu158d/kVZPcE2tTnIer/3OuCQNszG
         VnDlLdMHfIrzpMgE5k3Vg0QYKNwKtIGaeg2qMZYef+S3rF9PzhCj1DsZ4pCaSvLCNXB1
         fstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040317; x=1790645117;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=0SMCmZC1TDaDNRjKRXd/eEQhNYzuku+cRvCwFEvl51vuSsyOyyDi4v6w7Jaj4r1ip0
         5HzuwjQnHijAmyIQNKTFlbo0AY9hs9sVgOU+opWqkutwuUjfszeH/Aia1T6ZQS20IfgC
         T2yWZQz+BUT/fZiOIYHi2329ibHEkS/aCA7ACe8c8sMXpvG/LjO8V5c3NbpFOkemB+43
         FgGBOQTik2xmO7tALXsTfOLtwTFM2S/r6NSWDEPkrjBeZWbO1XDiFAsQk9iL1mZEtOr/
         3b01vWR5Kuq8mPk0wFoETdcSvqcrGbMtsQtdQOn7XLQqm8rhpBkprm5w6RejnQMGY3UA
         lzvQ==
X-Gm-Message-State: AFuF++m6G6yMFImOxWQLvyc8cU4X4PWAV6eBNbcXd0C1eFaBlXMeN4kB
	MVb1fMoJj5jvBhhdgBaHq0fGu3lTsknq5cRSVIQaBRgAWOHdd29o+kXPVuMbcYcYD5fQngjLiwW
	Qi70JSudtzEMCHNRbuvvT1yg/NrjO+PkjIAonhW53K+CudOSzO9ewSPioF+QHhlu+
X-Gm-Gg: AYBFou38qU5x5YBnQ9BBdDh6talwspYKijRRu/n2V18ChFSEktiwuJzrt7LKR7pr48I
	6dYJ6ohYcNYq3FrweF/eeGPYVXtCby1wKxW5zm9LbFjK4meAYiAxiFekxWX+SmTU9f78bcFq1k/
	GZaQNKXVx5Cume4erZ4USACXpGPfimKKA82iK9WvVu/QCPpzBicnQCtFQMwmsHezDzXeTSJz7sC
	6LRC23XhWt2j7Bq3/Ri7+QWDFceRBxkeciCHeEPYo2gE/p792Rj/E1agIbujA0d5AU+wkYI5i+9
	35R3vWoNd+U/p9zlfcTVO31I7CQIEPeW8LQiRMvCwsdhz/BS9jOLRmfVdEZbAkSx7N3KSANp6dK
	s/xYdwcPII9jg/Z1RDbeU0dXoUikr7OPt0gA=
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360145637.6.1790040317019;
        Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360124637.6.1790040316540;
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm781214eec.22.2026.09.21.18.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Message-ID: <e142b46e-4cfd-4531-8611-717612e329af@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab1d8fe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=915--R92nBw2hSefkU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: MKpAvMxCW0nA2Fkp5b0JSiaVxPM9Vsl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfX1uJnJeypVfMi
 U1ryj7vfnG5eDjOjdbejiLdLN6XCm6ONlX5OjKAG0wcg49CfkGu0dElZy03QB/f+cmU49qaS0kb
 9sfULynj8/+DVDiHn3rFBTGPEn9zu4E7eHFggufV6LaZeIxpwOPGiLPWKaw3J/aQ97/F9sMzHfq
 ddLFDBZiM79ZaQ+BnOuckJghqHCsac1w/zVd9c6+/0jb2yKTukDlquBpgDC0aeRO4Edgxa/5KMs
 mIB115DRvzswGwE+siwWlaXcim3pvakjXcWJDoft8KaaRjctTaBdg9hDnFERlzwYJw4jYY4pIaN
 kplsWxQRYuggTKd2mKxdGLpUI84A9dO11f42adg4VWlkLh4Pc2om+sdGTf6OIL/c8GwwNW9UWHP
 7+8SdoiMLdhNlyWMdGXNAXb7fO/doIRpZkkwAUJk9vEaYGCbd7q9R5JtQP4HwQ4dAyq/1jeBycO
 Eum1oT41E5KcddBHfwA==
X-Proofpoint-GUID: MKpAvMxCW0nA2Fkp5b0JSiaVxPM9Vsl6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfXzRRcNHv1XRmm
 yeeoV1gfMaEFHcsiYVd2hWchqSGZ54t7QKBcw8ha46nIqQarhWd2hpl0A/l3QsrsBWKL//lEUvq
 c7Raa966D1HxPocyFGJqwI4VhNrd2vw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_182519_339624_5A9103E9 
X-CRM114-Status: UNSURE (   8.10  )
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

The following changes since commit fefaac1176bf3cf002a8dc83339d6ed6a369941a:

  Merge tag 'wireless-2026-09-16' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless (2026-09-16 15:54:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260921

for you to fetch changes up to aeaca27c1db3106967ffbb2b517d98c835f6d500:

  wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE (2026-09-21 10:58:00 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc5

In ath9k, harden the firmware interface and correctly handle a flood of
large frames.

In ath11k, fix an accounting error that eventually prevents clients from
connecting.

----------------------------------------------------------------
Georgios Karantzas (1):
      wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE

Nicolas Escande (1):
      wifi: ath11k: reset ar->num_stations on hardware start

Pengpeng Hou (1):
      wifi: ath9k: reject short WMI command responses

Toke Høiland-Jørgensen (1):
      wifi: ath9k: Clean up device initialisation guards

 drivers/net/wireless/ath/ath11k/mac.c         |  1 +
 drivers/net/wireless/ath/ath9k/hif_usb.c      | 19 +++++++++---------
 drivers/net/wireless/ath/ath9k/htc.h          |  1 -
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |  7 +++----
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |  8 ++------
 drivers/net/wireless/ath/ath9k/wmi.c          | 28 +++++++++++++++++++--------
 drivers/net/wireless/ath/ath9k/wmi.h          |  1 +
 7 files changed, 36 insertions(+), 29 deletions(-)

