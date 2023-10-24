Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A3C00A8F
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F50kha7TybFPpI9XYNVBGbM4U8Lz7JHpsdjjqhR5De4=; b=I6rWBAddHILeR4
	VZD/xhdAu5Jp9x1e3NTvSoHLBQyHaVVSBRldbLB6qyaaOD36BjLLrhMLH1gSmU7TJ5wDFSYHjZz0J
	X0kzIbnjcBnX9jHMdthhRV1iLnNi99jpZPixSIqNCapZ1gJsxKvRYSwyQRWWFQwmDqnasV9qRpnhy
	f6N+UT/w8bcb0HNtkthwP8oZ+Ss4NqxDN1sRD8wiELzAeBks+ojXiop2vvnfBIOlYaK+BRpTi1qSI
	u18jZzJh80Yri0JkEiKouQ/Je6PovBS8DZ0E1ajnS2z0pTlUjyH2Q4gX7RnNov2bXDu5zVAWEWQo2
	XuR+KD3WdxbbjktyZJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNkk-00Ao3i-2K;
	Tue, 24 Oct 2023 20:11:50 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNkh-00Ao2h-0r
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 20:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=nfdtctD5s+siSQUr/kengnC4iQIqyN5aDOBCjVSm0Aw=;
	t=1698178304; x=1699387904; b=w58OWc9SIC+UqOv2yeM+jEARKs2uos4Z5SA5Zt1bMImeSJN
	Uk2xxHVmhyo0nsSJTKhAPjYauQ8tO5hvNb44Ie0IzIcs/OV/M+61XSniqOLpzbify0SaiyGaHFvdy
	6TruWuIAmL1L9rLHDXNvSTGrC2Uzq7af6yIZSO8TAraSqKuIrwK+Qmydnzu7XBlrv6jmGL4tBwKQk
	Qfb7C36NuZUDJDGgXGOzB/eelLuY6MMexnppPN2L8meHowRyZ01/4Yj0cINKBTyEXjY7zwseCKO7R
	CKbmmPeOeAdgCL34AhNTm7z5qVNal/sP0NPz2DzQTAe2lz8NLP3cUSTXNiLAAC7Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qvNkZ-00000001akU-3Ra3;
	Tue, 24 Oct 2023 22:11:40 +0200
Message-ID: <26b15f4702cef17fe70b496a62f03735874bd16a.camel@sipsolutions.net>
Subject: Re: [RFC - is this a bug?] wifi: ath10k: Asking for some light on
 this, please :)
From: Johannes Berg <johannes@sipsolutions.net>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kalle Valo
	 <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  linux-hardening@vger.kernel.org
Date: Tue, 24 Oct 2023 22:11:38 +0200
In-Reply-To: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
References: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_131148_239838_02F17E5E 
X-CRM114-Status: GOOD (  11.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, 2023-10-24 at 13:50 -0600, Gustavo A. R. Silva wrote:
> Hi all,
> 
> While working on tranforming one-element array `peer_chan_list` in
> `struct wmi_tdls_peer_capabilities` into a flex-array member
> 
> 7187 struct wmi_tdls_peer_capabilities {
> ...
> 7199         struct wmi_channel peer_chan_list[1];
> 7200 } __packed;
> 
> the following line caught my attention:
> 
> ./drivers/net/wireless/ath/ath10k/wmi.c:
> 8920         memset(skb->data, 0, sizeof(*cmd));
> 
> Notice that before the flex-array transformation, we are zeroing 128
> bytes in `skb->data` because `sizeof(*cmd) == 128`, see below:


> So, my question is: do we really need to zero out those extra 24 bytes in
> `skb->data`? or is it rather a bug in the original code?
> 

If we look a step further, I _think_ even that memset is unnecessary?


struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len)
{
        struct sk_buff *skb;
        u32 round_len = roundup(len, 4);

        skb = ath10k_htc_alloc_skb(ar, WMI_SKB_HEADROOM + round_len);
        if (!skb)
                return NULL;

        skb_reserve(skb, WMI_SKB_HEADROOM);
        if (!IS_ALIGNED((unsigned long)skb->data, 4))
                ath10k_warn(ar, "Unaligned WMI skb\n");

        skb_put(skb, round_len);
        memset(skb->data, 0, round_len);

        return skb;
}


So shouldn't the outgoing skb be exactly the same?

Anyway, just looking at the code out of curiosity, I don't actually know
anything about this driver :)

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
