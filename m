Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48CBCA9EBB
	for <ath10k@archiver.kernel.org>; Sat, 10 Oct 2026 01:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhKP/nvNUspfn8Zy7OHsWTm/Pieq02Mp5rrslHg/DSs=; b=zwiqj8aZ/2gp6ETIWh+fVPzTTd
	MRKSi5xmEVDOyn94e8QvoPWfm99Ygupsi+MY5aHJ25Pd6E8ktpF+MqK65PXp68wQoNBpqWQJyxder
	SYakB8JS58ja7H1dRN++mnLb87QvFbfOH/wyrpJmgxoL3u3MfY9NR+qVSfGh6bTE5XDRNWBjljga4
	OPXMnhDBhRik8rqimyySlpzgoGJ0fvyacvYIZtobK3TLAy1CRK/2j2AS90+ChcVO1ok6zxAzfA+CW
	NoZQ1u5DNZHREDt7PNYWutQcUzu5gLIQcs8wzK4rpjrpBqOo3iD7YvhTiG7xKt32QVs+BhEAjNb9G
	9oER3xKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFLw2-00000007OTj-2Iut;
	Sat, 10 Oct 2026 01:31:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFLvy-00000007OTJ-3Hfm
	for ath10k@lists.infradead.org;
	Sat, 10 Oct 2026 01:31:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKnwQ2872068
	for <ath10k@lists.infradead.org>; Sat, 10 Oct 2026 01:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhKP/nvNUspfn8Zy7OHsWTm/Pieq02Mp5rrslHg/DSs=; b=AQAxz7236qI1puhx
	L7I2zsr1Rl88YB2Lh9nbUF5lStsmJfKBibLUQ83vH2/Dp/jK815yh4CO5kDzrGvI
	PTvtejdMWSX/Ik0cwON9Lmz03h0Qm0t/5GZVcTlh2UDYy035pjMHMol1EUj3+IRu
	um+JG5K3BOJKNgeZ507vSgEHlzVmHFik0UptH1sjM3/uhFVnyhEGZkSDJJRSmYgy
	5Y+Rl/8C1TFux+EoaePJl07OLTznBFxUvvBOdqAmi9Xsx2kuqsw+piVnAx9vVa/+
	FiG287qPDQtyR3qUT0GIUWiZRc2W9Fmgd3XGL0QNHjp8K+exZHAjKA5ZYe+qHIjI
	IIBk+A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7sbwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 10 Oct 2026 01:31:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso1328784eec.0
        for <ath10k@lists.infradead.org>; Fri, 09 Oct 2026 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791595891; x=1792200691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhKP/nvNUspfn8Zy7OHsWTm/Pieq02Mp5rrslHg/DSs=;
        b=cFTvqLPW8EZKCw0ypIOxIMtzjCUUhqlqmAKohFq7PYZlNRxDPSLPFm14jW6Xhez/v4
         uq5DT/5Rhh2wFRq4IJxZv8ic+HpgxqGk7AiXEUXb+kkrBOu4qwW3K9ZqGHgvn4y06A+o
         LcJt+z/8o8CrFyoDsDoeKCg94cT5T//N8P5BIkCuh/4jqcMKNsX8yy6wpDGwhJ5cCrsj
         qyXtD4FxKL+vzo4+5BpmbUg2oG0Tt48NShPGRJDf8yMB6iN6bsvLMM7NOwD/h6LYmSMq
         3R/NcWrw3aFDiVNuXEH6Pd4+WteT7MNG0w+aznGgv//j/0dglGsuhGuyn4SapwImxX3a
         0mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595891; x=1792200691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nhKP/nvNUspfn8Zy7OHsWTm/Pieq02Mp5rrslHg/DSs=;
        b=Wjo8rULLUZ1bmw2XDw7UvJlBBT1ukskiTcO+OJ4A3lGNGxqez4Oewuq54aBaVH2i6L
         //KNIjQB6teUpJi1rO8mzCkNC1QUCCvb70KsCHWXK7HT82N9kbc3rhKmokJep2YgzGQX
         MSO1g+BqmO8u5QDh4ldNTfsUGAtSqlI1vx/HZq3VO0jbZjeRQdDOq/b7weKRGKOt5Cn8
         DITQz4X2MpQgtkg5o/QSKdX3LKV0rq9WHs7LbA8u1LqOJWeitR9aJc2Myi24RkztVmdq
         ssjSb76lrze6BgcY0gtbCGCOPv475HdnKJOQdf+gijPSiJIWzCT5Yt9epwpFrR1ZQFGB
         5YOg==
X-Forwarded-Encrypted: i=1; AKwUvBwSypb366Xf2JYFU9t6UsXkCDCyy809H2YWZHUGOf372quVudSIDPuJrDX9KkOyuPgsYX3DbqE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLIBXNCoQJImxyZDEjnNq8p0ScDu36ga3dZKfiUqof5nM2Z4sPQ
	V6iWHJsk0udX0PrzzOjdYtN9vzRBZbIamR/8B3pqImGzlWCEQMFaj6BbVjQ8cqDWjZ6DfA8Qq2+
	qgXLqUq0frVYaWSN8+stxBJIqQVYvPrRJxivlJFp9QSlwen5mtgvQ/Ju68Th7cWzk
X-Gm-Gg: AYBFou3ONX4iU2/Bx8roUfwbfUl1owUOf1Y83d+PxMBwO+k6lbTvWs9J4NeBT9FA6aA
	kGrh8zghYcdd8memYa/TSIDBKNn7XNbLZnxuDyJ7aick6Zr17tOYFP9QsxipUst2+TAx6nmV2SZ
	PXr+IXtFAWvZM01sCv4TXEwu60u7p90irizqB+fLVDrBFiqgiJH6nsn4JZXKo2LSv8yHNW8EAkz
	6y0WwNPwzxmT23a/IAUOAkPT63z9ebbiaC+eItKIgjU8LZPErUEMWZ/U7SGAzyM6Mabu25txoVr
	rTfadoTMT4H8gFmtVNBDC2CSfrU9+26OS//HQ0N8gnwL8F5rBdN16fruCcdzC45qE8OEazmSMi3
	yF/7q1OjSlaYMlJPlgEemy13Lm5LZiQZQ+lEgMAfwqCyIyjNPLc1wyUEGdA==
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr2348013eec.24.1791595891233;
        Fri, 09 Oct 2026 18:31:31 -0700 (PDT)
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr2347977eec.24.1791595890583;
        Fri, 09 Oct 2026 18:31:30 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm9483336eec.18.2026.10.09.18.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 18:31:30 -0700 (PDT)
Message-ID: <2e271ffa-99b7-4c1f-9d17-96242a51d22b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 18:31:28 -0700
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-2-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAwNSBTYWx0ZWRfX6EuSG0d8qUDV
 P5Z6QdrvCdcYaLXJKrQXtLMks0cAvQYBoeHlRkZzAKiqaM6MuisRx3gRiPeOpKm0iFYF9KP3jab
 qdP4UvS6MhiWViG7tNj6144a0ZPjC3C2L45EVxBy4lbXL2BtBDTaz8+30Nn8RkuhkLxe5Vqi9oR
 C3xTF8f2MDXjTjLQzlHKx0NOeJpEdDeA51MzWQ0iq2ljfEibq/2hBtUePb/FSoh7TwzFQmi5K+Y
 7zfgm4Fnslwma9U8r5jjt8GZt0c4UI1Lc9OwuQiJs5utgGh1fdWCoS+BD0LnlVktmvczW+W6nMR
 gAqRgZeWgVqIBUQPb0ZBo6MhqE12WU0E4vkKUL40/zjq0uGp5EiWDuyfe0ucji/92WqcfBjdikI
 d/lAnA0NCZpWdufwGdF6n0fKzhozoPNVDuRVoB85qjeQxAssN8BEOZ8gWuEjJXrE9ZgEgY1x/b6
 n4bwZ4+8MKmVvO0OKiQ==
X-Proofpoint-ORIG-GUID: JeAVASF0ZCmC8fgh8TaKgXflmLVMeb7T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAwNSBTYWx0ZWRfX0//8fZydzUW1
 eguR4HooZWKTTgE/qgiqKrtxRYPp0VWEpVm3KUYzoXNn2mPyoSEYwjJU1WLIcxKH8JHH6nmHAG3
 lCQ1QolNVmSw7lZFoFQWAdt6XB5PiTM=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac99574 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=vxfaGprF530-xfLAvAgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: JeAVASF0ZCmC8fgh8TaKgXflmLVMeb7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_183136_035434_FE31BAF1 
X-CRM114-Status: GOOD (  20.73  )
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

On 10/3/2026 2:20 AM, Jiale Yao wrote:
> ath10k_htt_flush_tx_queue() walks pending_tx with idr_for_each().
> Its callback calls ath10k_txrx_tx_unref(), which removes the current
> entry from pending_tx through ath10k_htt_tx_free_msdu_id().
> 
> idr_for_each() keeps radix-tree iterator state across the callback.
> Removing the current entry can therefore invalidate that state and
> make the remaining walk unsafe.
> 
> Use idr_for_each_entry(), which starts a fresh lookup after each
> callback.  The current entry can then be removed safely, while the
> following idr_destroy() continues to release the IDR itself.
> 
> Fixes: 89d6d83565e9 ("ath10k: use idr api for msdu_ids")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
> index e46f579d745d..9993c5a2f96c 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -535,8 +535,13 @@ void ath10k_htt_tx_destroy(struct ath10k_htt *htt)
>  
>  static void ath10k_htt_flush_tx_queue(struct ath10k_htt *htt)
>  {
> +	struct sk_buff *msdu;
> +	int msdu_id;
> +
>  	ath10k_htc_stop_hl(htt->ar);
> -	idr_for_each(&htt->pending_tx, ath10k_htt_tx_clean_up_pending, htt->ar);
> +
> +	idr_for_each_entry(&htt->pending_tx, msdu, msdu_id)
> +		ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar);

my review agent notes:
**Actionable issue:** `ath10k_htt_tx_clean_up_pending` retains its old
`idr_for_each`-callback signature even though it's now called directly:

```c
static int ath10k_htt_tx_clean_up_pending(int msdu_id, void *skb, void *ctx)
```

The `skb` parameter is completely unused inside the function — it's not
read anywhere. Since this is a `static` function no longer used as a
callback, the signature should be cleaned up in the same patch:

- Remove the unused `void *skb` parameter
- Change `void *ctx` to `struct ath10k *ar`
- Make the return type `void` (the `return 0` is vestigial)

As-is, the call site `ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar)`
passes `msdu` as a `void *` that the callee silently discards — confusing
for future readers.

>  }
>  
>  void ath10k_htt_tx_stop(struct ath10k_htt *htt)


