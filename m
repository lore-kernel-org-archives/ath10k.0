Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4E3CA600D
	for <ath10k@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=; b=tF0+RtixEy231rh26qK2dB7cEJ
	+yZsOENvC4WvtraE9rG0F/Np5NCd6VSJHF3omYWPfToG8mS5BhEgbOfn9+SNZgHJRQhGajR7fNNaC
	xC5FRR//G+Hml3x+o7h0om7Jryfa6Gcu/aW9zm9nqtfScgUfXr/S9sQfzYbfaop1OiDQSk2/AlNuK
	XZF+bg1MSECGgNeTLZCdzfbgmtLh1bmngpfZLR8EzP9+fzkqkPBGtYTxUrwa7eAO0s7aa+YZisHZo
	K4WLOKSFlJQOLWK2rLSl2y4kWdXvC3e7Szj5lbSUgjdgpnIQpjrGyKMBwv5KjvEXckMtdLLSSgB5o
	qs8OLDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGU-00000004yvV-1KO7;
	Thu, 08 Oct 2026 19:58:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGR-00000004yuU-3dbs
	for ath10k@lists.infradead.org;
	Thu, 08 Oct 2026 19:58:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HpHUt3559938
	for <ath10k@lists.infradead.org>; Thu, 8 Oct 2026 19:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ebm5pPz/0g/tl4YeJ3Jr8z
	4GlCJlRVCE4c+RayxNGYo=; b=TSh9G+OsXhfm89ob9xVjQRWC/oY/KUteaDdiiL
	nPGfiBycxAbaJSuvQ7GyZ4IeiO1mqqgjlukzObzRDj2EXmEaEXHmfl1kaQO0shHs
	qb+yI/j1GsJxLe0zBc0exsG9Dg0hVgYfkwduqOMHT0cWFYqECMYIWBHytMd85R9B
	6/P2b0xlkjPw54p2Kx6hgRSIywmsPIFaocA4wFlBjzvdIHRLoaebYyHLJQIwSrc2
	lP8HDjYHxLKZQJyoMgoAwH+6AD9svbgk8H8ziHwldNsXXR2x64aHuqCgVyjzcOCn
	E/afPiJPcrVFlxHRhjk+JDNx8IjwcCFzohn2ZjxC83PJH1fQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk8drt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 08 Oct 2026 19:58:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef5fd7934so15120863eec.0
        for <ath10k@lists.infradead.org>; Thu, 08 Oct 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791489530; x=1792094330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=RftPXkNeoF2Y71XbnyitqBq2GCvzSAQV9hLL9/DnbH5Is6CGEdqcBcQ1X62iw9L6hF
         90+1WECixevNuwOYlvvMuVHH8l89r54olcSbb/xLW2DxunjUnU4erWBa74APYCrGprSY
         6ZGQL8a6RPnodH+WpykNtQB7ZFsWYUP9WgHnBDv5YiPuduDMcXRXgaDdNJtGnBew20x0
         twGgRVz4kL4KFZtZXYw8kqSPAgTJx8nBENgScoAvxWQ4i37uFNt5+be8tzjEBqkEeucy
         FV3SrzKK+66JRqJ8JaquOsR4zm3Lt54QaKwGM6wNP/X1y7nXU4uKPKtcTiGdopIkMaH2
         3zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489530; x=1792094330;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=Pibov6Gp1oB0kT/Hr+WTbw6xTuSp9Y+4eRD3iL4pYwSontizSwYxEQ9E6KLMuiDyS8
         T/gWUmlJbmO5BhhnxJkTUOiVe4elYBcDYqhZF5LyYD88qacfwJ+2gihHqHUa5h9sfJy9
         r7K6VstCmEhH9pWgsVyFzClB/4xOSS6qzXrzQGMf7JJ0B3CETzQFbQ4uFtYaRo4zDQqc
         m7/J3wRysTg3NK50t52b4DVNfCJW2rlm0P1KL2FDtcjsZcRhmbo9AkZJXLSsk22NOiEu
         l4UDhXmLdg4AHft520OVm2p6mkESMDMayyaX3ctHgxh9PMXAG04HWrULRHK5feJOA3nA
         fyWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx9pwxilDW3nZDkWLxHkaG3Tkwnn3x/s1NlbsTTAoUCHYAdDlXfaLmtJgq1iCGWRIvQLbJbDs=@lists.infradead.org
X-Gm-Message-State: AFq9FYLkwqA/F37Ls/VFPwGo2qfdlzVESdKBfQ3MV/HWcXXfyDKnd4n+
	fSzu/Pl70ktdn+unoksXKSIeomygUPuVaKXhoPfOFpqtInkYoPpUW4tBuWKGGal5DmLe8LQs/6v
	q6Eh9eDVamD5h2LfvLl1LCnGFvukXwK5WeJqmuhTcZvqgTX1Gh959hharKKPU7YnN
X-Gm-Gg: AYBFou2rWh83kBEJT+06FE0WfFMYzjaH+5CVAWEmOk1srzgGYbMt2pnYrQsFTe/72iN
	tzh/Cm6UFctvw8eYK1IQS/xkhGC0ZnGzO7Tr+YW2ouHJR1U9jOapZYytdqnlm1E7T56+2LF+7EJ
	9jXp7ZyaBsZC08rgElACJExRdYX4B4kA+oNdqn7R9+G4+5Hv8BuCGXMTZ5Z62vXrXt6ufQBNTV4
	9+fGlwqbYvnkoN55hgMGnb5Q+k/+7DOQ3FlFNb1EXMmrPxOM2kURd3GZZsalLkOVXdwR3Tm18g5
	ImQzHyLbRINykYzejBMEjR+aC4OKDNAQ1tJy6NwtaDcXNMyQF/NRmeI9QUt8UZxOOIwQz5rjtcg
	VD9mbMMsWc2vX1n9HQhrOW7rYGP6p9HWbq4I=
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053378eec.37.1791489529808;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053339eec.37.1791489529022;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm231759eec.31.2026.10.08.12.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:58:47 -0700 (PDT)
Message-ID: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:58:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261008
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yMW8M9UGvCGVzP6mvVuQa1_MKsBszrYQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfX8ruPIq/0gd+H
 uifb82SaI8LQJ5HkzuiY3GoGQYd2k7bmjdtlfvRZEos03UwH24PXfWIxO+WhcUgK2RBfY11O68R
 ak5GaktKdDXwrNvBpc4sNrUP72NTWF0=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac7f5fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=WKo8ZlZ-uQDsbn5PVaAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfX2MQOM8BmHBA9
 DFUDmXR51Ykhyzy0GNu4M9y8DMA6brPfR1czYz9yRLqAJy9OIL4iGH87jROfbJIgF18h32OcCYc
 ozK3rp8SJNIip7mRFbl+X35jrBH4xMPX63FKBowjwHm3mhXh+xLBWyJjSl3VRUcmiTr6GIKCanP
 F9kiq3QnEs2gSsB7wwoDYYnNlZN6LSYX1E/ueUdVXg+Io0rdpNU85TWv+Z7LBG3nl8gnwNEQKf+
 RyM6uaEDnPY38Ju94kmr/RK185nImAkTb4weIxVNvfJWEeTObo4bw0ZfF9rP9h91gTJr8rSiMxN
 jPYkj5Sfn/z+M4D88865JBoVdv6rozIQAsDGp/Sa92d/9JOBOJwRHizj7WzDnu+59JS0XPxfzBC
 PBSdiunN9XQOas413VeiHZN92+vhiiQRcEH9UTL3ARjS3sr95GVbLZ4D5B46yAHmN6uas6r59fu
 gFEMZpydJmuwSfIwuLw==
X-Proofpoint-ORIG-GUID: yMW8M9UGvCGVzP6mvVuQa1_MKsBszrYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_125852_020768_29C4C653 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there is one board update:
WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

  Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261008

for you to fetch changes up to 575bbe3f83565d18caa73e9b9458f754dd286f48:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-10-08 12:37:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2431852 -> 2431968 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

