Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC450FF6E80
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=; b=LtEPePpqpiKQO+pTrEmWzmkRkV
	swTVuTYLFlcx/zocXRFw2tK0/bQr3B/A0n2X2FBjIm/phwPssyvVYEPlgotfr0eZI65ekJeb+D6wD
	XASJLxLU4eqdw2Fvf+HbWouA2vgX4KXdczS5NTjT8kXGW9Qp7+KRrI01HA3sA/7RsnYGjcCwqCO9D
	9PLrv4+Z+Gprw/kvpchNc0uG67Y0Nl5KWd2qflk3D4tIGLhdbKwkUzVHS4ZeF8BcnSnMoyOXTjZ/Q
	LeVzlQx3IdpFbJ0NPYK2n60+SyidtpEoUZF6poNnHP15m14/G9MknydKUzPVkPjBnnNYsoP5i8o1F
	RAXrGNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUU-00000007DhA-2dHd;
	Tue, 17 Mar 2026 20:58:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUS-00000007Dfz-1Gqu
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 20:58:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJXuD1260733
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13JEGb7aTnX7IY7HCWv/idnN
	4TiZVfefOdq8xjCIpRA=; b=PbX4K2Bqg4rwv9YhBy6BCIkis1123gnDwv1ZUynk
	avZ4xOdADkyRER5OZ6i4XUeUqV+BvuIyEchK9dODrt50fnytLyRlmcEV6Ku22Tka
	QWu7KKQJH0hd+CnHIoMSSPRfBBQBSUNni4UK+WcU77OT+gb7vV8s30S+ZzpGuSAP
	R9IDtHPsRJwHDGT7ZvVtQgXOqDPlR9RkjVrU3KQupUBuDOKFeqbKJnR/EEZZetJ4
	jENqq3vrgpgdTCfDTsmhYoiyJd8GlJi+G5KU+YaUuDL0wkOEjdEw6hF3CcYbogq/
	+8/M2tQPoOEDoEnGclSKd5CXB+zk4SaG7Jn5wL7GnX2R7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8j7qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd98d96382so726073085a.0
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773781089; x=1774385889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=KTPzG5wPvEKjDA3QNayVahrInST0lkIFiNFklwAG/FUxq/8FDn+XluEGBZpF5bdC0g
         huwoKWUlqktY67cWYEBA3rg3MkI0zrY2wcjNIs4T37HS86F1u582KNT6PBQn5S0GS7Ik
         zczqI67sCmOY+5lfMfWN+8fo3m0TjYqszYzIaXre2OGcHzoj4i275Zr5+hJd268qElRy
         XuS7VZ7PD/M4xhH/jTYZGH8A2gTg+UFItQ8TxOPQKBdI70z/JvphRgt2R7DEp0pbeMab
         TR+Kc30zvobp9joxHY7sEvojMCW6ZdXqmDKMzT15Kqd4o8qqY4vSUpNlkB1Oqp0lQGeU
         JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781089; x=1774385889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=Ha8u94nuZ9KRjhNJee6BDzUN7VNQGxU84qprQE6LMNJC7hP+dpA6dfgNPbcgR/qqIk
         ohZMfQePs1IQ0TEKhjE3d/Ga1kWFaWNDqqJAkzXGuVJYwpus+5kLCVU6lzIypB0fHx1V
         ifpRlRxKNaIyW+oQviC6yjCYw/r7jtLDyAOqjJuqbknl9yD/LTlHgX+6ZFvMWkus68z2
         ASJubh3Nd5cHrglOvUhNreghsiW1iJWJz3CYYFXOb3Pqm1HPyRn++/c3RTRiwcEuzSDE
         xHDT+M/V4QD6BG0Sg0sAIl7ePsKl3lX8RhHbmySwa87abH2ctDlqWD37VhTIAUcF4O/a
         FWng==
X-Forwarded-Encrypted: i=1; AJvYcCUOeqb8KkfnMTc4HGD+NHbob2j+FfGAWt2JJCWqCNacaAHagTWIYC5EsSyAF+6WzukGWy2D4uA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpL5aHGDP3jEgQAIT/wd+M6pIadXnMfLArcIyKLPPoWT2vuA+h
	0v2fhdonTbPiJj+oX9dkMb0XttwD1ySnJeU/RatHPA0gxH0DkT0jTNyf1BxHXdnHWhqNp/76dbb
	kmVj/jGVzfnZHSi/e0MDJaCZH6VayzqXNKXLhNIMLXsQtaJRrK2A7qGqLeNro2h7r
X-Gm-Gg: ATEYQzzQh9zpU4KCHrqOlaz3sNEqy2HW1P/cbrm980yBCZPgmEaUKo5HEipAMB8f6y9
	hdBiAe31bzZFNBTkPcf1K4uANk9o4LefIlJaeBjUIxRyqUEZxG467N+JaK4f3KAvUtc77bewrfJ
	8C8QQFd0DONp3qwqoCC2TI9isdaG1AFiknkL4S9wgqTpAtT/3SPcqlNZDL6YTXBWstmG20Uegd4
	nJMGwsGlgmkYpby8tFLU60ksC+tB3tjYbIJCxOTnRALPWSTHj7qD8TZ6okEkiJfMQwE/HRxWhhN
	BGn2JojLkM0o/Rj3ottre+1d8ft2oYrUs3zIC9Pd565Q0CpoEstqFGe2Cpsb2/M8FyhiYlyvxWC
	KhDNUsvWByyajv0ie6YpBp2Uz3MLXefuuOTAO2TAyIvliDMzzoLyCJZgX0y4a6Z3KbmWB8uql+n
	cJG1HUQIv+N4JgP3/eEB7eT59Vu2svOyLaA+w=
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161538985a.21.1773781089340;
        Tue, 17 Mar 2026 13:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161534685a.21.1773781088780;
        Tue, 17 Mar 2026 13:58:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7c77fsm101863e87.81.2026.03.17.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:58:06 -0700 (PDT)
Date: Tue, 17 Mar 2026 22:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
Message-ID: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
X-Proofpoint-GUID: qNc05F24dQjCyvZpvMr-P_tnXJaFDrTu
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b9c062 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=5Y3Z_7dTJYxM88ERm3YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qNc05F24dQjCyvZpvMr-P_tnXJaFDrTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NCBTYWx0ZWRfX46PPz/y0z3A4
 7+V6gtuIK3xaohXjXWZjximDkqxch2J+2CRNovhrv8DZ2WKuciTYbtC03o7QiCmk2CXpI4Pc6tc
 2LX1iIrRW2ElKoYkLIjlIzY5qksNTsE2cPb73gDcqRsMK0ptz1M6XtFN3XuykBsmGqx8yQAaWzj
 SY/EfhuEGdq7c/pG7Qz805I7T7IH40rz+QcycbFYo7tKRkLlzHFn7jWwd6/vqxTl8TBhMIWOSKT
 5y4GL59nJQ1lta9wCM8ftVSoSge8VnvilUDlxwjkkcMPZZX85xJ4WuMjoehwMDQWi0cHaC/lJHx
 GJTJaOeVEDylfPBpEX8BGjdNKpOeNmNE927VDwWnH+D7moE3s+X2jX6d0nJFuRv8Wc9x/dKktsH
 2+bXHjim/7SS1GAe2MHnKy0+VA6aOsiZ+9hmoW/A0DtcUHLA3TwskomNgL9fjLPPqfDlZaugAQB
 Xk+1ScK6Sc451nBv6hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_135812_337214_58D0A914 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
> 
>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
> 
> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
> 
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
> 
> ----------------------------------------------------------------
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath11k
> 
> For ath12k:
> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
> and Automotive.

Thanks, updated and pushed out.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962

In future, could you please include similar information into the commit
message too?

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
>  ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

