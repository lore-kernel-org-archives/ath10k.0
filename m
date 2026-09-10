Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF3C79FBF
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alYzCiYs0Ctw279xxqhDpjSr+4DgUsPddUvgJImzbpc=; b=DrT0jgaSQ1IlTkcfbqnxZAPgd5
	4o0yoeAQGroBZiHFSFndFEbPuWXMpEo+6MfboDmToHZOEo104CW66RNIQ7aftY9Cq3izDwrlhHVWH
	qiiPAL6N5kEVzcFV5ksJ8Sm8FVCzaYZwIcPhnCvfjQ1KIScwDYc2miTNwC6vfEYlW+ulniDHsDPw9
	xgOoJZF+Pow7OrgObVHcz4gDG/1A754FKjkqmxNmoR15ou1FrhLLcK/FhD6/HSbGnbCZEW5X1tbfi
	Q0HrYgvoQmxPk1Eaq6/j+R4PrvW0DCERH3A6Jm28nyWwCDL1mmmt4WS2lCBOjZ8MWUwRdbcm6pnM1
	h5202jSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gfp-0000000En17-0fFP;
	Thu, 10 Sep 2026 15:26:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gfk-0000000En0X-2es5
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 15:26:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4Wrs107100
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 15:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alYzCiYs0Ctw279xxqhDpjSr+4DgUsPddUvgJImzbpc=; b=PNfXh8EsaIOGTV/+
	x03hnk29yHwt1ZmR/KyI3uQPw6pHf5bqHpmI6wH6pIqz0Zsc5jOFYxoBCtbUqtm0
	Oil1Z9AvlEoeNzUYB7Cj6s/60lI6swO+b1JCxw1Eds/LTXjiLBoQ5S/RcQjq2v2T
	dXrc9HocIsDRZvznWxUaO6WMXn1XI8mSkIpwoZNv+tVAcTKQBJeahJpDq6r15SBX
	mXbZv4zmFewls08StU7n2Z94OB2IV/Zu7jcSt074AsSeNH+eOGIjixjEoRw4hzIi
	piSwIOEw2TRs2sO28AWz/tf4uP96as5ZqLLRhCNPoKIMPwCVo30QLN6QmukpYakO
	TsF2cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8sqxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 15:26:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3070125a91.2
        for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789054003; x=1789658803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=alYzCiYs0Ctw279xxqhDpjSr+4DgUsPddUvgJImzbpc=;
        b=BLIISL+KK9GdVXJYQZ+MHkboxxmROzeQJypvFJxYg9BMBEATGRBC2f/1nb+makDLht
         D45zKefJK7x+8ua1oPEq55eMSkU9Fhsqg04wB+ytMdVRF2CKVgQqXq7kVvH2vjks5YAj
         y50uxSCQmzUWxr16wtK2RDo34i1/aIZOyfPK+Gtj4aAIy1J96gJG3oibx8bjE3YVUTgS
         CZK+LAMfIXMq3/6RVb9N2eniPp0vKUmNz9EHsIvyCA7rL65ryd4bqzkIprfbn7LW5+ee
         nNn6C+tpyACt4hr8lRpJ6+XyIH7fh/vENCJDRr/1NhaDJmeDGgy6d2496JPshDi5MIEk
         IdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054003; x=1789658803;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alYzCiYs0Ctw279xxqhDpjSr+4DgUsPddUvgJImzbpc=;
        b=U2KPZIbfA7YQ3GZHlvpnJOzcEDuC2uosyhjM2lV5wz6Ait48Fr1IdimfTgPczjj4Jo
         EPl6f+47/TRw8D+o0GdI4CW/JPnsJL2/Fy6agfjwvq24/CihMd9yBJIb9/gXN3m8HbQV
         MqKWTnLBDIWk5QsmNISNLJZ9OlfIM1oKX5NL6f4FrvhJNtyBEjL/BNFwXH9TA202Vm9q
         XHrxc6BF4KPATpXrhusHODoAER1C2R/y8Usc6/69SZAfKhI0xgVHOueS4FG1N7E4Xj8F
         3VOUCCpbgo8KomDp3+pyn7+n7XpfJGK3C225TSLWSmSB6UkIv73jEjNtoKwTpl8DlrRj
         NC9g==
X-Forwarded-Encrypted: i=1; AKwUvBz60X/GB7BMxv0MTtNJzYg9nSwaTAvL368BFU5kUkL/HVqx2iwew4OKfwV72zK72LYVvle09Xs=@lists.infradead.org
X-Gm-Message-State: AFuF++ldIsdT0HjOjZCmCQ9otuQk7mHaW2fXBmGLcN/blyYVbSGseTfW
	y20+b0vRxO0XvUIskM+BdfbGiPaC3QEKwlnz79Djtn65JIcUPFU0mnH4Ihmk/MXlVgdQkC+zM+f
	+0pzA3hn5XHDwijIcqSDbYi3LgGLlVirev0fS0yVLoZYMNFKyzMJ11tTzvjJPlt1ZKxA59n2E
X-Gm-Gg: AYBFou3DAsc/vJ+HPst1x+dmg6EQNYMf8TumtwW6KOI/TV/yy1fWN/caNPwUFAa+9bw
	pWjrTsvqlwkQj1UQTrMtPJqcpDox5/842xzal1sbVMoIr8v1Pv38j9sEDUzJ9iv0O1iim6XWdY7
	CEE02yE3v72CYfhYwqSmsJLv2iNWGnYDtZyTnKY1dan5voG8FmqavMC2fYzY+V6XQkHi9SNOKtU
	Xet4z5zkVYpL+wHllKqn9Q6ypbBr5iarcnIYOxnfx5Zn7iyE2GW/66KoSuLVLDtb1qmJDNuL30r
	Vy1Hh7Vm/Ruvlt23zL5UP+eTu/QkX1soK001+7DEcbCsrKWHiq237RwGP0sAvRKY6QhtGQS84YJ
	rCotgmj9KBBI3FK3hEKDGd8/sKrpkX6ioQnD11qbAvxknb4d6DrUs6Rk=
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr13890781a91.3.1789054003452;
        Thu, 10 Sep 2026 08:26:43 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr13890712a91.3.1789054002868;
        Thu, 10 Sep 2026 08:26:42 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm31613177eec.25.2026.09.10.08.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:26:42 -0700 (PDT)
Message-ID: <05750947-c6fd-464e-930e-d45ff6f0294a@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 08:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath10k: Add missing validation in
 ath10k_htt_rx_proc_rx_frag_ind_hl
To: Rivaldi Hormat <rivaldihormat@gmail.com>, linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org, ath10k@lists.infradead.org
References: <20260910080659.20831-1-rivaldihormat@gmail.com>
 <20260910080659.20831-2-rivaldihormat@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910080659.20831-2-rivaldihormat@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hbu5S09d8_WkDCBQk54kF4JlQf8huoxN
X-Proofpoint-ORIG-GUID: Hbu5S09d8_WkDCBQk54kF4JlQf8huoxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4NyBTYWx0ZWRfXyZchrN5vXTRq
 YfFC+5T6UY3W6v9gu5hTuBOrAvtaeLKI+V3Olko0yKVJQuc/ioXU9cKgmB5l82uKgs/Ed4ZBIeG
 B1ySi9kdzPlsbPT6XJjKGm8bxwsVZOkgb8o7T2E4Me6B/QBM27JFSKqj3kK234JjNCoagI6qi4Q
 LQ6XSFWl8TsL8sF5g0oSDfnUps+8fC1mCctN+fUiWJ1yqGq/gnSlvxm8pgHvMUhxNOh3pyMo8lK
 8iGXqubZKojQUNngm4CNxHJzzbiFYvL0zcOyw7JUNxJZmMFeku0oMPg9/ywk3LrKV7WCJKzx1lG
 CWiys0AsSgrx+n3nXwCyQs7br+UFO60Iu9utQJgqIqMVW+OHLoA7b0B0k7RK7Qs82lKN/eZqwih
 YYz8tNs1o7k4T3tPgw30KlCtKMOBk37ubh7yGy03NHCXfFRsMoZuDtyJHOppfnAJRRzoWH6OM5B
 b6ErzuhlvfzDU8LwFqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4NyBTYWx0ZWRfX5BD+oJ+cON1S
 74EHxyfDd8MH09QzZOecVIKVBkIjb2DM6Od/b7QGtul5Z2Lw2x0VPzVCrzRXmk0YSEdID92NXgn
 kAmz06CNiZ6ayhvKxSQtAgv8dbniqBg=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2cc34 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=3e556brghCOcpfj0uccA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_082644_682420_36A3BADE 
X-CRM114-Status: GOOD (  23.94  )
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

On 9/10/2026 1:06 AM, Rivaldi Hormat wrote:
> The ath10k_htt_rx_proc_rx_frag_ind_hl function processes fragment
> indications sent by the WiFi firmware. It performs pointer arithmetic
> without validating the skb length:
> 
> 1. skb_pull(skb, HTT_RX_FRAG_IND_INFO0_HEADER_LEN) without checking
>    that skb->len >= HTT_RX_FRAG_IND_INFO0_HEADER_LEN.
> 
> 2. hdr = (struct ieee80211_hdr *)((u8 *)rx_desc + rx_hl->fw_desc.len)
>    without checking that fw_desc.len does not exceed the remaining
>    skb length.
> 
> If the firmware sends a malformed fragment indication with a small
> payload, this can lead to an integer underflow in skb->len and an
> out-of-bounds read in hdr->addr1.
> 
> Fix this by adding the missing validation:
> - Validate skb->len before skb_pull.
> - Validate num_mpdu_ranges to be <= 1.
> - Validate tot_hdr_len against skb->len.
> - Validate fw_desc.len against remaining skb length.
> 
> This prevents out-of-bounds read if the firmware sends malformed data.

ok, at least this one has commit text. Did you write this since it looks a lot
like LLM-generated stuff we see. If you've used LLM you need to add an
Assisted-by tag

but also look at other commit text. you are putting in way too much detail.
describe the problem as if you are telling someone else how to fix the
problem. normally you would not quote specific lines of code that has a
problem, you'd just say ath10k_htt_rx_proc_rx_frag_ind_hl() doesn't handle
undersized packets, so fix that. The code diff itself tells us what the actual
changes are.

> 
> Signed-off-by: Rivaldi Hormat <rivaldihormat@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index ab2d373b4..4fabb9264 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2775,6 +2775,13 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
>  	struct htt_resp *resp;
>  	size_t tot_hdr_len;
>  
> +
> +	/* FIX: Validate skb length before skb_pull */
> +	if (skb->len < HTT_RX_FRAG_IND_INFO0_HEADER_LEN) {
> +		ath10k_warn(ar, "Invalid skb len %d for RX_FRAG_IND\n", skb->len);
> +		return false;
> +	}
> +
>  	resp = (struct htt_resp *)(skb->data + HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
>  	skb_pull(skb, HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
>  	skb_trim(skb, skb->len - FCS_LEN);
> @@ -2792,6 +2799,13 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
>  	num_mpdu_ranges = MS(__le32_to_cpu(rx_hl->hdr.info1),
>  			     HTT_RX_INDICATION_INFO1_NUM_MPDU_RANGES);
>  
> +	/* FIX: Validate num_mpdu_ranges */
> +	if (num_mpdu_ranges > 1) {
> +		ath10k_warn(ar, "Invalid num_mpdu_ranges %d\n", num_mpdu_ranges);
> +		goto err;
> +	}
> +
> +
>  	tot_hdr_len = sizeof(struct htt_resp_hdr) +
>  		      sizeof(rx_hl->hdr) +
>  		      sizeof(rx_hl->ppdu) +
> @@ -2799,10 +2813,26 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
>  		      sizeof(rx_hl->fw_desc) +
>  		      sizeof(struct htt_rx_indication_mpdu_range) * num_mpdu_ranges;
>  
> +	/* FIX: Validate tot_hdr_len against skb length */
> +	if (tot_hdr_len > skb->len) {
> +		ath10k_warn(ar, "Invalid tot_hdr_len %zu > skb->len %u\n",
> +			    tot_hdr_len, skb->len);
> +		goto err;
> +	}
> +
> +
>  	tid =  MS(rx_hl->hdr.info0, HTT_RX_INDICATION_INFO0_EXT_TID);
>  	rx_desc = (struct htt_hl_rx_desc *)(skb->data + tot_hdr_len);
>  	rx_desc_info = __le32_to_cpu(rx_desc->info);
>  
> +
> +	/* FIX: Validate fw_desc.len against remaining skb length */
> +	if (rx_hl->fw_desc.len > skb->len - tot_hdr_len) {
> +		ath10k_warn(ar, "Invalid fw_desc.len %u > remaining skb len\n",
> +			    rx_hl->fw_desc.len);
> +		goto err;
> +	}
> +
>  	hdr = (struct ieee80211_hdr *)((u8 *)rx_desc + rx_hl->fw_desc.len);
>  
>  	if (is_multicast_ether_addr(hdr->addr1)) {


