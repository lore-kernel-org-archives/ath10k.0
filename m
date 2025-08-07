Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC0C87FCA
	for <ath10k@archiver.kernel.org>; Thu,  7 Aug 2025 21:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=; b=1GotsE3xjkhqDamtZ2sbap/nsd
	go8YY9roAX07LU6GVuyZxl4V0CHbpjlnB+mOsrc0NIpkAuLK5/ulFErL5Wl8hJsifniOgu+vTu/iw
	w8F3xU2UwZ/gTz6G9wvsvhy4AegZDFbPlxdLEJj7SCbTVXLXZxcNWfgUQZ5wGYoPRkICmxnCjzbGi
	DIt1l9TaQ2WIU87QjwPsI4cDeJiCGu5qaIAYdkDJtCDPbNYHcd+3PMiH7fIKYHm6yg6pquwif8wQM
	Ioz1P4j/+p7LIICNBcg818ZUSUga6Zmk2cowDfBhE1CSqdyQ3Hnm6HTwJZrDz7uS52HOVnhDvjM0m
	PSlqL/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Ou-00000001Zs4-2bRu;
	Thu, 07 Aug 2025 21:43:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Os-00000001Zqv-1V1q
	for ath10k@lists.infradead.org;
	Thu, 07 Aug 2025 21:43:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577ILsA7018565
	for <ath10k@lists.infradead.org>; Thu, 7 Aug 2025 21:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0YZ3YLLvJK2KdMo7JoUSc
	JunUE/MEJzmwquZliu5aQ=; b=AqxKqiotMaKj+4zPmQwOMwJzOt7NovA+3yERsn
	2jguwNczw02rJtEEJde29DyHMD0mAuCqxP+u1ExQzuw5QRHKwAoceNOTKTDIt+UR
	uR3vooaoJwNdCknLTzfdz9xYKvAo5A6Q7i/b0YSldKWxcZy7G90yxCv9AvfXCmaf
	pV5F0gquaG7oBzieAjEVCCx3oVwoHxlTQZEybgegEbnEI5//nwKedhV/HRoSji+2
	qMzei8F3g0VPqkLRNNTlt+nqpQgLPQ/+GZrOgwg/MQo1037oQdyiyodmQhfEtIoM
	ReYSeJyPcaPY7fwFmS1y6ag2RsWqie+3c+E2rBAbd8OQEsuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586ddvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 Aug 2025 21:43:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ffd934201so11146315ad.3
        for <ath10k@lists.infradead.org>; Thu, 07 Aug 2025 14:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754603027; x=1755207827;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=;
        b=ULMnrH4ifePGJbiJ7YVoMi9DkFKZRgN5+LJlQl2jSlRjtWd01f4AvdxFkekoNHb6SG
         ixGjyetIDoqvRaZV+K1g6U36dlMWbtwNy0xBvijnDZY5/nwoJ8t/wluomdH+b/K21BeH
         HThKzfWwMRYmsdoCkosdzl5gfrxPVqrcj5fS/q0FDuB9FJ0rocOLIve4Rh1cTgT5k9+p
         jooSG94wwmcfyfnGLLEtwf8drGpQBq6FdHXlQ1ddI+LfOy1k/4RvjH+MnbDNyb1sTxKM
         dwDMYNvqF3VGZ/pVXKrCPdsQeXbcC09zFNyubkwaM9SCHk3DZ1CyHcxt4iMFOih8dbdY
         O34g==
X-Forwarded-Encrypted: i=1; AJvYcCVVuhsoxomOMED7akLUHRVARowDtfBjCjQjg2z1pbbHeVP+YIvKkuSgNrDgNeJUPtyFPr2nDB8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7HjG2BJj2fblQvmq/bAhrEjdFk1rpmyytVbo29iaPSvHyCQEO
	NViLujwLewgxQWdcG4tweToq01sUvRF7aJ+WSWfW4Tkwx7K6g/Zkja/6NBXYF4xREZt0LKlnJ/D
	mHFu2jQXCKAFd+2Jd3os6Nes9NZJ8PtI1kWJPevnJNe2DiPNlIY4aMlsxa6eU717l
X-Gm-Gg: ASbGnct894I52xgx2QQOHnzy5q5wzRbRusOtFOWgGL+ULAySeRJHGCyjfniGkCSPeJW
	KLc8wIP4k3pvqvEpwy29XCb1FOXS78sJcyBVN2Lz4KKRIXYkOXM2p6Tg661F4AWUE0dMzT2/lOA
	m3RZ8hROg/A6xn33XNkqfNMjoflC4xSbJsYzPlwUkbRgkrwLd0vA1fY45KLaUwqmf3XWu2Dalpe
	PMlFie+Su9amYJvXXXuin49ZhKIClLR1PbgNGs9UGYSjpVxnpgrLfKmsnfschOtvL6Pdcr9rs53
	CD8J2GxfHvG0g3ZBEWL9Uz4chHHquSslVX4xVMGfp1BPUne9DVujWcaC4ajcO+N+LiL+sr1Vpp4
	u
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131675ad.15.1754603026836;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6v2dbx8Buiz9mLDddezvlVyeMzN2wDlRLGfDM+oXmOvFCIoQRzS8Xs7yecMOzsLJVhDisg==
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131495ad.15.1754603026374;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm195015435ad.116.2025.08.07.14.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 14:43:45 -0700 (PDT)
Message-ID: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:43:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W9_EJ4xjIniWwcIx2aic45LtHY7EW_A5
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68951e14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=8Juthw4_Jig8fID-B6sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: W9_EJ4xjIniWwcIx2aic45LtHY7EW_A5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX5J+L+rWxfDuS
 O9jWaA+e0g2vhOQDKyXSp4Czcrp/DlLKT1X4Qo726U64xn0ySHpcBnwSoOMBqVaIJG2U8o7Ng0Q
 GSCVle0aA9LTxKpO4xM6RHgMsPJMvjzhCiJuGt6cSzWpRLSPcY3A26DiTwMUy8YorVr5hfAeVBJ
 kbxJ8vXareHMShDZ/LeQeQXU/UY+O80ektXvHcIcDyaM78o5vN+WZRYOABEv1SB7d1VzaBMeARm
 SDvzqMbT66L+ALm8Fgy7At+r9IDX5uqs9D3DTAphfUAiA1inwiDX/I2UxUF0cwFqJGrOu9ZdR6D
 M6WamR10BUrOk+bT1IiL8Q04QysehII6wLRJLrdWq1JENd2g1ElHebmKWQBuQg0MEEdDKuxS+tL
 vsx64LWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_144350_506402_4D34F72C 
X-CRM114-Status: UNSURE (   8.54  )
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

The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a774:

  Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250807

for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)

----------------------------------------------------------------
Jeff Johnson (6):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1_V2_SILICONZ_IOE-2
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

 WHENCE                              |   8 ++++----
 ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
 ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
 7 files changed, 4 insertions(+), 4 deletions(-)

