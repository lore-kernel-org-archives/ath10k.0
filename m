Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E06CA9EBE
	for <ath10k@archiver.kernel.org>; Sat, 10 Oct 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=; b=PRBLf54QxKnx37L7nDajLUw3Ft
	8VC5OcFelYSl6cftF4k5YGk0SBKoDwhRYtRgKoF8kxmKGwrbabGxcjROpEW+z4DyAZsbM5KAw45DI
	LJ3DSb++3BOLNQe+WnXqkdXz3MCKYKtOpdBv7MKs+8gjGeQTGjBrRfaAyP9Kx04mPHH6HlnFNklVE
	6dFmIifBXlKAaGyKxASxpzCveURYEFegT+9fwgE8mITES4LTLdZo0w15ZzXQ40lWZK4bFaxUfx9nX
	iTBvO0g2+wNl6JmdqFfxDsIWfxxxXVOyqfwko0ZW14owJOQTjhPrJt73/5MGfe7tvTmNI7cpqfDqS
	/UcRHMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXwf-000000089ut-3Cm7;
	Sat, 10 Oct 2026 14:21:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXw0-000000089sw-1jKc
	for ath10k@lists.infradead.org;
	Sat, 10 Oct 2026 14:20:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACULuT3958021
	for <ath10k@lists.infradead.org>; Sat, 10 Oct 2026 14:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=; b=aaTvxilxZMQj8/Om
	6iUHA5NTX8zkG8NDrpJ3pKq822a+k+ABRfoeSZ1IwluD5n5iiatC7OC5ZzWX+f+A
	PVHYDHwG/hyzooBswj5MUn5Pg8AtcaUL7TaGz5+3j4tnehz2xqLkbHQG8M/2URmr
	ef77SsYAF52z4oWP4ZhPqcyUBJjfLSxvAgR7oYKuVcShXLvgRTTGOQuAtCFf9pQ5
	29Bj/rrGC7b5fdv9kUtU99Y7ngCXdwdxQD+ckEF1ixnjbCN7Uv7YExyiFqoZaJFz
	7LSPmPGvV5fHJO016gvGPsM06Qp/l2qoq1rBT0EQzwVwl3IS/PDKbAUoQEsejBGS
	phyQLw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9s0j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 10 Oct 2026 14:20:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so1667595eec.1
        for <ath10k@lists.infradead.org>; Sat, 10 Oct 2026 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791642023; x=1792246823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=;
        b=Kd8eTD+SF7cwFoC9oKsDGRWwvZkZKiY5IKhswIaujGubYY45cxWbnj28YQ5PdNFDfp
         fTzpst0GMV3gvtU7KIZ3G3f+1/4w+N6djm5/T567Li3oHRL8RsW6SVFet3DejXh+pIYx
         02sKfyOMXwGwKEajDGOPLl9vK8n+VeG67oNYNhrgBwk3d65nVdeu1liLH00zChRMWDiU
         k5W3IW+WLP+/ousWgXwowfRcMEMhCKkDvwe5djtZ2WxvKv2Icip4LXzl0ErThqU168Ne
         v3ZRqdtOl54yqJDcutAh1MQt/8FkewhgBKuo++sCjUJP2Gf2ThVzdRAVaEKbbDoXIJPi
         pRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642023; x=1792246823;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oC+rCB55Y+ms9o9sEXz9P3I2QSJAwssjs+A+Zu1eIcY=;
        b=ViOzUy0u3KkQTyIWNDzzIsZ/Nca1u9JGm1wY6jc0fq0SfKnX/QdgViWI+08+QdVV4f
         QNVi3BBadu9QMDODalVQJ4o2aaKyb7ffvthWaMOldHSDRbjjgqwXK2WOxs4bWhcQmz3i
         Qp/bIUAVRMYw1udsea64fqwO+FnWdruA+oUKSbCysbBBNaO7gI8P/5puFoIC7GhocXWp
         2MiE0cecVO9w3DThKxBzTOO5VJgrSoKoF6SfztxtQYOzLS3cMD8l/ZpDylFmmuLM28mD
         t885N5N3DRsdQb8mLL9X4qGG3fx4FXonpEVutQMeAUBvJ2elYMGMKEnmvR1H2cHB6f+N
         dPKw==
X-Forwarded-Encrypted: i=1; AKwUvBwnMGdYTKWEetg9u74O3Y1wYBd7J7c25EQrbT+IEhwnZ9qmoyJ+s6CmtNF1SBXSnqeNTiGzroY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKodyZBgiRGPj7HGMIMnLIo62DSjAltJr8CU2tsp6DpbGvKKaBE
	Xjt4ixsOOr+iAX9LuX02Mjc2gtkWVYWv5f+bt5Ug//bloBtianpmfHrdWj2k1M2p3QK3Bcj5b2S
	4qvoXiJL8gihJ/FHYbn838XIfR2fK/p07svGNyFU88tmg/In2IOLT95AxdimUv2HU6ANSm2r5
X-Gm-Gg: AYBFou0qaMciZJwshbC+M5gt280CLreVnCXm2kFlpH74pQKsCn4C3X/xkrKcOMqa+tb
	3eU4/qF77TJgVd4DzPp/5gsJSW91mmvg2CTesnBnh2JXSW2P37oh7p56PAo/U/CyjVXxMV8JO85
	NbYI3ZT3b7/bXMBTkZ8MaS91xytV26/Xke8uLulStQT+kKBKFAt1MoGdCY9HAjc5cQR9pAXPEYT
	62QE48KLCFheor7mFF/9cQIy72F4aoJ8Y00TFppl2Zfq84ypW+hVnpE9ttN3efO/NBg75JAKkYi
	C11I+VChu4wO7j+a6fnR3hg5rgJQUOKVYxlJexOC0m3tgAIPOd67U2NANs9MQz4MhFmUS9TfzlJ
	EzO0oWYdqcDVxDXT+F3ZeD6ROPg7MbNJAlbJTFR2TcZyfLQR0wyCpHL8Kdg==
X-Received: by 2002:a05:7022:e886:b0:151:8280:2c1a with SMTP id a92af1059eb24-16a630994cdmr7542090c88.42.1791642023063;
        Sat, 10 Oct 2026 07:20:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e886:b0:151:8280:2c1a with SMTP id a92af1059eb24-16a630994cdmr7542034c88.42.1791642022406;
        Sat, 10 Oct 2026 07:20:22 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm14807311c88.20.2026.10.10.07.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:20:21 -0700 (PDT)
Message-ID: <a589a7aa-bc52-46fa-9975-a20b6003352e@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:20:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Michal Kazior <michal.kazior@tieto.com>,
        Kalle Valo
 <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <20261003092104.520135-2-yaojiale02@163.com>
 <2e271ffa-99b7-4c1f-9d17-96242a51d22b@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2e271ffa-99b7-4c1f-9d17-96242a51d22b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6aca49a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Byx-y9mGAAAA:8 a=o4UwFHox3xQ5qkXPmxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: KdkgMAaZVipVf_xbl2d5aXh_YTkD-mvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NyBTYWx0ZWRfX1+2QY32aEZbs
 7cKJ96apdDSQjqd1ARNE/vLbXW9CbkPbXe6DH57/op283mnRzGVOvzAUC7yYKVsq2i/oFYk5JLl
 XjjzaGIm6M77QL5yFYv7j2Gu3W4vevmCtQITrXXMSCRfkqfltiyEUJ188jgtvcttF9Tv0wep24A
 zfi91CbKi6akoDVcJmMMSN/pPnCAsTn2qTk8kQu1B2lRzwHFWT3OK0IqhdWfrH/nnxB5kzVCq+q
 UudQTH9g97jrH5YABxb2HDsTkQvtZx1DXa+gEIVR0OPieHPDTAgR2RQLZMSGQ740JDRIt01mN9B
 i8PRpRG+x0/v5XZ8XNrNy5+lP2GX6P4CTJsbVo3FJ1Ibj+h7O6W3BodK/63Tqnwiv+/4d35ttyF
 Yb72ofndAJaVwLH7Kz39+e+fbozs7Mv136o3J32jmbnQJj6quymGzYuKj6/fuieqbR2FIqJQCP4
 MiE6CAkQcdy0ipQY1XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NyBTYWx0ZWRfX4U6tkbDsEZYo
 phUNSviK3e0peK/8zqcQKTfLRWWVqLO2IaOmlstDVOtwom6Zuor1tOgli5Nilmz9SeAeuxC+Gip
 UWCx0s30ii4TwQyCOnBxJJ9io2Msgbw=
X-Proofpoint-ORIG-GUID: KdkgMAaZVipVf_xbl2d5aXh_YTkD-mvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_072035_166204_17DA4400 
X-CRM114-Status: GOOD (  21.68  )
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

On 10/9/2026 6:31 PM, Jeff Johnson wrote:
> On 10/3/2026 2:20 AM, Jiale Yao wrote:
>> ath10k_htt_flush_tx_queue() walks pending_tx with idr_for_each().
>> Its callback calls ath10k_txrx_tx_unref(), which removes the current
>> entry from pending_tx through ath10k_htt_tx_free_msdu_id().
>>
>> idr_for_each() keeps radix-tree iterator state across the callback.
>> Removing the current entry can therefore invalidate that state and
>> make the remaining walk unsafe.
>>
>> Use idr_for_each_entry(), which starts a fresh lookup after each
>> callback.  The current entry can then be removed safely, while the
>> following idr_destroy() continues to release the IDR itself.
>>
>> Fixes: 89d6d83565e9 ("ath10k: use idr api for msdu_ids")
>> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/htt_tx.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> index e46f579d745d..9993c5a2f96c 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> @@ -535,8 +535,13 @@ void ath10k_htt_tx_destroy(struct ath10k_htt *htt)
>>  
>>  static void ath10k_htt_flush_tx_queue(struct ath10k_htt *htt)
>>  {
>> +	struct sk_buff *msdu;
>> +	int msdu_id;
>> +
>>  	ath10k_htc_stop_hl(htt->ar);
>> -	idr_for_each(&htt->pending_tx, ath10k_htt_tx_clean_up_pending, htt->ar);
>> +
>> +	idr_for_each_entry(&htt->pending_tx, msdu, msdu_id)
>> +		ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar);
> 
> my review agent notes:
> **Actionable issue:** `ath10k_htt_tx_clean_up_pending` retains its old
> `idr_for_each`-callback signature even though it's now called directly:
> 
> ```c
> static int ath10k_htt_tx_clean_up_pending(int msdu_id, void *skb, void *ctx)
> ```
> 
> The `skb` parameter is completely unused inside the function — it's not
> read anywhere. Since this is a `static` function no longer used as a
> callback, the signature should be cleaned up in the same patch:
> 
> - Remove the unused `void *skb` parameter
> - Change `void *ctx` to `struct ath10k *ar`
> - Make the return type `void` (the `return 0` is vestigial)
> 
> As-is, the call site `ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar)`
> passes `msdu` as a `void *` that the callee silently discards — confusing
> for future readers.

BTW no need to send a new version to address this unless reviewers have other
issues -- I'll make this change when applying the patches to my 'pending' branch


