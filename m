Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C7105D98F
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgwQoKCcu71xquXtrzxtoltKDW2nzAc7fytrdZXTv1o=; b=eZJy1RAGeHDRLw//AK+XRyx0s8
	YbTGGD3E34R/YGciupzEbhsp0+aZSeGwFFwVVv1FUTwujUloJ1XLdNHhuCfekybnOrI/6sq4ONlbQ
	Sdpd9nshhhF0mLttSSviVpy19GtEsoOqhwCykAZV65TqagArWnoOA3ihkszKlVKqXw4ayeYQ6uFDQ
	umBviii/V6Rlp3WxW64eC+K43uQCe9jTCCHyoBxiLJHu/1Nuv2qhSwDvX7eaJ2+H3vypVOaz3gqOF
	Xz6IxPkIFCo1JkdkZTA+S79fRaUE6gWDacZwWl6JqQXJROK1i+fjR8XW26PJqQRU0ix2V5ioVf9op
	32oE80cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7r-000000083RY-48sA;
	Wed, 08 Apr 2026 00:50:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7n-000000083PE-2r1G
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J8B6D1005858
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgwQoKCcu71xquXtrzxtoltKDW2nzAc7fytrdZXTv1o=; b=LsZzGZrQxGfj1V6h
	/Koi0VPOgeb3uiMkE1jPTkOe3ep4uSLPvv/jlP8yYfOzh1axeMNvRrOwHqFCB8BN
	mirzPtnJUlJxhmfqRl4+S1IGZ5xHlpwv3Vr5kKAOi5yrSmP9vtoMi0ni8QHqzVBD
	g1GyGNw3sihmilxNbiU9ZRWnsD459/cPFTUGKPRPniog+z+gSngVF7AYuEqvHIvq
	PGLkkF3EfnkkXQybDTDeQHOy/+MNIcgZdZew6Cj5Ds2deqzJOxt0Mx8smuyh65RP
	5XTbiJ/zMnsIJdx3QHaKjmk/uJkGl3Lkz/7Rt8vznzka9gcVsW3HJivr6llgPHKB
	s7hejg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tp8uj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ceef8e793fso10002001eec.0
        for <ath10k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609430; x=1776214230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgwQoKCcu71xquXtrzxtoltKDW2nzAc7fytrdZXTv1o=;
        b=fbY6ZEUGbrSBMr0f+OfR1Nto9fF4buP6L/lJ2ZRGHX0uIaJB+RhnrowX7E1uCdnjod
         kU/1O29UKIkJqDBIlTAJL71wXPjYPqdR409oK0FPGP1p8NxodZQUTXNt05KwJZSCNj99
         9DoRATGz9awoxusNag14xmUHePYUCdQ+7sGbMvYgX/HL5t32gTz3s3UqXsukMcveshJc
         ArpvYR1Y6zhwDCKen98G4B0hjNPswWDpjj6FCmEDecmLz7i1HdaFnNSNqQIWhDhaDf/M
         Ig8vEjOWbMKqTi3uLy7+rOJHAah57K/5IIRw2dxdxSN9lMrAX9Ps84hXhfLRY7mXP6HX
         ALIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609430; x=1776214230;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgwQoKCcu71xquXtrzxtoltKDW2nzAc7fytrdZXTv1o=;
        b=glY3jouaKfwGjHe4p2X42/UoSp/gwo9tADKFy0Jh9lEgNgqi1fRNqKxKqQqaA7SLXg
         y2DxMF6l9W6DlHKeKNpeM475RhprC6tDgd8pVkHiNXyfb0HzOwTrGglMwHLBIeQPQfKx
         FnEkHyzTL3x7ux2thQgNh4zbOqWCtoZLSEx0ObalyINE3GOjz9vA8Ocez539XZax3dft
         VUorHGqSUCpWXZQ1d7GPhi4uPRdineuazDOUK7dovtj+/QUSD15E6pGEXHDAI+qG2NIO
         BMtAmGNlwtCnXSLlQRO7t2K8e+wlhDoTijF0JTSRnFnMRL4p/zm8/R6Ozi4a0wXCFpCw
         tNHw==
X-Forwarded-Encrypted: i=1; AJvYcCUGbg9mmq7B8GUth8azrlMDKoL3N+hPPXx9TF1QIJVAYJYGHSOS8RYBa4jVgJRUCanD0RBzqEE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlHrRPzoI2PmJR00M4fuZYrZX6j1DbHLq7e5BrSy1c9hcQLIsU
	U0eEJRib6B/4geeGG2j2ZHRgxJBYOl00Qmrms4k7nTEOvRAKzNQ3pDNuBG9cxqLsZqS3DKPEUHF
	TXimDHkWcBNo2QO4b8HJoTuttzWA+phJxLd5iebtV0pP8JiYmFiq2AoAMWFLYgtf5MHTwPZk+
X-Gm-Gg: AeBDievueceTTtru6QzoVsTDpd4aAlt1sx4wHw0SInCAmKtUEOxll35wJApeCxRE2Lr
	Apw5U0GrmMfetRnOK6m/VzrihRBz+V2qQYmfCcTQQ1ZIH6U9aMMSfHQJbX69FBKmO3O7enSNALR
	CshidhtE24Jeu0cwCvNBRU7+NausV9UL/ez4WiB9uyOLobL9zhhS1Q4v6vMoly1MBN600CpVaB9
	ta4tU8WiSZ72v2GSwHUs1c+QIL+FX6U6Sdjf3OAtbIff/61lG70JbPXoklLJ3RxHkMS+KWRNTNk
	oEBevaBOiG089sAtISnqEWYCdaE8ur+kIaCqCgdwQjUapbPJIuGfVSJHioruGazZ5JYj0S3ITub
	m5qDfRm/9SOJf4jm20seaj7YnOASub4sb3/iWdQTYkUB/YBG1yZBpGCqf8TzCYF+7gKNZLa5OPT
	ik
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr10111670eec.28.1775609430285;
        Tue, 07 Apr 2026 17:50:30 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr10111656eec.28.1775609429791;
        Tue, 07 Apr 2026 17:50:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        pmenzel@molgen.mpg.de
In-Reply-To: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
References: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
Message-Id: <177560942876.2878209.17440433567306755660.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: mFBcoJq5aJbM02-sOkpshl6ujJW-ALOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfXw7VveBz7rHS5
 D7M/mm93ZbBgxUTWVAoV2UtsfNqt/CfEU1fzBFt0o3pILNjSi0qxr8LxgC/zujHhrUl7RA2/FQr
 m2GVwJW0HvtV7jUznq/en61ArZfqtt1TykNrdTdqwSCqVaYaM2vJYRonVDGDcHoiGmY7JjavJO2
 D9I1D8VLsAii3BeuWGYObOUPDHRTIFnG+U4Jkls0dJfVZjkiMrMPwpZDSd3ZkM4+OBdO5ef3Q4i
 eZ2dYmwd21IqOAbaCKFhHsejZBo4R/ZOudZjuGjyJFullBsVCLLLzQxIZmeZ92lG3F/mTTCvftl
 4RlKFx1xnl0ZD/VYZ7fLV3d86mgBavwaPV468CxijJpfD7fSqXr0k3OCsI7v7HrODT7IggQYu2W
 xdN6yA8KFh944YTj+K90jgnuxfA+54cqdB4HB185y3gMzIV53bXQzH/jt+SnYxwBuwGmaS0hMiG
 n6zqRixkLGr80oeIrwQ==
X-Proofpoint-ORIG-GUID: mFBcoJq5aJbM02-sOkpshl6ujJW-ALOQ
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d5a657 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sV67j34BMPHGzpXQRmIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175031_733695_56D88090 
X-CRM114-Status: UNSURE (   8.08  )
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


On Wed, 25 Mar 2026 11:05:01 +0800, Baochen Qiang wrote:
> Recent commit [1] moved station statistics collection to an earlier stage
> of the disconnect flow. With this change in place, ath10k fails to resolve
> the station entry when handling a peer stats event triggered during
> disconnect, resulting in log messages such as:
> 
> wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
> ath10k_pci 0000:3a:00.0: not found station for peer stats
> ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix station lookup failure during disconnect
      commit: 9a34a59c6086ae731a06b3e61b0951feef758648

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


