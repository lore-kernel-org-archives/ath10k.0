Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF22C55173
	for <ath10k@archiver.kernel.org>; Sat,  1 Aug 2026 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPSSCCoRmWeCr6uxglKQN7w7FivASbpOfeHhqqwjudc=; b=QnGfNZBFV0YY8iluO80SdICOTl
	/ccU7rp/49BMLB8cvL1/T4GeXFb7GCTnH1ZqJ4eqn8b/fLHf5Z7ZNLKiuTm6N3Ze5lzJTWK7JZ0Gc
	F3/NxZcCj8YV0RU7DEyv0Z8hHlYfn4rqfLFVkHLjHUzrNsV+kzR+yVAdhR4/b30IZxYjaL8r09UaB
	ytCXHvgagPfFz2IDBHbd2B0LjGVOZCP24VxGi9dI+M5wzAqn+gZ7zsIqLfe2UQfh4JrrmXLNCaH6O
	Zq8opOcaL9T4zDz+ek5/ITem2g8mDGDB8f6HOjHutudUviJic/N3eicXt9kwIHinBlSBQUCQXdkVy
	ZsDseW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3t-0000000Epmm-2Ygu;
	Sat, 01 Aug 2026 15:55:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3q-0000000Epla-1TZT
	for ath10k@lists.infradead.org;
	Sat, 01 Aug 2026 15:55:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Faf1P3612484
	for <ath10k@lists.infradead.org>; Sat, 1 Aug 2026 15:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPSSCCoRmWeCr6uxglKQN7w7FivASbpOfeHhqqwjudc=; b=BhZBOEZXa2iNYMTL
	loDAIq0rUNwvWC9KBaANuPCKKMJjwof0XKEBKDgzB7vYIqh5XXw4tjXV0ukuKPcG
	/cZ9g8gaAsIrKpjHlAINL7rWvwDFAxS8Wy4Nnp1lAYpnBDpkm8EHj+fX5ChH75I6
	dGpqOKNyfHQiHjrmIiCSCS/Ia3t3N++I11s4McTwXYsUPkh8vkC7qLcw582EwbOs
	jtfR1wzTiCpKQNWjXgv/l7bdsTXI4pAFqhs0tAKyLPSNVsLafu0FiS5+RpvZNEY1
	bsTU2ham7igqOniqpjBOlDNAxNblLf1TPw9zzSOdbb9Oaiv41etoP/3JYr4NPWiB
	iORV3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q518fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 01 Aug 2026 15:55:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so3430546a91.1
        for <ath10k@lists.infradead.org>; Sat, 01 Aug 2026 08:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785599736; x=1786204536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPSSCCoRmWeCr6uxglKQN7w7FivASbpOfeHhqqwjudc=;
        b=aF4b4iryEZcwdD2PFptu5EKqnrLYm3IcFkFZ0UACvpNxcHOg6bbPzMvWdzU0l3tu5w
         Gv5V8gfXlw+D2UySu0sPcrJpSynPtcX5TsDKxoPpOWJUGj4JRu94CfLFc9HpNA8kJ+Ud
         9aI+mXBlBvJu8tSy69ryxeF+/BlZrxyrrKXfI1uPfnbMG80H8FtOpGV9mds8NVgG8SaS
         kQRv+m3RKzCxY3FVbgYd7p0hcMY9+UNGie/KsHkRn2OHy01lji7pPqK5WrHvZ6EOzVCd
         q7lTnRKjVg1pIWSKb59WJ6nkiNMbPUwOx7c3Z+odyB0soU3wh4+RWsr7i14finA07aph
         Fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785599736; x=1786204536;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPSSCCoRmWeCr6uxglKQN7w7FivASbpOfeHhqqwjudc=;
        b=sLpnOqEJlUYYppUkvkb2jRYYuLfwHNsTMoHHxhfqSBq+uSEWgAO9Zsr5c1QAa3OtW5
         9UQUWu/M0nVOf6czvH17BtohemaO4UotnLvHs5mtlPJ3M8q1UYkqH1s67kBln3ZNOiRS
         04sIEux3YN7y4dv5VKAfUqCbMEXrjqqs89SQp3UNZO/WX+wm4qQrUTbrThy2UV9iqQ+Q
         qHH6PeB27iDKYnkNb5iPleq3hDVqdNQUGFjVFiqpJ2DnwCEKfsjxY3wwDxzKzWpwzBuc
         FFiX67PSCf7gVIVzWI0mc9sMk0ckIyBjIwhGeJpxiHz0ZLY9V9fMDVkWLbnsxe8SYSpt
         Nc8w==
X-Gm-Message-State: AOJu0Yx61gayQUbWEBZALEJ4VEl0xGufhtBAfBNvo+85xM1Wf5EVwbG1
	OOSzP3U7Ds/LfVrDs3MbJb2trbgAhVT1NHuUQJoKuV694FIs4KOP2i2xmw8+8fZOBIIyZ0KxGNa
	DO6OPrpL2PhCUJepoOWlpyRt1B9ksIr9hxSR6mZfOLJE8a6eVSfwd93eDF5wxnMf1
X-Gm-Gg: AR+sD117FFUFs/T1+4el1Vfet7ReVrjamjQqVpqKTjxT/CMe8tK1OjOBz2g9LS+XPUu
	knGm1D8B5fn2pXrjus1IzEL+6t/bRFu9TAib5cK/VRFaP3azMFyeiYGg1GwLDxECq1C/miCXsqh
	imLk7P1JLSKMhjBadP0c3RoWOTL4aRISSFYWOdL+pQ2LiW84qQmpG3ajZhnImHyf/hWKn5/9lDP
	0dIqAdmR5lgwAVF2S6rfPU1o/MK0ct/1mukZ1rzMJ5+ldmUmC7Ck5JV3Wk49WzcytyMIx+Q5gBN
	Nv4IKKmiTPGFFTkLKQnHMz1gCh7CSYp6c+FA198ArjrL2rZgSxFuCLoZqrWIF6Y54qO+VcGKB9P
	wpkg5rKqwGeB47fMWJUNDphh5sLeWSa79WwhWwipupY6xl8dw4tXJjbc=
X-Received: by 2002:a17:90b:1c86:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-38fbc4431cfmr3533276a91.17.1785599736285;
        Sat, 01 Aug 2026 08:55:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c86:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-38fbc4431cfmr3533259a91.17.1785599735824;
        Sat, 01 Aug 2026 08:55:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm17110636eec.1.2026.08.01.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:55:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
References: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: filter non-UTF testmode events
Message-Id: <178559973458.3865089.3131178536876006419.b4-ty@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 08:55:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfX/E9dPT3PHhfb
 B0BrG9BVAQJMb8DTb3WY+/wjpCtoDzKxqvO1kXGGcF/DMILlwh0FYRUBP7psLjc3soAl1f8iZpG
 IH0wmdKxa6gJh+8l69bsvinKswK3rNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfX2a/RFyQkeN6R
 T/XDI+PHdK6XHhh+rqPePlSLXie3ouLa/gPSpEuAdf2qDwFeSTgoKSgNXJ27GGxFx7EHCQJvraM
 dlnzeLA3bTd57HNLr+taeverdGx4q8aPh9QUOIBHVTYd5zYDgbF0UgnKnEqVppAuONQEPkfSpI3
 abJipbOFC5vWEs/BrFwRqKKMXUJobyU1IwWtjHYMub6Xje2rNB5mntlBrwp1eGbqQIqpTjrmWfz
 xmqx/qjiuE1Yo82VkdEmeB54/l32jGauObiA6Mgs83qZa99gvxjpANoCDfrKGmln1uR0VbO22mG
 1PLuHa87DgZlUwlinU8XXKE+kH1O3ld8xPI7eamtNGcNFd7r3a5YMHSGCg54APU7QD468dbt0gx
 WoFqezAnKJ5IWFN6CUfnZfjpbyksIMI61LHXQoLoG2a2kkb6/LNrvUConiWEnfDV7zKz7dfB62f
 qPZ2ZpLsLeIOz5AqMuQ==
X-Proofpoint-GUID: lQSVzFQsZgq9TjmBOr6soLPaJl-b1uTc
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e16fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J8ee_osQro5uhysJbSQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lQSVzFQsZgq9TjmBOr6soLPaJl-b1uTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_085542_512536_26D18CD5 
X-CRM114-Status: UNSURE (   9.08  )
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


On Thu, 30 Jul 2026 08:02:26 +0530, Linghui Wu wrote:
> When UTF monitor is enabled, ath10k forwards WMI events to nl80211
> testmode. Non-UTF events can therefore be delivered to userspace and
> confuse FTM tools which expect only UTF responses.
> 
> Only forward known UTF event IDs from WMI event namespaces that route
> events through ath10k_tm_event_wmi(), and drop other WMI events while UTF
> monitor is active. READY events are still handled by the normal WMI
> receive path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: filter non-UTF testmode events
      commit: 35a3da9fe1b212a9012952a04f383b8dc3708dd7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


