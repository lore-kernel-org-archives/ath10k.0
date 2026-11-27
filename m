Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C6606A31C
	for <ath10k@archiver.kernel.org>; Fri, 27 Nov 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3PxMzBd;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koATYJk3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKYXoQwu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=; b=S3PxMzBdvywK6C
	+xkw5M2yIUPK40UcT46SZZgJZYXqRMl7+JZA/XBM/RNPkKV3RDrbLAc/DKOiW8Qq5+/TpkqGwHnF/
	ZbhZbFvqQFDnjUhEcizaHhhdgYyHyoIdLbEcwGovkbDDeVSvyzPkBZcnVGev1ch38iQKABOJzNt5L
	x5pr60ZOC2oKEVgiyol7y/L2Z257cXL6GE0RC6f/ZUA9o7z0pm5ay4UAIzfCMao/ctQuuGLISuSAa
	gGZoQ7LiLfH45UQ/2ZXjlVApskV/9o0E6Ng57Z/yul+ylT0XUSgr3Ty+M6mkTtU3e8cENjj+XTK0Z
	No0s20MOEjWh2eMhYCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmZ1-0000000ErCX-2zyL;
	Fri, 27 Nov 2026 03:23:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmYy-0000000ErBF-2TXS
	for ath10k@lists.infradead.org;
	Fri, 27 Nov 2026 03:23:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwTNp3865275
	for <ath10k@lists.infradead.org>; Fri, 27 Nov 2026 03:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=; b=koATYJk3/rX/ewj7
	qWLcpwItkqMWctzdXuZ54RuwEHZV9Bgzn0dujW3acefewzngXypbV4VsO9vlwZ05
	zfZnQOp5PpxhZc2++zZXd5hDa+tx7Skwz552Nl4jfsLAae7+hhW2Hl9fX+kXAP5I
	JkNiuDbRsnpGUo4BOEhI39qbOVJFc9Jm9jpmUVf+9nrIMS+qgYVY2rT0lMKyindX
	7ObMCOz2fC3p/WhXYWacVRHQRduszajivkxNVWLq8QRJlTc68enyPC4tIr7hfJJu
	U/HnXgRRtLoobI0b8qSf8sLTYbVs5hrXXIdyokJ7Zb26Ddr3fKAysIm3knhLM8KS
	P7U83A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ryfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 27 Nov 2026 03:23:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso6569599a91.0
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 19:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749830; x=1796354630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=YKYXoQwuSZlxJR7jlzfyJF+p8hI71L9VynnIBueRzHeT4KFFxIBl5L+HkalsxpsyFM
         WtPhWwFQ1O9KFEeK+MXvnKsLqjkVBSM/GyDOiB6x/JMLfRny0jJcmCvT5XCj9tU3vusX
         Ts7czH6GP8ILz7GJeMb16r2Xl679fN1ylXzI5Gsk7D9FuMcBFxdFK9HBHNx3WPgIiG5c
         Di0REol4WltawZ7kuT69jjm2eXtMx8CNYqJvaELMKDEdIvocpf/AFxKxcfugzgCHrUa+
         rSG+L4L26sDLdFYdM/ic94AKlus72AT567kUJNkXK0rbK9pKLzfm3S1WPF26taZ7V9+O
         J3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749830; x=1796354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=GceHZFcZDyygzdfmvl1b8CHD3VjWI9+P+oUnXK1jQtRG7vZIVN/mE1ca0rPIvRM3Cj
         fwVIFmq6mEguvPwiy1j/VYRCYfjJjGeofiEq3a0ljLAVD+eG3jCNQbNB2vbQD7BPGiAD
         e/5hWA+uo6CsdjL4Su9xvAhV1ScOvEkLvEXi051y8eS1QB6MKil2Kcv74pKiyT3mpHKc
         CJVN+Kml74e5jZA0C91/ULJBvgf4nPDBiIgEk4XcE6EhoExsrfk3BvAKP2Zp8V0RAJDI
         O5TZ2LNZU10Pu/oRdADidlYZR3dxSXgMt4z/vtlCVFYVpoiw7xY2mHXOZrD2VOUBcOLG
         Rw4w==
X-Forwarded-Encrypted: i=1; AL+hErEskJTgnBLCuh0AToqBkxxxdWv1y0bGmyRf7PxSsxMJ4DKEwSHpbOBnhkTIy2IleKw8//ZLqdM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9vrrb6tts8Qm6YzyjvUSSOr53wGvVevxSvI6Y4SIGFKFcqQKzf
	CXH9E5B+o+VSyhS4wbxwFNgqiVMR1MHPGrKqhxNhQSMTKE4MDS9FafvIdnrmqCfwPWy4f6htqI+
	Pa+MTa29NdqeX0tTqECE6bXEoV4+pH969Se/htyDvvJLrJNTDbQ0bQ2nCus0LxrpX
X-Gm-Gg: AZFdTZd4SDjfryC1kLnJDuknI0XXrQ8dOoYcBmYl/pOQ4noUUEKWZdyCcbO/kWnIswm
	v2wMCHn2QQV4nIj/QdukxCdnq8BBrzRUldftPVB0nfChMH3Ve7LH+SNfA8m2KP5P5Z31GYCb8N0
	t4XA9gFEvTZueyq0Nule5+/g1XyoZevicF7x/Uo+6esVYHGyuDtck6kFBtvjK8Ed6oGvT03O5AY
	wi+cqsu9rQSNfEz3NljYMJ+9dROirTXPHJex4ERHVGxn900PD/26JXBVGbi5BWma/y7L7n4mufR
	Yx/EAtThACBI23VovQxt0aFrdt8yyv46Wb3oFnpeWNmJLu1iGaX7QYNMvd835JcY3DFuAvYH14N
	HSKWN8i7ocDdgFr4C2B35cor1fjvFi9uMuvph2y37uu62NuVJLMTHGZ7njG7ypIVmqdp3SF8sOO
	rm9DtVAoHeTJrtVbyzhxMSoh+dN1Qse1FIJhkpa3kWHw==
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947670a91.51.1795749830441;
        Thu, 26 Nov 2026 19:23:50 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947647a91.51.1795749829999;
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm38187020a91.11.2026.11.26.19.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Message-ID: <b25a7fa6-de52-4543-829c-b4e1b8cad56d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:23:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
 <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
 <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX5gdh4NfmO1Vh
 aExdsuDok8kzaEDnkRMfu0CcO1r1JlmwrA4SYtdIAeSUvxLZK1sGgdQ7p+OSQqvehp8QKp/mxDV
 Ezwbv0iJMGLiYkmXr0I+Spt5Pn+810A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX3lRswdOaAxaz
 54Cq3CAJjgFue3JYIJIDaD7nvfLQ53JJnIMRlTVmJmkKsU6pW9ham3aq3plOVBeAUqaB8mp8+aw
 meOAfjXawhoTCVir+H6QAoXZ07m8oMFDycFkbh1CbkDw0qjo8M3TaWsGYdE2DlDCi8OBzIdVHs3
 ZS2GlD5TpKANX6lVwWcuh6Zhvq+coOJjZbbOts8f3+H82v5w67t29qd8A3T27YCWQMbnW6eikp8
 i5dljHhH+EGy7nmBHwFjO7kBtuA3CiF+Cif36HeCQWAfe/0R/YZe1wo4NFz83amQVsEz0mTUXud
 IHcavVI3HMfd2MgIyjkNJJ0VhK10p/HvSlO+bco9xDdAmG/exc9c2010jf6zwPdyXYYiSKkBhH/
 B3JDZm1GXt4Snfhb5cDj/GRLfUGuOEEaUfvQmRGQkx6PCfuHGh5sLUjmwNWqfh3mpG3YeN0GAiJ
 8+DeEiQTJXXr1+omWMQ==
X-Proofpoint-ORIG-GUID: MGUO4Whe78Ya85GxaDrXxER5X2LyBjXz
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08f7c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IQv86u3dUjXOA_Ac820A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: MGUO4Whe78Ya85GxaDrXxER5X2LyBjXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_192352_744925_42C8216D 
X-CRM114-Status: GOOD (  17.04  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/27/2026 12:01 AM, Loic Poulain wrote:
> On Thu, Nov 26, 2026 at 9:16 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/20/2026 4:41 PM, Kang Yang wrote:
>>
>>> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>>                ar->state = ATH10K_STATE_ON;
>>>                ieee80211_wake_queues(ar->hw);
>>>
>>> +             /* Cancel the deadline monitor first so it cannot declare the
>>> +              * device wedged after recovery has completed.
>>> +              */
>>> +             cancel_delayed_work_sync(&ar->recovery_check_work);
>>
>> If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
>> has just recovered. The sync cancel only waits for it to finish, after which
>> pending_recovery is cleared while the state stays WEDGED.
>>
>> would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
>> of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
>> run and the check fails, or it is cancelled and can no longer race with the transition to ON.
> 
> Alternatively, disable_delayed_work_sync() could be used, but it needs
> to be balanced.

I need to use a fix that can porting to v5.10 kernel. 
disable_delayed_work_sync() is introduce after v6 kernel.



> 
>>
>>> +
>>>                /* Clear recovery state. */
>>>                complete(&ar->driver_recovery);
>>> -             atomic_set(&ar->fail_cont_count, 0);
>>>                atomic_set(&ar->pending_recovery, 0);
>>>
>>>                if (ar->hw_params.hw_restart_disconnect) {
>>>
>>


