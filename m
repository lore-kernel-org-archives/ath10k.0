Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB27606A31F
	for <ath10k@archiver.kernel.org>; Wed, 28 Oct 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y8frmAJ8;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gwfbpkwj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R39TCD+Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jzOyS3p29gFBVVw3tYEEiHDMN8EVI+FbA51qYMqNe6c=; b=y8frmAJ8pKm3IkotFhaSnz/m2s
	H3CQ47Lmi6oqcedSGnkZUsjZi4nf3TASXDsTba5XK5N/2ZfJ9WJDaTw5ARO7K4tacr/hjZqfEODBk
	7jUxYvVH+PoRdT6joHMqmA8R62pGsCjNlNYmqms9AM+GvsyHHIv5p6Eqqt95XoxwsIoBV3yzH6cLT
	zGiNs5sy6dcPGYtVqdZ2r03SkudulSRSckr6E1jmVA94KMECC2cWcZdT38YSPIx8+qVQ5AmDfh3FS
	k8HiHL0xdZywzQpIwgbkpQeiBPZbvXh0oNCZbnZCcg+A55DglInxK053asio7Hy4jrPcgrTIeRvyB
	sk5SIDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Qm-00000007KKE-3Si7;
	Wed, 28 Oct 2026 15:19:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Qj-00000007KIN-3r6Y
	for ath10k@lists.infradead.org;
	Wed, 28 Oct 2026 15:19:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA1TL966381
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 15:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jzOyS3p29gFBVVw3tYEEiH
	DMN8EVI+FbA51qYMqNe6c=; b=GwfbpkwjMGjIdDoBcqf6bXS4EUvXJPTURY1x0c
	Hr30wpTsqNxfRhY4rhmcw5NHbbK6PZlbbYidZpFIWumQGaSdHAloJfF7ytzK/8/b
	xonkzimdCCY3c8vLVVR6b1vr9ua+JC9Ltlreko1p9TFTlDLunR+/UIbOMPQcFeRn
	lIfy8JxHNaC/pXmHih2nrc4TMeOHzQhTh7il89EMczWr9RcCzAyyL90M34tcawYr
	EV82ltj/Jv/EtAe0Yz1rV7wwqBRYpzW1KlZ5EtPltACb4slH23jbeec02u8ZYLb/
	Wb0eEnH5+8wXs4Z6FJGxT/4wai5tdmDEeVP3bKjnemZiRzIg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjghhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 15:19:09 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-675706e468dso1819078d50.3
        for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200748; x=1793805548; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jzOyS3p29gFBVVw3tYEEiHDMN8EVI+FbA51qYMqNe6c=;
        b=R39TCD+ZhpBPGtN4KDv6mt33LkAN1DIFZRtbuULP5S8/rn5UKaZgTXjsI9Njt1nPiw
         jLRc7EDq8728V+OwZL6B0QW9NSohXHJSKZsb9trNcUUHQJek20vWHA0yrJSGe7DzhaeJ
         Q/zXevF/+vRADvHJ5EYKHb5wG+omzufzyZv3a9V/eT8+eaetzNzYRsmDOb4a7f8VrzNh
         n4L+LOBCYyU+P4zA3ue648GLox2ywkZ640z9xkObHPKPtJfT1vYdZagASlGFl8v1Eh7m
         Z3rfrcgMgO1CWFNfM93uZ1eemDpTA9RKeDp/9WpwjIYa63e/bTUj0Ur/Mbe4lqSFm4IZ
         RavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200748; x=1793805548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jzOyS3p29gFBVVw3tYEEiHDMN8EVI+FbA51qYMqNe6c=;
        b=nnyo/UXD8useu1QMwYOu7jMixd4Et6/YUHe8QMQ6YQl75pXaEDnvSmw2Kq3r6LzvzI
         uwWJBUpPdqZ643oVRemiAKR3v9ChD2FGtwv70SwXZzqdZkNFjq6vi8fEijP5+HNQbnP0
         A7ujTpUetAVipg0hTiL3bUge+zi7W2t7jjg8zU8XDdMAThkMLWW6m/Id80C563EjRIDb
         mPh0bjmyF5P+auPKbSpUpAzh+ur6iDujACBdBkCz4Eh02mP6op4g7FAfFbnVSom2XRY9
         KfszTGOyX0SEcoUJozlFjpBdSejmO26AnOxZ34b6a6bhBXYtxSoCZ3dv5NuZGNtuSmmW
         FdqA==
X-Gm-Message-State: AFq9FYJ4HgIxkqgOnhj6LGhpOuQ3FoBT8wHMlSZbwOOM4xjtyyqcysq3
	gG83YkOLmSI66cPuMjaukQ/rBmYhLamA5gtGe+Mx7jZYQRe0Ki5HNEigZTYpg0y1QTFFeePbbRR
	gDVRaXsn/ENc3Hgs4zKsI68NYjKYfj+Z4lZftn2dwWmFYMAEiS6a8ZDBhPN9S4MbX
X-Gm-Gg: AYBFou05UO95LIQdLppTirkeEimkKvvFwkxGxRvTuCXQ2E+PR1Ns4yL/3q3dITP/616
	yhLFeUanFo4lTE7wSa9PLD0Ytr//fjQSuzF1zHQLOqP6izZXUVUWLXa16DncGwu9nIpfyKeYM9r
	jKfeoWFo8KbYAm+eeHI+KomBtRkgcrpZ6eHogY/npnUeMl5KiRcDMw1rFueltN6ACapKoNCrmwJ
	C8By2U89mJcUqnQGmuwPZAW6W+kVa0Q6Kpv5hY5RcQTfGSM9zBQ2oGpubbkuC79/9VnnUVaBL++
	WOri/UvXZGghfHXLFMhC56xZoTExEukPFoS5EP9K25tBz5R1YuyOhsozNlRr0d6e0U8MZBc5687
	cjqSNh/lQ30cOVK4xb2yYt4386AItGouMIOZAFIR2E0UjCqVcK+ZlR+/5Kcxbz9g4SX0e2fTyFG
	U7Ol9ycYBhBFC/8Id1HxsPUIWV3X4=
X-Received: by 2002:a53:d58e:0:b0:679:ab13:5517 with SMTP id 956f58d0204a3-67a7bcec2a6mr1229172d50.104.1793200748336;
        Wed, 28 Oct 2026 08:19:08 -0700 (PDT)
X-Received: by 2002:a53:d58e:0:b0:679:ab13:5517 with SMTP id 956f58d0204a3-67a7bcec2a6mr1229158d50.104.1793200747701;
        Wed, 28 Oct 2026 08:19:07 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79d7cd76sm1966851d50.0.2026.10.28.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:19:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:19:04 -0700
Subject: [PATCH ath-next] wifi: ath10k: Add Loic Poulain as maintainer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-ath10k-maint-v1-1-1e6ee9fb2616@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGcS4moC/22NQQ6CMBREr2L+2pKWIjWuvIdhUduPfJVW20Iwh
 LtbcOtmksm8mZkhYiCMcNrNEHCkSN5lI/Y7MJ12N2Rks4eSl7XgpWI6dYI/WK/JJYYHWUlVHdE
 oC7nyCtjStM1dIJPM4ZSg+SVxuN7RpHVtZTuKyYfP9jyKrfH/ZBRMMFVjqyyvpBT27GMs3oN+G
 t/3RRZolmX5AvRS12bLAAAA
X-Change-ID: 20261027-ath10k-maint-e5343748ec7d
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX4cw7Pa6lwBCD
 paJIpXK5j1GUKQQRe9be8JbSWpV4gFRFqNruKfrNSUFQpRIWDQV3ncdw0mBOXfOSQhayHtTBu6k
 6T9ByxL5G/O5LMrF5o4PHqYgoHJUvpeTzv778i8JP3z1HfQqMJZIOgqdmVu52Odrnrg6WBskvw+
 MnAq5ZKPIBl/TfqOlMHB8kOUdf6+exwcSywNXgk3Os3kRL4+awMY4FB/0TVt/CV9FMLrzv/a+Rl
 tc2WvLa2nMGz8rs89LgHyG8i4tBW689WIMdpCbVToxwcujZFrAATlD6FArMjq77esN+v5CrMJa7
 V1v9cAK+V/DKSWFBSOuRkjF1wADKgwGu2W8jikn+0sdvwBTf6OlqAFl8URibgMQzA7CJULVjGuZ
 P6YZ+HZhW7/GjqCTEL7MaY+owlpyKIVsixiqMwJ8ImUmBvhaF6+vATtUJlAuZuq8swbc1qdgCiw
 zTacvdlKRfmhopXjtxQ==
X-Proofpoint-GUID: ZfhidyuzcEjrg0sSIqVpJlVjy1sUhJqU
X-Proofpoint-ORIG-GUID: ZfhidyuzcEjrg0sSIqVpJlVjy1sUhJqU
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2126d cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=ni65MP5vFf2Be6WRXWMA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX8qDp3uiahW6a
 DjIM0wa9iGyCDwdnr2PpPjt54J2gBgXtqBXG355846RzcQiQSRnkMM6kcz2VT2CKiAMW9i9/LAl
 Qfk2o2iG9pWJzoLfQ326Xpi0QAYoN/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_081910_286653_72C3A0E3 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Loic is maintainer of the wcn36xx driver, and is now actively
working on ath10k, so he makes the perfect co-maintainer.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc64d98a080b..7adcdcc77d5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22417,6 +22417,7 @@ N:	ath12k
 
 QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
 M:	Jeff Johnson <jjohnson@kernel.org>
+M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 L:	linux-wireless@vger.kernel.org
 L:	ath10k@lists.infradead.org
 S:	Supported

---
base-commit: 6a9b6e4b4fce0ba899eb6f830736af565a2f4fa4
change-id: 20261027-ath10k-maint-e5343748ec7d


