Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1388DFF885A
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=kn3x1r2tMeUluSlNJOAcYfPTgR
	ejrH0Hq+l/+z8wiiTnGJdfv7qrAhlI2HjfTl9LfC/wcscwPnmybHbrhFvIi+MhGFEl0eiRkUfTgGm
	HwiN5BWK0OiYZ9drwCVCmPGi3QLOLb+oj35Y03skta/wbwVnSB0qaJaJ9y0z1NCIYJFyhIq6s7Yuy
	IVrBPs7Lm/+HbAwKUisReBHFoo3rmx9GT0vIToF1jGnDJgI2fRnn5gPFmUgKcLQ/0+6h6sV/IbMTp
	B/TE5ORYHWAb2U0WHm49uM5U5JqiZhLQike2t4gU23UZ4rT+yPuGkIYy9iTMdzRjC4h1+q/QZgStw
	mbZc1eOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlTc-00000001xZs-3Vq1;
	Tue, 28 Apr 2026 16:40:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlTa-00000001xY9-0asL
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 16:40:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsYsD4070669
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=f7SzQjo2A6gvPSWl
	4RSvhk1zwSXT5U1plZ2fJ5UTix3BYVLRUWvlmwud43vB0Z+JYf/OqNXL/5AbOrrG
	8mTZis37OGV2svwSeXhojxzhKhDvnGF3b0NiEXfvTbiVqOxmmpWe0YZeJUfcimO2
	n40R+UEiqXUZsBVkMiItGY+y6VBrQ/XMMw9sIwJ7f8R4Fx0xZhUcwQ9k0dURvFK0
	GOw8air9IRe8GaiBlW3fY3MeOVtlGFz5MVK/HPDRUIrGLlxSkYc/7l2YnYrMRUU2
	KF5YlhvY6ijYL26viLxaEbmRPQepuH9rTNJD1l7hW2aLWwIXa0ExsIIEXCCL58Lr
	gpo/pw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhj1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 16:39:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d93379001eso28039677eec.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394396; x=1777999196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=jrFGGzICK+eaG8OHrSAFGGGqHfPKv2xFcF6OcHkwtFL7nv6GA8wh+sjPBeJOsdeToi
         RmNV7LhOk5yO9wSQGvUotfvPj4TKmaGpNERwuGT4QhT8QAJvEvL+fHDbFsLG7sOOkZHp
         4SyQDC4GdtCd69dsAtJAS64bapVcb7/XIlwFwLhQeyzQjTqYTFmh2hNlUqC76o+YpnGm
         yfRGjo17QsW+HX+knc0CQEIf8ihrlJMOhfH0QRV4JwBo11/b+vcsGpFZ2GsUug8+IZqx
         jAAEwED+H3kaE+G94gcU7ZbhGmRgv+58IQGSRirIrJBo5AcO57gNAXjf/2pdz1kAI2K0
         tZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394396; x=1777999196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=I+7u0oTRrpIf18zxORbBecN3fvTKt43AZlHoZECAyFz5miuK4ecDidP5YsuvzlctOT
         rjuXAsjPQ3VOa+4B+tP3PKSh6blTA4swd9MXJFZayuv4JvA2rbg6s7xSJopJnfjl7S2u
         Cay/dPTqEhQdNI0OM9H4Ru6UcX4ShrthnWx4NLV88Tg1UhoBuKt6CZiUhA4/GFNm8kv8
         6kaBTZ96YwtJDAcHc6x3qXGHIlaHmGbx/yUbkoMa32rZ4huqucQv3TNpZBSgiT/QlQTk
         VSS+7Wp2QIG0yX2s4mRYHAWcl4EUzJZg+2EjqPjGUdSRjOaXcDLJJ7oSZw6CPTLXqRGu
         d9ow==
X-Forwarded-Encrypted: i=1; AFNElJ/hfYBw3HEjo0fxYioj9pUPjj2sbjM8y5UMKrYTcy+hrtGih1HtGtAzffe6V6AnJkYPXCriZdE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBi7fdu29oYRsyIXMeaeE7pfHX8OwXZGm5gwQoSYTC9JSMk1HY
	HAiF+jaC+FcEmakf9tOLgkXlRk3TRQk+GKxaLxL865J/S5j14itwPmORxRbhacAx9WEPYg6UhU2
	pXr+Uw8MsyP9Q2FP2bLpw6+4iA9FFzIqWn2IkeKzXPoNN/h61UsdtM8JE1X8KmwFV
X-Gm-Gg: AeBDieuDCpzIlmsKHHY8CQmRCpRPqgyVQ+iUfFmEEghVMFNP4OuykMkpm8Xv79J4K/2
	bEwJXZ6nOUKlpxrU0knmy73I1qZ4jY9LNDE/kPSLbIYFi6srA6Fqr511HNpEJTXtb4wOUWdVU6t
	IqA5B4LtT4hGrC/bsj631JxVjKAmqpFJmN5tuUhQwjgSMexv9LZzCZXpbDeT73CvIiolf6sr1Ej
	N16dZzyew9rHLbqMqx0Z6MEuBxkxxNGprmCEDL9GjzkYzUG3sfzKwOdMz3eKczEQdf2pZkiYo/E
	NoQwYeTUEN6VnA/Eu9D4xFenTKt0/N8b8APJWwucSxtvISSv1GqQievfiG6yPkHAGsaj50EK6vv
	p3gSL45b961kWMb5mi6gJnwz/eUwBk5qBwpZCSY4Wa3rhlvRv+NtjhFiOqSkzvWu4L+3CrVdjih
	OwLK1TwCqxKbX88Nys0Pqpx0bP
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787706eec.4.1777394395806;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787668eec.4.1777394395038;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce878sm2622054eec.16.2026.04.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Message-ID: <e8c37614-354f-40d3-be3c-983f45e5bb3f@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
 <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX2YhS9ASvKSyf
 YCUuExT4qFcVLUFZFf9AH7osVfDxtR80SwEWkbXIQwRoXr/jriC0ZprDUQds5Yj8ObVrUcrbEuO
 /s+xH/roaPUtRXigccXtPm38Vuw5sAuzOrcOZL7ihiOaPr+VXb8K+SYrYkHAXOrSgr8Sl9C0CDr
 Dye+t/3Xum5iBdQZA8EqD9CARqHesh2Hak+sk+OWPJuqYUPfyHYQPjNdohbO9T9yzRK24+UlzwT
 mFqhnrB7HU6dTrwPemIifi4YDlc62vQW7J+aISBJA1OA1l29n7T5YBynjl3wH8H+mdarhkwVfQH
 +SRw0yG1bAGHpMP0bZnEgVANWxSRMnrwqvb5FjWLtniEg8zgugswXKIdrqmareLFsDVi+g9EuQw
 hRyU7rSNeGu3zmYa+UOs1M2n8iycS8s5E38vxRPPir8sruitMSJlWJdbadC0qPjdqveRhP+DtD+
 vfwdKxwhre4zCZ2zXtg==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0e2dc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yneryZK0HH5dXzgVxAEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: F_wlHjlAFok3HRZ0iLgGMbAO1ovqsyAl
X-Proofpoint-ORIG-GUID: F_wlHjlAFok3HRZ0iLgGMbAO1ovqsyAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_093958_294916_77C8A34C 
X-CRM114-Status: GOOD (  13.16  )
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

On 3/19/2026 7:26 AM, Jeff Johnson wrote:
> On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Bjorn,
> Feel free to take this through your tree since I don't think it will conflict
> with anything in mine and it will take time for the definition to propagate
> back to my tree via the normal workflow (which I would prefer over merging the
> immutable branch).
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Now NAK...

The definitions have now propagated back to my tree, so I'll now take this
patch through my tree.

/jeff

