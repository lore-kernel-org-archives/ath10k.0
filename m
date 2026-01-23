Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68515D77899
	for <ath10k@archiver.kernel.org>; Fri, 23 Jan 2026 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ByX8t5DOEZeBqvSgYjGH9zeJDq9CCU8Sa/IMepH+e4=; b=eoBVkrpeQjXack4tLL0A7LpZxk
	rilgUCxBFiQbeQQXP39d7MFzzDAHaOy7LVao7HyWm6U6+IGzr23qOIBe1SGa9h+d05Bmm/HmzMukJ
	nNoJfZsp4scWtGOeDw0mHSD2UYR0EhcJhV9o4tEiE8oKiTghErjkjV6SOaFRb16OVXDG+lEP8p5Ij
	Gsi1B4Mn/gOUfI+qLE1WMUrRTo5M2Bj+Jvu3CjqCiuSA0WhM4a8i45CNSOHUl6OE5fWneJ+5XZZrr
	6kVYDo1K97RMH/uuMJEIjbd5HEuDDa28zimIMZvjESWCTqLwQgnaYuAqhO44VYmmYl+dYmjwAoR2w
	88+i0kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL8C-00000009IWb-3geY;
	Fri, 23 Jan 2026 17:39:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL8A-00000009IVQ-1gDz
	for ath10k@lists.infradead.org;
	Fri, 23 Jan 2026 17:39:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NF8i4j1267935
	for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 17:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ByX8t5DOEZeBqvSgYjGH9zeJDq9CCU8Sa/IMepH+e4=; b=KYQgRrRsaNdqZnKo
	9ApFejkSKbbaSx5mMtG5DXqBXlVtGvobuFgRAItmo0XL5zaksRWsUJz3mErPPwKN
	Ay71B0JRifpde4lt4DFdsWN/0qJILh2xZwedO1YwOlm81MVlCd1mnNxecyok7rw6
	t4LNA1AxMEUoqk7TN2DlNQNoONXYAqaFa59/8yC8j3dSgecDYSfasQ5a/IdA5W7S
	jCOGWZmSOuyCVsd0dD1CIIZtvbugPUAnNhk0a/sKCQjgVEcPHtsY4eX8U7+VVw1L
	K7G0qScAfFKQHta4kPqAZfxUoRQhHfH4P8nesmPLxDNlNGQnRGerh7lF7L+VN2fu
	U7VyPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv4v9a094-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 17:39:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b72b6fc371so6101756eec.0
        for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769189973; x=1769794773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ByX8t5DOEZeBqvSgYjGH9zeJDq9CCU8Sa/IMepH+e4=;
        b=X9717c0EBFtw6vvF8PEu+r+NHIyVQ1ZNEMSNfutfCOWJtAagSr9eaM+4raeClx+k4P
         O/tK/cNozBF+YM9TirlYXpxltv5cCwz/l+lYgDcKHllRzvbrFhNAanraS0TbLc2jnGOw
         KjkYhvzhF7FK9MxPWZIdt6xvEK3D6JkWbTK2EltKE+HfPwm7afAEwwFoNKZ2EvoL5RA5
         jIPUi73+6aaQO5cLGXp8tt1o37lwGrv8/tz8+vuyX15EI2S30fbY01aUwqclwqfavAOj
         Ukl21VZdtzmgGWetFwRd7KPU3smjq4ZihERfiUcHvjnBuxjFWI5VR/2YbhGddozrOber
         9G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189973; x=1769794773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ByX8t5DOEZeBqvSgYjGH9zeJDq9CCU8Sa/IMepH+e4=;
        b=JYl6O1YLBHOyi29QLng3lpTA2GZEMfclTl4lhUjoAr6tOCR32DTjvaDKE5nAa0yFtt
         hvJyrA0hOn+DUdVqp3fsr4xoYxo7tRq5hCByP0bhuch0ioMJHgC/Ufc/tpgodyNBwNf+
         3Qa8JBwlD6vSkAhZxoOx0He1ff223RZzXz+U0/vpNTYQsCK9KnTEnHMccYt0H+fVYP8x
         /IAZ2MOWC+QOzaObpfrkNp6nqT4qzYdstMtLKDkV+bvtQdBaK0plWQMC6CDyYTsRUdqq
         Z3SG59TlQpj/tpHkQjE+x9HGHUr0Cxtvk6PdMUOZxX463oc4hgg20NhtTHed8IOZFvsP
         d8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV/CPol1wgylgSp+m5ZMVteYfngbpebsA4Co9fNEeKA/8Zj4+JuiPFr2kPpkndOoAxcXDfKAo8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDFTyv1lK1W8aJKRk2EynqECwKMnLIiTHy4bfqJEuYBURZF91t
	1X/8nysFjm4yx02cBqgMsIG/iNonKa7NS0lCpUrWE0zScOT3jrZtdHP0hTr2Q87rwSmuXv/6r/l
	Y4wuO+t6gLx4ANniOOooJ5W6xGTFYKud2eEBm1GC+rym9h7wM8cj/GmMy/yhyFW/k
X-Gm-Gg: AZuq6aK37vg5rTTKUsGED2VL1jXukjOW3wtBPooE9rEcmBKy4Xrsvai2CuRAgi4KtDF
	przE8OZ58kMs7/MYVSl9suhYSd8n8KN3fVNgYPBqUZsc95iRgIrm8649wO5kfaCk8W7JerqmbP2
	IwH4QyeIdgKFPbx6PyRv9EIqRJZ3ebZ4FjGQ3mF94fF9FJ/03mNw1tL93Jd0orxV0Z4c7f3BH8i
	VTyagzV6KAvqJfC5i6Fj9njlEzg5t45qZJT/GZKq8Rk6xWoL3UikA9DdfTayHLnCFOnw8Z+kFQM
	gmaiJFVyi8jcKQ3YGBvGKzEWbIh+p57KrP8YI/0ZisEtfp39+IS2XTYcJImR5IzUx8PVf06/rhO
	KPutNcB2fJK0asHtAstvCI//AyWwJNvsPmzHV8vlQ1XOPjVjInMiLtFRx+iYUyA85/LKnIRxVlk
	/G
X-Received: by 2002:a05:7301:1697:b0:2ac:14e1:c67f with SMTP id 5a478bee46e88-2b739998979mr1464274eec.10.1769189972926;
        Fri, 23 Jan 2026 09:39:32 -0800 (PST)
X-Received: by 2002:a05:7301:1697:b0:2ac:14e1:c67f with SMTP id 5a478bee46e88-2b739998979mr1464263eec.10.1769189972427;
        Fri, 23 Jan 2026 09:39:32 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa03ecasm3765297eec.27.2026.01.23.09.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 09:39:31 -0800 (PST)
Message-ID: <59dcb7dd-11fe-445f-a5af-6d46768203ce@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:39:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: fix lock protection in
 ath10k_wmi_event_peer_sta_ps_state_chg()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260123160244.262225-1-n7l8m4@u.northwestern.edu>
 <d42a139e-7e8c-4516-ae4f-5da419a3191e@oss.qualcomm.com>
 <CAMFT1=b1fCiXFbMpo6+LJzbFkbLBWevcwiP=EP+hWX1FbRAEng@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAMFT1=b1fCiXFbMpo6+LJzbFkbLBWevcwiP=EP+hWX1FbRAEng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q8UBIiQvFkqrBDbvqhu71vSXKjoEYhOp
X-Proofpoint-ORIG-GUID: Q8UBIiQvFkqrBDbvqhu71vSXKjoEYhOp
X-Authority-Analysis: v=2.4 cv=H7TWAuYi c=1 sm=1 tr=0 ts=6973b255 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=h4soWA5Jhnv_6aMFX8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Cr3pM4QKBJ0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzMiBTYWx0ZWRfXxgRgo0D2J8M6
 nzjzoU0S0B1NHXcCkqb/W7mz4UKMlVXieBGPbBTC2Kn+MQJ32JBLmWvg73cC5A275ynnD1vKtMY
 CcF2l6Qbiymtoj97MMKpvSFLwWVD+RvyqnPz4nrNlJgVNajRx4N4FbMzXc5h7GTXA9sjiWiltQd
 ArMMhh5FwJUbkuL+gxjxxmgCM7YD/FjePAFfw9VOBvBjpRtVvGpbgdIycTqiIJRN3vfo/wLD8uw
 NXv8Qzz8Mtq+SrocKJDRfXQczUYeH76QdtbfX73QsBwUhO7yVi/5DMHKjrOX6dUZDpbaB6DakFE
 DuNw1SdEZIMLv0F30MwFWHldYOOqeRG4EwcbBpl0IvVTdgZEUvk4hPZv/f62eMpuGr02PynvhXf
 jURLSStxt3QTlZ4p4Wg/CNpCndVTl3kuLGUNu+JZ4miJoNyskQuFAc3JuFKo/FxVYv88njMq0+0
 u6GeKdQH+L7TNynuCgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_093934_467021_54389519 
X-CRM114-Status: GOOD (  10.22  )
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

On 1/23/2026 9:34 AM, Ziyi Guo wrote:
> Hi Jeff, 
> 
> Thanks for the review. I will adopt the second approach: remove the |
> lockdep_assert_held()| and add the |spin_lock_bh()| protection.
> 
> I will send a v2 patch shortly. 
> 
> Best regards, 
> Ziyi

Please follow linux kernel e-mail etiquette:
Don't top post
Don't send HTML e-mail.

https://subspace.kernel.org/etiquette.html


