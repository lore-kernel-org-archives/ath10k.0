Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83709606D808
	for <ath10k@archiver.kernel.org>; Wed,  4 Nov 2026 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DZFahPpD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OEUlIayp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMVxRSG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YV0xYcAbjZFkY14Cybj7K8Wm+B6qVMefd9Y1baOJvn8=; b=DZFahPpDMVYJrn
	SiG89oa38UBWd+nSVrz1XN/tPLS6ypS4IsxOrI1dn7jRNOo4JTG9mcX/QmGeHv17bXiY/pk9oT7/y
	dZSiIRdwQ/kushkMz92JcwV5u0GYRijWg+5ANMoI+DN6ypOYs9pmwbCe4xM75UTPQ4uO+IPyjQbV7
	RiLM0oz+vatGCUkP4GYQDajffiR9e7o3EtOEMqr/1j0C+6rfF+nCkbWMld6mU9uKBm65w2uC5kpYI
	9aGQrLHNjWkJ4BBXPsBjh1m991/v8Slrm0BB0h7V/71+LMpMxwkxBFPUHMTlXdHcpKpQ6R23Get2v
	iHq5vXaBvj/sAXNAbHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgDD-00000006VLM-415T;
	Wed, 04 Nov 2026 18:59:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgDA-00000006VIe-2cF3
	for ath10k@lists.infradead.org;
	Wed, 04 Nov 2026 18:59:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj8Bm1692569
	for <ath10k@lists.infradead.org>; Wed, 4 Nov 2026 18:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YV0xYcAbjZFkY14Cybj7K8Wm+B6qVMefd9Y1baOJvn8=; b=OEUlIayp9ty/OGOo
	Wm9eY3B3sfv8AGOZVHI+zKENjlfJ5PMDULSlY3/7YCVY26W3d8L6m/OnKOpuQehD
	3PBA834HNHN+T0w948vrQkIExkHl/zOk+rkS8wBkkjcC5a4YxSTZ2VONly4AjVz0
	j62TtQFcer5DMa/iUbdK1z0GsqYMbq712FCKcmow6Zr/fApUrt3XDwyQsLUs1ZLw
	Cu4XqxoSRwTdlxkV21OCUt497oOXxGNlQNDzazM1SWGd7SXuX/0sN2xW7M9GPVNT
	DmyuDArphVsOoV/Lw054WHUJf6Ip+hcwZFGY54GQdbVPcw4xhtFePsbf3GFlLqgd
	jkGSww==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br16dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 04 Nov 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso2600706eec.1
        for <ath10k@lists.infradead.org>; Wed, 04 Nov 2026 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793818791; x=1794423591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YV0xYcAbjZFkY14Cybj7K8Wm+B6qVMefd9Y1baOJvn8=;
        b=fMVxRSG/c21XmhzKiELBlI1pOOlDCmIwVM1rmf1i3SDn1L/TrGyraBlVTwW2YizM0y
         i8ch9yVfIQGFUQ0qq2hXzJUlaDz87jHY9Yj9zGEMdH6jxaycwlivm7gRC+K4idgnfVvG
         bYqPb099R6Fcq42iZwYNIMjrzLWuyPw/aGTUQC869TEoGD24rgnm82Me+NjVYFxNTzGh
         eXhOJu1O6xkDEQBYKFc9QCv0Zy1zVxdUMyXPWzOuWxPrj1OJ0HNWjxs0anfZ6tF2NGIA
         5nfwn737b3wScW1KMhPWD0t1843TgpqsG/bdhj0zxIMg2DdpRzE7o/htvvD6BTsHHosS
         rXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818791; x=1794423591;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YV0xYcAbjZFkY14Cybj7K8Wm+B6qVMefd9Y1baOJvn8=;
        b=CCEppZtZaD3BB4V7D1kxTtWt0y6LpV2yNBNA/LLUE9+XUjXQqpiOCtvMhuvUnLd+wH
         6lp/gQoVoxNpKLhyRirVBJJzpz85OuI19XhfP5I3UO1yerEcjzAsD0h51SH7csyQvmzo
         RqvXdU2LP4JbPraUY1FqSmDk1QDm1kEbQPmoAy9Ri2PwphAqwwIMP2FGlGmho/LZoCW0
         Jo8/hQXWcZJbnUdMVu77r7ZYTq/3f9loFMg7IS/DccKuaziCxH+XgY5pOuFoeaiGRmh7
         P74n7HqluowKAj4A7yEUfRgTfRYbG1Aj2Ztko3RzunpRZntM53dMNes2wMU0++aQCGjo
         yp3g==
X-Gm-Message-State: APuU4Z+pOCltpBisr5g/JiP3bPHKEZMdGkGoXgLbfIe1Fwq0e9OJVirk
	C2MD469JQ9+RiGLaXcgqoCd0IaOjNnYcxwzMFaTtX5PmBN3I47VM0RbRH1MMW5aQVfLlbVpy3l3
	39apy0P7wIXIwGwe1+XGdxwQaZ9/YZxRopVHJjJqWTpQ7E7SH+u4qiKp5ErBX9o+l
X-Gm-Gg: AYBFou1hUIcLY4RwGEgkojT90uUwZoDOw/EGj3f7e6/NT5SEmF2QMsuBgWMMk9XAlso
	GQ0Tl/fTuyZ1dKVKWTr1jAl6mio//VnFL1irZn23C46Nk/8XinqlzZs/3LIsBFy7CmYcNLV5lxM
	uwDoTCksUQdI6STB+ku7Gl1iPQ3bkwzP/ghdSnjVy3xaqV+PYuUnCSLbWIEt6vmXkebwfDAwoO8
	o3T/AVVk9TclVHzPRNI/JnhGsmLVcscZ6WpRdeo2kogflCu6FslGMCEKdukRSSjfyNyhE8612rm
	cnvufZR4qSpHPkEZh176IADd1k20Me5VXAvaNOuVfkYGKSz56Iss/mU7lT5JfFvi2gZqiDbgX6L
	raj55HDU9LdGEkJLP2Jh72mtU6QuHhj2zIF0s8jTtEzU4x2TCKtNXpz7K+WQFddpZUUwKdp+JMC
	RgdHWNpmOrj5ilMpXhN0PWas1YNZ0=
X-Received: by 2002:a05:7301:3d17:b0:36c:9af3:22f3 with SMTP id 5a478bee46e88-36c9af33136mr9242485eec.37.1793818791098;
        Wed, 04 Nov 2026 10:59:51 -0800 (PST)
X-Received: by 2002:a05:7301:3d17:b0:36c:9af3:22f3 with SMTP id 5a478bee46e88-36c9af33136mr9242403eec.37.1793818790212;
        Wed, 04 Nov 2026 10:59:50 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm14596861eec.11.2026.11.04.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:49 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20261028-ath10k-maint-v1-1-1e6ee9fb2616@oss.qualcomm.com>
References: <20261028-ath10k-maint-v1-1-1e6ee9fb2616@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: Add Loic Poulain as maintainer
Message-Id: <179381878943.1666903.15179894702157416272.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:59:49 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfX92K0EUooWlAY
 Ms1pI18jnIEr3DQEvKxqWTR4UvUJ6aCxlDPZnt7MIQ9uX9aLOp110kALteqJrgkmCAVVtSCa4T8
 DQ/8Tc0InTVCuAUn7xvj5+vUhd8bedlOIC81gM/UaoTcMXYlwUZNs3/DXzNmpmZT63wwA/sZ65F
 uLrM0tgEdcOk37OlmaIr1VZqaba+30+zcRYCfhqSv7CzrCpoJ/RYWYlI+N1SXCeAuPc3vCktnTd
 opFJhuIIqTIcqEfyrOoAKeXkYRwo213xAQ7T1nXofaHxgB0z+wGrGRlDFY4pjS16FbbqMlTpm8d
 CHK8tHNLv+eAb8dIo4OcZPoJDb0MWLsiofCFvjatmPdpZp/hI59ZksOnAqd50rxrAIOM223fgwE
 /gui0sS2n8RfIvBcRdqkYsB3gVMIQebK/1OnajnT5XkCXI2OmfNMcDEukzCm/E0cWlxLy2tzx6T
 tebD8D/nZN14JLrGcyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfXxaK1bnb3BOFh
 PGmlzfXdr9KTYJ2GbKKGVTc+W0TERzZAw2fvAThOh8zSOQ9QI7G16XHCpWUEJ8HVu1mGQhEFE8p
 8MvmJ8gOemPCsZufJOwIa1hPoR2JsI0=
X-Proofpoint-GUID: WjoXwQr3m_RGy9aTaICgwkIrV2o3agBq
X-Proofpoint-ORIG-GUID: WjoXwQr3m_RGy9aTaICgwkIrV2o3agBq
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb80a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vd1Rj9lYTNlzg6lyGooA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105952_715797_390C41AB 
X-CRM114-Status: UNSURE (   8.23  )
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


On Wed, 28 Oct 2026 08:19:04 -0700, Jeff Johnson wrote:
> Loic is maintainer of the wcn36xx driver, and is now actively
> working on ath10k, so he makes the perfect co-maintainer.

Applied, thanks!

[1/1] wifi: ath10k: Add Loic Poulain as maintainer
      commit: 9ab490b8bd5233d33c9e1196a1f967326db51466

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


