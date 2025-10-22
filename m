Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D62BCCD195
	for <ath10k@archiver.kernel.org>; Wed, 22 Oct 2025 08:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYXVFaAaMLwr6fG2n4FdstC9bqlVQImA3Ymx6v8/8mI=; b=suBbYr+nITvUQ3P4J+Bx3kX9UA
	QRNNx+fWX018Xzaq1BwvIMXftvxvdSbyuLI18iYQ/oUyZiL4VbUVywvh193RlTzCvsdtFvEcAd7Vt
	Uy2xGy/cqWWwjD7NIY+j1xb958P8s/ETMk5qq5kAGTTjvU2bHvd4sLSSvXvJLffmzsAAvt1gRzx1T
	MpppB+cEPTf4v9CI6Kd2xn3co/crgXGl9GzCli9oe0/tR/2mBUnmVKrWxJwuRM98jwF4afYImipYO
	magTG1YGMGjpsPjLvZ7Kgfhc4a0GVvzHf5Gvp083IBIFB8mPuwCF4+QIUwVmUIduJ9GlrrUfgmEs6
	IVf2r2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTlm-00000001ygb-2SaS;
	Wed, 22 Oct 2025 08:00:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTli-00000001yg2-3Bkm
	for ath10k@lists.infradead.org;
	Wed, 22 Oct 2025 08:00:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M27XvB000307
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 08:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYXVFaAaMLwr6fG2n4FdstC9bqlVQImA3Ymx6v8/8mI=; b=nQ+WIKNppkakuGoq
	HNCN57+udiDo9ZKqUV2gpSbuppm2Gs7W6lfqPcebpF21aUqbzMPsxh399Vr7Q/XM
	+u0aLJxhQa68vIJ1qmxla0JukMwXMSzCeKWxTPnWAU8H9khPMG2V7/Skixpdyybc
	NqdB05mXyKXpFkC8eD+BrMiEtXBDueQQkDwnOM6JS8G4OclIQCL+mf+QEwwF+luJ
	//eNrKanvzCpAyKY2bzUhgYg5+T+GFcNuYh4yVRSc2mibI4hvwMVag0wNq+Qwq98
	IZs3U8YVfxfeexExDzk6fIGJYWDdpgNHWs+hkU4G/0ucAYVTOm2kc4k9IpghZlSp
	8y9QCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w9d6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 08:00:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso12709750b3a.0
        for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 01:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120025; x=1761724825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYXVFaAaMLwr6fG2n4FdstC9bqlVQImA3Ymx6v8/8mI=;
        b=rqce6LcDD3IshECO9UTjWxzLIvN/7pFNrHmWN5AFiHCwX4W6PyMlSErVIPyK5keYX9
         JVghvBxbwDsG1WeJAK2Fyx4yxOFmNXr6yIhvQMQN0uUtnpNqEelvLhiX3MO7VrhxjSEE
         UNOa4/KvhQtzXpdnqmUpo4YbWDIAXWoaiQdrr+fTxpePuVrLnKuMqSUdh4tODIGUveAz
         cNY52JErp8lWuRjYEXoxOJtPCOsAmoFl3OjIBcaBQ52D0Wg69f2veEruv6l6pxb6kg7Q
         18NbeLe1gbIChZz0KkTJPvEtMmIm+zbKFqBf2tO7B4qY/Sfrzajmra0vTK7zl0l52iZq
         3CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDalBvfV4by05KIeuV0mqdwVmcCZHCK1wQdR1K9T9y5pa1BKwh/rvWbkEnXNjvZNaTRegEmkA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywno8U5DlxFSLl4qhfKD89JJHNa45DQJTih0f13dPy4q5VL41MO
	Jrx4ebl3HN3xlZ8q8e8l35SfdQBjzLVy1gwZm/+Ktt8WexJ7UGx2SWyggDRZ1mokHJ8gjp8icwe
	j0dv97o8aJzCB0BMGK9j8uW7V3NV4pTDdRbsrgcBcHIswJqjmpBCAVV2NNuR3VRaE
X-Gm-Gg: ASbGncvwP1Na/ILJt+hb5otquz5klqfIT4C3ysgbfoZK1vuR9tiKnkv1nKaPVQfuR46
	/rfKO7NkJwl93qR3TBueEWKRgzDIyDXShJK+ZiWoImJTH3wEnR/fkUPznHNaRe80YQRq0CooFqk
	+WPT5KdDvXcg/MhL+wAkXwtMF/ZkrOEUDqGh6BOWWGdoAwX0ADRr1MPkxfh0vc471+Yi04GCGQe
	GDVQDT9phozJJmhcHBZRxMvx+7qhoeycSXtjqVHqtNORPoSe++CyrlJV/PbFxXw/tahSeMrsB83
	4sak3oTa1s0holom4kutHoe+o8o5NPyQshGo3+2KReez9IttOFpXMbDaC/6Fhm3uxSFdF7DnT9r
	uUSCcdYQpCnc9vA0iDwo0eUiNkM2gHORbrvZVJIOtyHFjCSyu7T3ucbtXevkxiyPgl0yRXsk0
X-Received: by 2002:a05:6a00:99b:b0:793:1955:2384 with SMTP id d2e1a72fcca58-7a220ada794mr29166881b3a.17.1761120025192;
        Wed, 22 Oct 2025 01:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVyRz86S4Hw9/gYeNtzxJUUmTcx16JDUBodGshnXBo7XeH/deuGV1Ia/yK2XgOqxc89Wmg0Q==
X-Received: by 2002:a05:6a00:99b:b0:793:1955:2384 with SMTP id d2e1a72fcca58-7a220ada794mr29166840b3a.17.1761120024635;
        Wed, 22 Oct 2025 01:00:24 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm13617531b3a.70.2025.10.22.01.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:00:24 -0700 (PDT)
Message-ID: <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:00:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
To: Klaus Kudielka <klaus.kudielka@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        regressions@lists.linux.dev
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
 <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XRdILNBlp7xUz5FC1_1Us8hcGAec2YNv
X-Proofpoint-GUID: XRdILNBlp7xUz5FC1_1Us8hcGAec2YNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX6mVEHXiUCLJb
 pKzo64mEblScjM7pwp6NBKLOj5/LSNXYViT85yr8GHHGYj5uuMWo2ta3ZkU0XPYeBH12yucK+YK
 w/ntTs2z0Uzskdi3ZmLks0QnGCfbTDY1gt8/Ict1fq+uADRdxh8OfTS9MvNkR4+4C+Y1kgYNczp
 VEQc3qfq1vkjTQp8mB3sJChZ028sJzY0c4OG0pw6n8JrrrEm4JvP1e0qkRs/3UL2ansiHlTgDtT
 eO51ZJW5LkJmb3YAW2yd6GqdWBM9mD9VZIGE3nqeVr0dTOUqW3v5UBlPVD6FFP/78HHevV3h71d
 CQHCj8qQM573PvJZlaP1z98u6B6THfYBG2dOAdNyoqWot8K4dVOSCKmZptdwZJYgrlhpDqhpfJc
 Gd2OzlAyPhJJOi6+bti3TrIXbwEDpA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f88f1a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=PjCq7wsziC7u3JKYlTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_010026_806041_7700FBE2 
X-CRM114-Status: GOOD (  18.97  )
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



On 10/18/2025 9:50 PM, Klaus Kudielka wrote:
> On Fri, 2025-10-17 at 08:57 -0700, Jeff Johnson wrote:
>> On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
>>> Unfortunately, this particular commit completely breaks the ath10k driver in my setup.
>>>
>>>
>>> Hardware:
>>> - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
>>> - Wifi card (output from lspci): Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
>>
>> This issue was previously reported with that particular chipset.
>> This is currently being tracked at:
>> https://bugzilla.kernel.org/show_bug.cgi?id=220671
>>
>> It may be useful to supply your information as a separate record to that bug.
>>
>> /jeff
> 
> Some more observations on that topic with the hardware shown above.
> 
> ath10k_core_start() calls ath10k_wmi_wait_for_service_ready(), and later ath10k_wmi_wait_for_unified_ready().
> 
> The now *unconditional* call to ath10k_hif_send_complete_check() inside ath10k_wmi_wait_for_service_ready()
> makes the later call to ath10k_wmi_wait_for_unified_ready() fail.
> 
> If I call and handle wait_for_completion_timeout() first (as it was before the patch),
> ath10k_hif_send_complete_check() is *not* called, and both ath10k_wmi_wait_for_service_ready() and
> ath10k_wmi_wait_for_unified_ready() succeed. Everything is back to normal.
> 
> Side note:
> ath10k_wmi_wait_for_service_ready() succeeds in both cases with time_left == WMI_SERVICE_READY_TIMEOUT_HZ.
> 
> 
> #regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=220671

Thank you Klaus, can you please try if below diff can fix this regression?

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 7bbda46cfd93..1a981d333b5c 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1256,6 +1256,19 @@ void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int
ce_id)
 }
 EXPORT_SYMBOL(ath10k_ce_per_engine_service);

+void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id)
+{
+       struct ath10k_ce *ce = ath10k_ce_priv(ar);
+       struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
+
+       if (ce_state->recv_cb)
+               ce_state->recv_cb(ce_state);
+
+       if (ce_state->send_cb)
+               ce_state->send_cb(ce_state);
+}
+EXPORT_SYMBOL(ath10k_ce_per_engine_check);
+
 /*
  * Handler for per-engine interrupts on ALL active CEs.
  * This is used in cases where the system is sharing a
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 27367bd64e95..9923530e51eb 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -255,6 +255,7 @@ int ath10k_ce_cancel_send_next(struct ath10k_ce_pipe *ce_state,
 /*==================CE Interrupt Handlers====================*/
 void ath10k_ce_per_engine_service_any(struct ath10k *ar);
 void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int ce_id);
+void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id);
 void ath10k_ce_disable_interrupt(struct ath10k *ar, int ce_id);
 void ath10k_ce_disable_interrupts(struct ath10k *ar);
 void ath10k_ce_enable_interrupt(struct ath10k *ar, int ce_id);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 97b49bf4ad80..ce8e0c2fb975 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1812,7 +1812,7 @@ void ath10k_pci_hif_send_complete_check(struct ath10k *ar, u8 pipe,
                if (resources > (ar_pci->attr[pipe].src_nentries >> 1))
                        return;
        }
-       ath10k_ce_per_engine_service(ar, pipe);
+       ath10k_ce_per_engine_check(ar, pipe);
 }

 static void ath10k_pci_rx_retry_sync(struct ath10k *ar)




