Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0287FEA834
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1zjHPQ5lI8PVuba+qVukuxWu4EsG3GpdABCtQnUozU=; b=aDd8RkCnkbExULid0IB/i6IjCB
	TojPYg2nSuoxUd2YNo5oqZDqwYIBNLFTeEV6IoXgSXxSROkymbhvR4ExophnaysWFjiHTRGnj1clX
	Omanje3JUQB70EGW7HGU5lb4+CjQLQMd/p2dI2K/9ZD1bodmx2y2dntEwXqSFJL5my08YWXX7/z6U
	X5puh0+o266VIsKLl4BOXQG1fmZamXdiNvEqdrmu/pO8UA7oEX+9RWl4HThIpeK0qN13bGQPohdVG
	Kh5rnKqSHBoMkKAYyS4lMy/gZyZbu0rK/ONNZ7dOrOAMGHD7REzx03slr6hC85VB/UEgG5Iw+a36v
	J+w2f8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jo7-00000002yAX-2pza;
	Wed, 25 Mar 2026 08:41:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jo5-00000002y9J-2fgG
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 08:41:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xO6l919708
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T1zjHPQ5lI8PVuba+qVukuxWu4EsG3GpdABCtQnUozU=; b=B0bbIL/unu+PNduN
	ad8zuWeNp8wjkCCTiuG0L53hsS1wCtBuCqNJhIsyA1eoJvgJBmnBv6T0WjWsL/Vs
	eRwgIBr/8T2mfIO8ncAS9pI262Z1O6TGatTdJ6VH2vp/q/JlWiz0wdwZOzUCMK2C
	uSP+dlNoXKLMg4ZaVgflMf5LwKFAXAytnzHzmXmHUfwFix9LXa9gMsIUnvUOb6Oz
	RRYNQ3ifQatwSHyXdhOX9hbH+sTSE+66c1fMlEHqsofeE4pGkm7fT25dCVQc4YYq
	8q9GzPsq2HMkoriCmH2nbVMqlhhTAgLxRFHA5JLu7zvwZjZ/VXujxKIPg6qpZTK7
	P3DsXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mgxfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 08:41:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c5976a8eeso132532276d6.2
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 01:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774428099; cv=none;
        d=google.com; s=arc-20240605;
        b=VDUeU5iqFBxKQu7ORcglq1TjMUZhHEOYHNTD7OK3XtXWdZqhYMKwHy5KN5m10WbP9r
         OUW7bOqN9KsOkedgObgO0kQ+GDBZVWWZGUpIpRWLZ3CgtkxJvqTxJtJ/VBVrqU8wYDU0
         LTAluU5OTVxcfnw59G+PqI64NpVpoZ5UwY53F8bSa2T9l/2NsWKXpP8xVWwfM0FWR2tI
         Oq8nM3sgbDYiC1ZL+Va+08xo/iR5pmrgkiX1aE7mjd1Sq9UPdXrcI7Nkm9p1ObH3VDuP
         wJ4lJhzcCmJRYiqtO/7NmKU2p+9ITRe5RVWMhE3NAsukI8LK7/mqTSYYcwl4QRAcrv/l
         HLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T1zjHPQ5lI8PVuba+qVukuxWu4EsG3GpdABCtQnUozU=;
        fh=BFNWCkK409Nnr4xJwZZ8NLWN4iUD8JzqNzBO0L9OKK0=;
        b=fvqjJydSTksA+Y7SVOi+6fJSww31jF59H3Mw0UIyCMa8eI/fGMkLKUX4kgXf2bSfOL
         6xqNvanfjJi2mCOMxV2JY9tE/PBcXk8mF6GrXxskEhpmzJ/PQRUeNJ6KIEiaN7QPwIRF
         jwSWortewiF57cE5N5D4rXuLNJK91n4RyBQ7D5agAOWV1MpEiyIP7d8SlchlirzvBxUv
         qdmo2fGNnASd4HwHYay7cN15vsB8fGKypu9n40/4CJcTAHx69QycdBksPMPHACRl7wY2
         akZ+OOCFQtQwy+cXUPfnP+P+CIYEhgoPKSsaQRaIqG3GDnaqsNUWyuj/J5R5192BjZS9
         J7AQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774428099; x=1775032899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1zjHPQ5lI8PVuba+qVukuxWu4EsG3GpdABCtQnUozU=;
        b=a1k88rHx2oDRexaEQCbKSVvqoNpIfIZHIHaG61tqSiYFf2jVv/h+Ze1g/0cYtDeznz
         fhA0UIu79MRh3V6cdq6CjI6K/qbKbOdmqdc0qRn046VkqLlie+edN+PWPI5TMfgbNyWW
         bbfoSDn/wmY5W2F2ZUNjhd1gTg1q+cghkV6lRoiX/Lx6KwBXeLt0XLLife+joyupFrfZ
         DIkugLCOVlvPHk5uJBQKRRLCfqE87wkbz5ZnRtbcnNo+Y/xPMu5U/6k2UaMosD6540op
         gk1uLPa196Z1UKfjQKDlRrg5pZvV3FJOBly0bdavZwX6IRFdz76Oznz+yad3cmIRhkfa
         QdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428099; x=1775032899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T1zjHPQ5lI8PVuba+qVukuxWu4EsG3GpdABCtQnUozU=;
        b=MJpHlLIBIh9hZMv3IQhvD4WBRvveMj+bsHOmZ5y20Vvvu4Q75H8U302s0BJgh6MGb6
         fxSHp9YrVQkI8QcvDIkNOuw93U4rkj0p4qwq116/lqVbK46di2BFUEar8N1fMR7vgBqH
         c10XU+cLOX28PechH0lkFRLtJapWl99moHZ0pT3p9DrjYByawRT2rbgndZuhNzTDhq1L
         Qc4jvczVB4VcDiMalvCn1u+YYHw7W6H0bZu2XpCvhojxJy5Rvg0LTnd3EfupYmI7FsxD
         TElTg82PCQhnK8wuYbDMoY0QNfYpuZCYhWH6LlQtOe4qUVynYtEB9KiWOuTIr8HGscFO
         R16Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgV3mPRCHU9vOlRV3H6UOLbAkWdEpiOsQcHxcGUItxYmLRWnopaLEZPb9wBMCqvegQs6f3YAw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5RAEut4e9btLrR5KcG1Ib9ak35YfCWeIznYc9KZ5jwg1vNjaF
	jwr6vY05HN9QUYI64OcImSOPMlhGw/WJMjderhOdq+bxs80w1ZGEpiTEYAspiIW1ikgFS5+kgrQ
	pGtmeEQOJO2zHg9QSE0lk2mt+THkxWDdnuq4s2f1zOqz6CsWEX4UFJs2xo+3pL/ZO/JeTmIXklm
	vPacO90KukEmk+x2xDiORL7GG4WGA3pSaRxwX+ous=
X-Gm-Gg: ATEYQzwa2GtXGM/Zpjd9lQBxGv/BcG8zcljMFpSygCIF0DiG8h85DrOwmJxUOoQGCTk
	5xO8iYZma/aA/mogpprKPAUlUqibdBoRvBUWOP3P0H/bmqD52a9Q/FAyls68vpKNuAQeckvwYPU
	js0LtvUoZr9H3+1FqmBG5L68aJAGHtzPsdJ7wizFjK8fbzjfLxhK8FP5Cl/JGlOOODjn/5Wx1RW
	sFuDsPWtApUPhoFn7tuO6oBIc13EDkznUJA+7SolWcVu0FKUKv2npyEQS3Ge9zBlIBX
X-Received: by 2002:a05:6214:2485:b0:899:f6b6:543c with SMTP id 6a1803df08f44-89cc4ac0f92mr39247736d6.47.1774428099612;
        Wed, 25 Mar 2026 01:41:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2485:b0:899:f6b6:543c with SMTP id
 6a1803df08f44-89cc4ac0f92mr39247456d6.47.1774428099202; Wed, 25 Mar 2026
 01:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260322124822.230492-1-m.schababerle@gmail.com>
In-Reply-To: <20260322124822.230492-1-m.schababerle@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 09:41:28 +0100
X-Gm-Features: AaiRm51dz42AW6D-9JeQTbw_dWAmALtuGZ73d70-yAcNiIPTtSxKhjMQtI4OEDw
Message-ID: <CAFEp6-0xShGtpWEhmYmqs0156GHZDsF4Q7E5HOrMbnGSAb56wA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ath10k: WCN3990 firmware workarounds for WLAN.HL.3.2
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Malte Schababerle <m.schababerle@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2MSBTYWx0ZWRfX1rY5eTXdxa3Q
 GwXW1tjBLc+UBv4Nec+tolFcYvS7nCL8Q6DfBFmsORHKBY/b6o5BD4hIv7y/r5UuQwqD1aEzkHe
 2W0tcet7OcL+gUMwAatFZrE7nEoJQOsZoQADFeyXtjD0GnSI7yn1bq89Ij4R/X2KMTSV4IAYb+2
 Oq5Z1d39Dt0GhIaP0WW/x06wfcIVv/27I6M2yvXoYMJvgYqzsAvFGS/LuYwzxIYGhFQS5G2303i
 6b9kebcD82K1Blphej9oHOf689e709o0UUcYzW0pwszkIWHmFc0gYQ9RtWJach8p8Dvhkx7Tj/t
 ZtJIhoOORUuJ0xerG87NuvHedOQg0Wgekag5krylzebFHuBb3yadcAgTu3iESVMewW3q4omXxqU
 PByDFPcPv1AV4eg0jdcFh/I9CD+mhxHQoqgSfWK6DECsRK0Fyb8LsGBGVDReMNZWZmigjor9wtx
 T7JxzwaVEa5i9gVZ7fQ==
X-Proofpoint-GUID: hwHAQiRhBv87oVMktjBOGphp7kIlaQdv
X-Proofpoint-ORIG-GUID: hwHAQiRhBv87oVMktjBOGphp7kIlaQdv
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c39fc4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=I7fk8Y-XGR-JG7Q1fIEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_014141_684603_23243CF9 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Jeff, Malte.

On Sun, Mar 22, 2026 at 2:49=E2=80=AFPM Malte Schababerle
<m.schababerle@gmail.com> wrote:
>
> Two firmware workarounds for WCN3990 (QCA6174 integrated variant on
> Qualcomm SM8150/SDM845 platforms) running WLAN.HL.3.2 firmware.
>
> Both issues are firmware bugs where WCN3990 advertises capabilities it
> cannot handle correctly. Tested on OnePlus 7T (SM8150) with
> WLAN.HL.3.2.0.c2-00006 and WLAN.HL.3.2.0.c2-00011.
>
> Patch 1 fixes a deterministic firmware crash caused by the quiet mode
> WMI command. The existing guard from commit 53884577fbcef relied on
> THERM_THROT not being advertised, but HL3.2 now advertises it despite
> still crashing on the command.
>
> Patch 2 works around a bug where active scan does not tune the radio
> on 5GHz non-DFS channels, making 5GHz networks invisible. Forcing
> passive scan mode restores 5GHz discovery.
>
> Malte Schababerle (2):
>   ath10k: skip quiet mode for WCN3990 to prevent firmware crash
>   ath10k: force passive scan on 5GHz for WCN3990

Jeff, is this something that could be addressed or worked around
through the firmware or NV configuration? Applying this workaround to
all WCN3990 devices feels a bit excessive if the issue is limited to
specific variants.

Regards,
Loic

