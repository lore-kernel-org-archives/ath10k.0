Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7657606A324
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3uXcdfh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4ojMEOg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYAikzhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=; b=u3uXcdfh2VBbCJ
	ZoTKbJ3N6EXorfH1tfZVkv+FfQDH4/PP5Y+XeovOym30lDXFbf3DXc1gJIw64KviV4eTmd2Ol/H/h
	/4omQRcUf/VFIUj3kYx1rlZAcKs+BUS3GWi3n5BYbKwHjKC6x7qCRzUi7+QAvcf92hha7h2krFH+V
	pZcFP+e1JgCqDBleYA3Z+uxv1FWUp4P8cilxAy2zEgrC64nvGko3pbnwLqDwmeIfnbIFZ6qBichIb
	je7Ob+xGHtGpH2VJOQJNPzPg/G+7fDl7BpGxuCcV9aMFriki19beWpo5HmA2h/t/chVRrj73reDi0
	Dvr0C4JGopT6Xdtt5O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgKT-0000000AuRT-0BBm;
	Fri, 30 Oct 2026 06:43:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgKQ-0000000AuR5-1hKa
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 06:43:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FZd73345081
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 06:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=; b=f4ojMEOg5WleFuPo
	ZIXA6k8eDK+bMrAIgrb2vegZIY95AlgZS6oXORZ0gsUGjzCwqO7ukfSHLXy/++Y2
	URNEexO/ZHxX85vlTQLFuzXd5wG90b8Ro/VASVqVEymPhwK5coPs4apbOjITR2v8
	z+9SOlalOQMzGLu5aglpPYYoqtoT56tUBT7YIFqpAGfDMx5mh3bCZKvafrPqiHeb
	bh4RLAAnb1WZrkOxyxXn67p5Ad2Sim1RuNk5s4LC2JjZPH/+JGQ6pI4W7lz+TCXH
	e2mpeApRC7/NLVCaNs/AMJ3gLYTsfY5sMlO3KkZZ/0eZtAB8qu8/Rz+iMcHnv0xf
	Oi8aXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751j53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 06:43:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso51339685a.3
        for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793342584; x=1793947384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=;
        b=WYAikzhhWMTEj8qUiD6lRDSD2X7GLoiqIXzG1Z8/+lBUb4taOfSMrgahX66dqlXEp8
         RnSdSbfEwT4cSZKWXYtg2KweR8s/vVlwbvep7N/xtfR1iD/ZtmLWVlxh5DwsvDNdT/r8
         cNhOqjKmn3//biuuwnqNaC3zghUrdl88TPIJL9wmesxl4DDkq23vjQN4mRXBAbnQVNm/
         TqGfz6bbYRFU49LDXkbRWgOroHzdqqFb8+AcQSPz+l5lSCsm7WcpEnAtqtIxKFG6BPq3
         1o+Vqwk2Y4/zFI7BkAzkMtPxqx112gvpnYylp+I+aHSdgPyxBnw55qMCTgdXRrtcVrPB
         EfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342584; x=1793947384;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=;
        b=GLxxGizJQQB2y3AXNpN9pnUmHZXUiK8qNUm4UBuIEVjGpKrUnr5Gt0CQJvIH2AuV3a
         TVQLs/cL8lErA560+xS2Oul8fzTC1jlVxzNi/+2C5zhEPblcBgv3cs+8V4HQULMjkNU4
         AoLAnUjYV6vahtfO5kCdp3XDhRRUUpVS2D7wiD4VzoLHdeXZkfv/j0ocOHuIq+xGAYK0
         0GBiKij7Sr+TV2m8E+eCsZsx0FPgSSkqoB/+y5uRvsxKs4Serej45I/Wdr4zoQMx5Ozd
         Fx88NUO55/81lI/vOkXsF9GXXImr7GosZN4hruCoTIgyzGBc1uSCbZotmfQVb3qRkU3i
         8DGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr4kEodZlYHAb+dgs3LKBXBrAHDrkFhL0ZmxQBrMEkK18xZqf+Qwl+xW437fnBroJBOYUuYF4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5RdGUFpKTVrlkSie4UCvBRCoTxtQ0/BYktpOVbmitFjoeEaI8
	OdIOpQgZcgn25NPYX30ntKd9R9OypkssIpKKJYjDOox76wI6WWdxlNF9jehy2ezATSmJ6g7tuF0
	Lq1EidTueDMK+RutXSwZVXz+wFQOQSJihhYtWMJaqovKc6YQOHrGwt6Rw8IRkWug+
X-Gm-Gg: AYBFou2N4oXwqJixUg81rmW3fNDEOqSwaZYPl/AI172oDlKNSEsEunyQrXhn6FJq/JZ
	ZR/U+B/BOGH3qkiuqBJ8+2mZnwhHWySc2aMiN/SCW4+sKu/7lzXkGsOfSmQA6WttYm2eU731+H8
	Fc2C0kh0cIgfu8H3hKtgK064Ha8SOig2IhCnesjRDoauYgoAcj2q9uo2nRQFAa0UUt32rtzAS9i
	N4ckkHLOHi4qujV8XVQv9AI1GTNJteeCh8fmWbL69S9x9LRYF/ci9LbUpyvX5a4wj2XRo+53sQm
	LFtSLnaqtSfOCb1NR7Qzj51WIyk+uzIKaPlIgqQ4hzBugwUAXBglRYm3AvUxGApXlygFdTf1K/Z
	InKRNmukdki9b5XqGbFCAWybvL6fhHTZYQb7Lq6pL/gOHwKymyRTWvbjZvolag0R9qigg2DCQLN
	w=
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr235250585a.12.1793342584233;
        Thu, 29 Oct 2026 23:43:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr235248185a.12.1793342583704;
        Thu, 29 Oct 2026 23:43:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d4f9sm1495288f8f.2.2026.10.29.23.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:43:02 -0700 (PDT)
Message-ID: <43ce3985-b1ff-4661-a670-dc10fe32c99d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:43:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
 <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ABlx50IsmgzV6ZVPSeuUX2eCPaVtgxv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNiBTYWx0ZWRfX08/r+5q9ntnZ
 0fz0kNyA6aytilTXNIEywlE4Nmb47E0BZtecSrlqymZMt9Jofy74YhBoMXej3zMY5JDtfr56mtj
 Ype+E4fhTOnRuzhw+GcZEHiKKa0/U0av29+djsTPOXJsB8rniuyJi5nDg8+J3ATZl1vOgP9xq/t
 xYqIyEnSqP2ShHt0zUeFw71c8AtJ2fAakw80iqcVFFBKJkH+KbDRcK5L0VOfTl5Qz3p359gZJEh
 wPf1AiW3+oPATOGP+gNwV2bBkstZA0SxArMAG9gV5B2TCxx4lpMWcox4/nvLdShZvZnQqqKY4Vr
 eToj6YxGdLpd/oAmHNm5ETY6qHEG2W9MDMb34mVKOd+IEH7CkwJNd7SIbc8Wj0iX2UmXpHtwZV+
 lAL0MFEbqcyDj6gdFd2D97qjFovoJU9y1F2yluMMYRZusTwc52tuk3681xrRUF51Zhng1vCW6QP
 07gxbPfL5R4DUKM4Tvw==
X-Proofpoint-ORIG-GUID: ABlx50IsmgzV6ZVPSeuUX2eCPaVtgxv3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNiBTYWx0ZWRfX16CKCyj1OP7A
 BqwwnGx4Pcau2vgZG7T8qe/NEy+DX0odOnlAXt0dua5lHTiBQPoXcIFPQGoLtt0Tx1RkANaWDsn
 7Z88yjSODdwfyAlXtGXfYHlUBwgYFa8=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae43c79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=-v5LvTCY6n3Eoa7ktXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_234306_446235_9E373C9C 
X-CRM114-Status: GOOD (  11.48  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 20:54, Jeff Johnson wrote:
> On 10/29/2026 4:11 AM, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
>> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
>> Dropping them allows to remove bunch of other code referenced purely by
>> these ararys.
> 
> s/ararys/arrays/
> 
> this removes a lot of stuff, by review agent says there is more that can be
> removed...
> 
>   qmi_wlfw_v01.c
>   - static const … wlfw_mem_seg_s_v01_ei[] — line 188
>   - static const … wlfw_mem_seg_resp_s_v01_ei[] — line 229
> 
>   qmi_wlfw_v01.h (removable once the two .c arrays above are gone)
>   - struct wlfw_mem_seg_s_v01 — line 161
>   - struct wlfw_mem_seg_resp_s_v01 — line 168

I got LKP reports for these too.

> 
>   qmi_wlfw_v01.h — now-orphaned size constants (0 refs)
>   - #define QMI_WLFW_MAX_NUM_MEM_SEG_V01 — line 64
>   - #define QMI_WLFW_FUNCTION_NAME_LEN_V01 — line 67
>   - #define QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01 — line 70
>   - #define QMI_WLFW_MAC_ADDR_SIZE_V01 — line 76


Ack

Best regards,
Krzysztof

