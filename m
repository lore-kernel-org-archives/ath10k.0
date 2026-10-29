Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E31606A31E
	for <ath10k@archiver.kernel.org>; Thu, 29 Oct 2026 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/dUDf/0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9byPvLY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CniSmgb/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=; b=W/dUDf/0/IwU0o
	uc/y6gv2L57iU9yLygGOiHt85K9ug4p0KYKBHE2dz1rJWIsovyY44u/33sIuY5TMzsyuCBXuH3Z7a
	tGyJmbXO187x0q4dmQql7pWVRE7LVDCL3OWT3hEJvUU1dcmzkimgWhQSWMT+vTCSDbCshxwFcBB7I
	4luPye+b6z1JrYEr0DD9MP/On5oK6KjmeejUX3w/tIzKDwU2LRwBAaXMfefjowvDx04PGm/U3Cy4L
	wEyQGW5QQ4n6Z1NsTCTzmRrlTW5QK+P6BfanvGZiITKE5lavr+ITS2RQYg0ZAFGQbIZ1TvIUH4lgq
	q+A+AKVmJnWUyDE25sCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2a-0000000AVk7-3TDt;
	Thu, 29 Oct 2026 22:56:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2W-0000000AVjF-27AY
	for ath10k@lists.infradead.org;
	Thu, 29 Oct 2026 22:56:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLZjD31363793
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=; b=m9byPvLY6pqVhV5O
	e+4RT/RyiYe77pl9POU4xpdMonnIkfOYMfY6+LdynlLzlAqvaGyWa568g6JqUr25
	6tmmlhou0i5FpkHTH2K4zTsOyeJ96DUjhBmEng3wkZ8XxG2IMzfTWjQ5fhMDWkHB
	qz/ILmBfnTYSNeRcniesWN4VB4SKO+ob85cBCO4vAqS0J0lWxZFblyMxHssoGEIs
	e+5+tfbDY3IFtjo1rv9DQ3bKe9MCfxHrtD/Do9Th+lRhxaFFMvY+T/L5B6ZFUQAD
	Pevv0W8tst8rPCGKzs2gBzur2PyfALeKeCTfYKttSzyqVwer8UIyKNK6xoddV2CN
	rFur0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qg7vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so703856eec.0
        for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793314566; x=1793919366; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=;
        b=CniSmgb/MZ+KEI9IJajXHQ8RJnyYdGNqVjdMGuAj5jUyabiiCOcr20GzKBxr3sv+mQ
         GGDxGHF3+afnWnQNnxS6JZ5EIaftcoiH1YkLaUSuR3hNBQ8vCZuVREOiueonO77ISMuo
         ROZvGEbuZHz7eUlf0WZzXWMetYjY55Y4Zf7n/jL1KSTY+W4DB1sIWsNkzGqMsCdDKpaT
         oXgnMbQjraXBf1Wp89IekL0S7z52kxx9jwEgX9oglP27p3of3IETxzhfcna4zjRO4tN8
         Vr1PManNhhfAo5nEU26kyXATXsXGwhu48BWWibn2bUQUxg0nPan8eAV6L8UxdZWPg/YM
         nRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314566; x=1793919366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=;
        b=J4fsCrXmAnJPtGnuSeOB7/KDyyVOzLTrJirHQMcvDM3eE6hlc77hFoBiFklx99xeN1
         AERHNuZnkI8wsi9FF8Ct5wLK6T4PtNFkeNDZNpOvkVzCHmcO040XPezYT+ZAd26yOnwy
         jYeRlCdCN8vY4nMt6XZYihkWz3G3glmNiPkz4Zx+RECQPL6E2lr2k1rqe3jcy2xrTPZO
         aLr+K1RtInlAhcDjQz6mBwTE946RFc+CKbl0fJhgMsPtHycj06n82mMFPoXOs43RwRRS
         vTJn0Y77eoo5ABNc2+SFT91P1OB41GCcfw+GKW2wWQRahCZPS9Pddb93bdu6oijASUhQ
         xeXw==
X-Forwarded-Encrypted: i=1; AKwUvBwTRxt5SkSf636qxkuGDaLE++XtHMg4vz7bv/DdMZkO6bZPhPkuCEnvQvswTwdFFYEsgQy0GTc=@lists.infradead.org
X-Gm-Message-State: AFq9FYLD6bnPV45fdZ5uxbnquL3zc+6I4ODeLFhtb5JhuLAVbwLelMJO
	3CGZdhHq2hVj7EZ3Vk3an0VIcXYqhGPSymatU7lVfcx0aO8VX7HiSpn6Vx0xzx5IeWilOQIi4Dp
	Bc3KCE0hFrIpJx3xhEaQfHVbazvFGI+jEQ1jAwwypPyF+RUawyUK0pi2rUXlWqBwi
X-Gm-Gg: AYBFou348CJyD7A4oOl8zD0xVupNXD2CXzgsn8+eOSzYRXO/R67SKeVPUjJ8Nnkqq/s
	GBrejG0za1nKuOmbywL4HCWD3/pyOnT188RBrrxic2YBZ7/uvLBz5kOz0wwh1t74yc30CRp11GH
	0AGYyDtDrtwK/18e7RutqKAZXjQOHbyeu9t6ZKOQpFvA9jm7ECtMebq7/g5BBkwT6B5oqcgIwyy
	t0xHYXJxSEgCme5kfjzV+njJqdP9KePc6kjQo54Fa2lsG94MUbjFA/svvu9sVtLHdD1WvD+klGr
	OGTUq/RnHUzhhxf2dABIuYXKE0LZLQZw39PBa50NxkRjmh4kzmDh+ZXjZNu/J0EVkZkr0OpLXFI
	K9FY24DdxBIKu9k8YN1JtdgQDqM/qGiOWih88Yx3/XCtj5qPv+jDCEIA8+4KxA0tA3CrXYt/nN2
	0VacQeRhRO0D2D7/KGrumq/BWOgQI1
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr1139181eec.18.1793314566123;
        Thu, 29 Oct 2026 15:56:06 -0700 (PDT)
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr1139154eec.18.1793314565493;
        Thu, 29 Oct 2026 15:56:05 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm1644278eec.8.2026.10.29.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:56:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
Message-Id: <179331456469.1083805.7983060076518551936.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:56:04 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: kDZPlQ-S3g_mQSOz3UM48UuIv2z1IJym
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX9WlTAMzofVae
 +Jzsp9wEqjPVJ5NYT02e3Rpsk/D87zRT98i9MRoHMZKGHD7JEB3Dsro5WoaqSsU2SlFRu+n83mj
 U+LpRJPhkKuxBAzrUo56H6EfM4pMhC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfXzcKtaXSXWY0C
 1ScmNvKEX+GawPF+9grVSnoWtFHIO7FtCl30PLweTGPFV+VjbSnYJhQlCXpYsmsjruAuo105KQE
 ze34Mz3gk37fZn4pnfCjog2kSXH/BNJM8oyGqPrbUc/QvpYTT+jUx1LtmFgO8YdyB+IzfD21Mnx
 umkB2UydAL8yXUgVhfY5gOJjvFA2Hv3IYeonNvW72fkX2RatXuxsFprKzuoxfLyJsnZpc66H+lJ
 dTMJ8XKaW1E5fMSrNCKcPaUU0J6q0nIJF+oxFE+utERwDAPPj0hMshmsQEQhXxUSSkK2MZoYyn+
 qEnnQRe7a9hvpP69iRcF+0Dj9aOmPPxG4C/2Ih6eubqY1C9XMhGAmBro/MNlQ7MyFJX10Dl/BlM
 V3P+ktfkdRZDTkUQeS9+byAPN3angZ+MOHEEKq2uMMDvI+y3dAIyxjs/AM389sJ08k6GtdAX+fu
 Hqd8e32voR9U42XqwUg==
X-Proofpoint-ORIG-GUID: kDZPlQ-S3g_mQSOz3UM48UuIv2z1IJym
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae3cf07 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DdSAyOQbr8Fa4xelbuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_155608_978045_3B9C4BA1 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 27 Oct 2026 01:56:20 +0000, Filippo Falezza wrote:
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Stop unanswered temperature reads
      commit: 2a87e367c62856b87a90f745c6b7d2eb91e0c51f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


