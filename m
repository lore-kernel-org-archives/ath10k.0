Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B2CD13D3
	for <ath10k@archiver.kernel.org>; Thu, 30 Apr 2026 21:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=lQe77p20VGsrm3vllzgsLyrqAb
	lWu0lX3CzaNjseR73X9G+RhZarC2hACimVI+rVY4vqq1RBc3w7v/P8E2mHQXS5UYCBq50kMJGW3zW
	IOwBmcDkdzhxQLr2tJ/37CSaq8UXJpsTUvQiIfQ38sTn/GylEywSPA91OzFTjF8GN4i60N7WZg4BL
	YbbQyf2AAsPyi7iklT68hLQx1uivvxlk7+bJKu3PeRgH7IjvDr1CBYIRCpCAKSE5KwOhwmGaQyac/
	2wKhhC4MSmC8KpUxpP3ATLGaxcaav3TewyY43YWCXpbEfE5gyAdKNOOv0xmjY8mCRUyRPuKpWuNkl
	Av7+e1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyH-00000005z7A-1raQ;
	Thu, 30 Apr 2026 21:30:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyF-00000005z4Y-0Cbw
	for ath10k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=BRxPbMZC0b0NScVFt1HHTKq9AU
	MMI6/wl5XFfuaDGwghkZXaPr/Ctks6FRnu4+x94YHFy6RjFD5dteo52X3cboi8tHcrVBTK0FQ38T3
	nNRxsd8a7ViLSCddR5KT2J3gffeeG4R+jO1KFXT+j+hP/4JfjqcECpy23elZWCqjZQAF8gxPtTzL/
	TnDqAkc4ve0KRvrIExgPUyjOr/ujIePxT56OaVwQGQ4+HK1hB1MJr/JkEaJkjLzTbu1CnLhkV/blj
	v52KiLRmQLbOZO3B2Kwf5WHNMZpJv9PWGruXC0iGaerj+SDfK0HNM3EhN5mU3eJ/gdSU0eVQDPPgI
	5s5zx5QA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyA-00000008B7A-2nVF
	for ath10k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHACuO1820724
	for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6getp9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so2033351eec.1
        for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584648; x=1778189448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=jASO+bXG/X92fm526dHR4uFqe4D93kOiHHdO51vKLDbDUU3aoKQaFbqYBiW/yKvzMD
         omzdkRxJsbjgZ2QGX2fQspvrBHncfYRGAYjuYsYJXzs3G/0CJ3/7imLEqQ3peJmIjFjb
         McpI8foG6UWIhjOGMCX2SzJcMCXgjtAoG1DdHvHIBWOuT2PDexsfmv6TFPIXJzOJavVx
         bgzEJwPx2xpo6USjFdYkcQCWlxgtDNCywjIzwYVseCNm54nRt6IwWM7PS1q2DmOXY3/X
         /2HeDC6i8lvg5IUwXvRoFB/e5LKWtCebe8FNMRT1opVKk6y4Ca44zB9ml/S2GP+KccdI
         M3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584648; x=1778189448;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=AggZmOPKAhgt6uS8O8Mqdc8Hy2I/TOyE/uG5AGs99PPFI3wS3c7tTT6j+yxb/9vdDl
         3TEeH6ZBlCYSSi3/7Mg/8S7EM+TjzdAf1fes/a3ML6KgmKu5ibg74SIj/iKWnIX72xQe
         eFmAJdv+oEHYHWxcEyNrbFRjM7FqQcQAT2syHtARFkUhqiJo7Rcm/+YM9sRJ+EAvdYR1
         MsD4TCrtw7caSAo+/cAn45ADfH6fGD96gIDx2jgicRMmMHp6CJAWzWqgSBvRgYvkXAWe
         nev8erApYEU/yH8gq8q+qql7F+19mY+2tUnjENEGPUEaBiYIM453X8pL1w0ZcUy8BUI/
         ESBw==
X-Forwarded-Encrypted: i=1; AFNElJ94u66q2ef7Cvpb5y4KgScVFSjCKI0rZPT7xC8q2DvZxSSUjcKFTtin23K9WWwLJZOLuXsFbCg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUBH4uz4YQ0xCiTEAYlQA7Jm7QtQtSXDzDHI+M3xumK+vRmkOs
	qxuApYl9kxlvdA7AKtP+XxEmjdrWaew4LRo+hgFe6xifpm9eJlO6jlxoMsrgoy1iXP004pOWtz/
	/v+AWFfM9rFzIxcoabD52uJBeItNPNVmLh4GmG6Qq0DLABOvKUDNSTiPLZEeivt24
X-Gm-Gg: AeBDiev9BcraC2cVvVVf7IKFOz7VTe/Sr/30E5MteKk3XfNTGrQtXvPX4Ki5LUM63zk
	qak7G6/NxGbDgcC1+jBHta9pnkrrGuv+R6dBO48Wq44gmuaYtv5zPoFfnGbVL9TorE+55XGnImG
	OHQAbzK6R6E3yLk3sLVL4aJKYVNVfx5+1o4EjKhY1DVMhL61cq0dYCtiVgUAV4O0YRul8Hj/wpF
	g6iM8TkdRCka2DYM17Jqd5EVbyVov+gZx5Kv9yjO2xXXcVTotpf09T8mtv0NEB8X6ew5loM7eoK
	QApTCrHenBap6KO7oafcvATWMxcohKS0h/4u7aB/0QwrLqJJgbwELm61fNtct08WhVLh9M8IRlH
	XunO48urK62cCITd+AUNstGvzfkB7aVavhw9piGmc1FdSPxg2rc8WnknXnmluX14Q3fqd6hsc4V
	q1tOHG7KDyqxM=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181074eec.8.1777584648329;
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f3ca08 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 1tJyQ5mkvuGoh8ABrFucl4v5z49sv-iz
X-Proofpoint-ORIG-GUID: 1tJyQ5mkvuGoh8ABrFucl4v5z49sv-iz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX3/9fFLyb5+o0
 Ew7w8ahN/47n/Xor4uZUfp7bOeeYqewmdX0FUiC63ZA5ib47SpLWyyMd8sWZylX8tXd0s2/+Dra
 nBemBLaqkzkJ/BPzqbgjt8XDK7DyJeNRsAPJpD1FkoY0tLOCKNgYYfXgs9Vx4bkeCKh4+azGxU/
 WE+iWG9qImU2yy1XC13g/tS+kWeuMXX1rNwk8RdH+t/RUnRf8kQYh03ffGxadhAxS/04ZzKdMGo
 dUE9te4Klup4zabY3mquqX+g6mAei5ZykRHbcQNzBZAuWn+TnSifUlB57AaNGLPVm1YJ+IXrMdO
 hUp8vbgUAGQ/viIZrqOxBVgDsT5lLQpEGoXBn5/Wpf8cEd8c4BzxaL/G3RbshDKKTOCkHoZz9xK
 jzr/6cJyAN34uqElTi19zIbRxxLvjXNkv1ng4uPgDqGbcbWh8o4CIp54w6LYSvTvAHI+/aWtgMa
 DN10s8H8aouNRgIwyBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223051_248752_F6FF1B72 
X-CRM114-Status: GOOD (  13.71  )
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


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


