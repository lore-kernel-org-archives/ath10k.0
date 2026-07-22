Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0038C4453E
	for <ath10k@archiver.kernel.org>; Wed, 22 Jul 2026 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=3OSKbt1PqT52xvpY3ZlTB5aJmH
	yoFcm1c3serpavdg2WD40plnyITNeuQUQXAzmoiag6SEJTqnYZbIKV91foTRe3rERv5aDFyY+xXp9
	RL3MJlV6upsEwDqeZvdNEN4YINtBlChHvdr/J0OuO1nyBJclORRC3vSgbfDCgxAJK9aINVPrYLir/
	6YhmNPWd3TBFELnrkdgptp7KTYyoFzSuQ0LtYKA6XyxjXkPDF08M0iFsju4PY3z79lUFW+3P0sqSR
	hyH8t0d8L0SVZx0K7AUQ+lhDoQx+AYbbC15ynD3DIMM++kGPk0i/5pd8w2xT7h1HXmGFDYOW4IYe5
	l3DmvahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEZ-0000000CG5l-4Bvr;
	Wed, 22 Jul 2026 15:51:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEW-0000000CG3b-1ATn
	for ath10k@lists.infradead.org;
	Wed, 22 Jul 2026 15:51:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXnvB931069
	for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=UXD4in6lEx65asPm
	4IOzpayhTLQ0PJAfzip4L2A1hYHhdMy+4AXS34TJkQr1ptkgob8lqPuPFd0IBa0G
	Awf0peLgEYF9hncGxu8Tx+vggFPcE7rK8w6eYxthHV2+vQFPfREC9L6o4GlUmUne
	Wy6aCMkCXk8c8XEjf6D4wasmul7r4duMeFmpJPZgv6DyLQPxi92eUcddLrL1+ZHs
	rJ8NkgleV8u76dlkzHo4ko4ubT2uD2F8mRjp2+Kik5eKBQtu0VguAGVxlW7rbKVj
	1wssL+hD0alBP8JS5A40Z0YkERo94/7ugJa57xOr5GgEAvT5b+skLXT/9zBto2cn
	FnySQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju229p2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so8955766a12.1
        for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784735503; x=1785340303; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=LNsvCRWnqkLlzoABupysrSQXl0O+9tN1gQgOSpV4opYj7AEkS43iLXP2Zzl6POz640
         rBWIRntbLX/UR/sCxTbjJ+3wIuT+53PUQafk2+I6hQx+LEPpMz3pK3a5d+/nIaJaG0ot
         AclYlVbqXo28fa91T2zC9K0rgk2LLP94tdYbiN7csXuI2E4zMZHs6ikUSIWIiSEvBrqO
         Zs8ElcmZT9MZDFvNrBx424mPmSzJwcTyTSCTQkszbHuT72l9Z2kMHsxd8oVcc+IZRlPO
         qh+VKaOK0+5LOhrbw6DFC702z4HFmw3ojOLE4Evnr/o9DMNTM5zK++8D06VOGSpzc0Zc
         T3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784735503; x=1785340303;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=R/PZVD7DP51U3pSC2o0P0guj4Y97no+hZ+IDr14bb4zj1nqRGi6KDDUVSxqun9MF39
         Dc+gIO/IyMnWO7erCBNF/j1p4aS4CNoX+//DjR9rI8xKlVQctYc8AD2dR3pPJDDMxBOd
         BoM96Fh3Bbtpz201R6obRP+4spBH//06NpC4qtx/sgD+VU9qxOiVPTUlSTMv953qMwa4
         09LJd3xH4JXZ68z79o1XPoekSJzSORhYtxHGAT4JvH8zoG49Nk9M1LSn8goGr+HBwLKf
         LNBBZZ929T2BBzCxqO1CXnVbxym6mVdnCZ/ys+OgHkI1ew6Z21RJbuCP1SunpIphhVfW
         F//A==
X-Gm-Message-State: AOJu0YwbWVe8BqIRYDvbfZRt70XPq9o/Bzy/n7nGEMrf6TZydnU35xcA
	r2Lsr3Op5nfRtLA5BwugOTYbyw7whz4BSghoOroJ+byhpIWUIljPWU5LMm8zXWldwdHW0vU2dKU
	6q8WAZ2HwpZJvk5Wcin8mZbNorToX9fvgAcJCo5qBcywZZmGy5IxU5FvLFe3I2iOx
X-Gm-Gg: AR+sD13uhMVOPusHufhWl+zrB2KnbMPqUElHEOMidvr6awZ4cpHYbRi/6Qv63oMz1iQ
	emVk/VDFbVZKeyap4UqMR2sLLimuN7egnVjHG2HAnMLdRBzNaaF38/kE3k+lI93+P6OFlSv//pD
	zTC4jBcLXEw6aRe3llHtQl/WXRvVJsMax0e5Z9yRQ+Z5aTqcHtsYTd1t1iK71DrQlNZoxXSEBBe
	Sr7qAmrrsqwC6jUvhEdDUv64DI27W+K+tHtv7feo9ZKiw2kagZIPh8iBlOC6RfaqwBzAjmC9yD6
	Kdzpt5sK3+U9Hw9mxz/QP+09OXUqzD9Ek9qISFeJgHSr8+VEAHW/O/L1WG7XtLO5SjHKSfohAW3
	YNbez8Dylfag/WLqRVgskCrmccipoktR+33Fbq4Gsj94tEis5KQbva6gy/FbA
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018433637.1.1784735502576;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018400637.1.1784735502119;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm10913111eec.25.2026.07.22.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 08:51:41 -0700 (PDT)
Message-ID: <0833afbd-4a25-4e7d-8e77-ab9fac9d36cf@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:51:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20260721
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
 <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60e70f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=XsDMgvtJpxJmlFumrWkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ANiRQ9h515eH72Lla2N4d7uc-n2RiPs4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfX2IqPXhe7ZQgk
 WYucjJlHdPU3Hedu8w0scoWYdRsoyamWyY+m65SevYYiXOEYwXOjtyJ6/ugqrZRqJ9OrQvLVCCU
 GSLVhtUm9eJe06ucDdLw++oWXys3daQ=
X-Proofpoint-ORIG-GUID: ANiRQ9h515eH72Lla2N4d7uc-n2RiPs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfX9Anli5R7PD/I
 o1NC5jU4rmzxHmQAuAl103s089CBWxksMq28Bzn/BIHIRsfwFXIo2AuGKGe7kGSg85VemYV6URw
 CjRoGbH6yI5v8gf7N+LGRZKXSok++zogJBh/zU0o91Q0Sdontz0H3ObGMV95cHF7OW8IK3Q7k64
 /mR6B6sUdAZWGkjcpNz3IzpeQy+4NaLY6Goqs7XdFphgZ0HIY9sSw0QsJM7+dADC3MKWqc3EaZA
 ktwkT4atlQDmC4lmpMDB6WiY9FYWnVpy5BEjQO7u1k/qowltPfcBoQiDUFOAEuqFCZx6Z4pJb1c
 rNGS2vNj8rCZI2+PIPddeX2PP5MyY2XoRuehfRSeG58zokdUVMr90aS8BGk1fvVjJYGJ3xy7bhL
 muA1dGNKj/mPat0aQ+fkdQ8KpoB1GSr74wbhWV9Ap75epdiWiGT1x37I9n3EzPC3psZbXTcpFep
 SrhaQbZaErcm/KkGdog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085144_348284_FEA6C6AA 
X-CRM114-Status: GOOD (  17.98  )
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

On 7/22/2026 7:08 AM, Johannes Berg wrote:
> On Tue, 2026-07-21 at 16:46 -0700, Jeff Johnson wrote:
>>
>> ----------------------------------------------------------------
>>
>> NOTE TO UPSTREAM MAINTAINERS
>> This PR includes the merge of an immutable branch from the qcom tree
>> https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-ty@kernel.org/
> 
> That's annoying, it added a kernel-doc warning that now shows up on our
> output... I guess we need to ignore that.
> 
>> New warnings added:
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Per-file breakdown:
>>      2 drivers/firmware/qcom/qcom_scm.c

:(

I run kernel-doc on the patches I process, but since I didn't directly process
that series I didn't see it.

Bjorn/Sumit: looks like there are a lot of those that need cleaning up...
% scripts/kernel-doc -Wall -Werror -none drivers/firmware/qcom/qcom_scm.c
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
26 warnings as errors

> 
> I also get two fixes tag reports:
> 
>> Commit: b127f79a4933 ("wifi: ath12k: Correctly copy the hint BSSID in WMI scan request")
>> 	Fixes tag: Fixes: f40abb4788a2 ("ath12k: New driver for Qualcomm 11be hw family")
>> 	Has these problem(s):
>> 		- Target SHA1 does not exist
>> Commit: fde37c064641 ("wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param")
>> 	Fixes tag: Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
>> 	Has these problem(s):
>> 		- empty lines surround the Fixes tag
> 
> Note that the first of those ... the commit exists, but not in the right
> tree. It's in some ath12k-bringup-start tag in your tree, but not in
> mainline, got a different sha1 there. So checking locally is confusing.

Let me rewrite those and send another PR

> 
> johannes


