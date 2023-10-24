Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D144C25B47
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekCOnyu9VtzXDRIUVcVr/+rB13Nm7BiEOgBJGB75+G0=; b=SOrJd5KP1B9A/D
	iChujzfSznL0OeSQWS15mUH1NYKzL/hCNfsrKtm+tOEkbB+ZZSZQqvaTemFoDiZEBWS6xxKn0/S8u
	64JfcJlpMWlsI+RTSBCnYLMC1OiKc3DAMh0tikizxtp5Pd8ADKF2n4O/DAwdrM0qojXHFttInGMsr
	Nl+YMlDNK9/+i79us+aMF6GEIdKJNctXk4oLPPGIWLMMFqUzDb1KS+fNMtn66BCJbTwb64T09cwsW
	cWSI306+2vZ97g5p1uOJ8RhTFCU+UzGObUXVFr+45DyotAFlFgnvK0wo31199oL25Uf7EdT1Twirx
	2iiCJgLIuWpIgBLMabJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOLH-00Apyp-2f;
	Tue, 24 Oct 2023 20:49:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOLF-00ApyS-1b
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 20:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=n1hoWu1QQf0mXz91DzUGE4OYJa5WmwrJOSpDXP5IzqI=;
	t=1698180573; x=1699390173; b=LLT+cnPWCkDtzgmWbq7a1qPdCU2erZwF3U3KpHzqeZ1wJ5k
	aT6HOnMdEtIbwfeXeaLt4McAb7B9Py7a1QvGYATatn1XNcxYh9+w6F7XTgL0wnKHFR2jlqmo7m4g6
	PMjk/NyrP0k+qiZSDSGjKcgS3Xwf4iMQxqF4PIGJdqoAd12qE9mKxgR9JUElP62bQ6vipjNVt67K4
	DOgh1LRCNQw9vDSOtGr59u9ZtGsIW2aWcUhKs4Ed5i7JZ97ttGZyzn8d1ZxYldOzhgo5G2L7ko1NW
	w7K5mj9WJSLUL38d+AFfYCo8jFzHYqtIMRPnvLX90b4wQngBFq0bYS1D1JYAx9og==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qvOLC-00000001bbh-1i2d;
	Tue, 24 Oct 2023 22:49:30 +0200
Message-ID: <f8daa53ee8a8019e4fd2b823c1fcb85a6cc4d806.camel@sipsolutions.net>
Subject: Re: [RFC - is this a bug?] wifi: ath10k: Asking for some light on
 this, please :)
From: Johannes Berg <johannes@sipsolutions.net>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kalle Valo
	 <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  linux-hardening@vger.kernel.org
Date: Tue, 24 Oct 2023 22:49:29 +0200
In-Reply-To: <07e9bb04-f9fc-46d5-bfb9-a00a63a707c0@embeddedor.com>
References: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
	 <26b15f4702cef17fe70b496a62f03735874bd16a.camel@sipsolutions.net>
	 <07e9bb04-f9fc-46d5-bfb9-a00a63a707c0@embeddedor.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_134933_539533_294EE25C 
X-CRM114-Status: GOOD (  11.28  )
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

On Tue, 2023-10-24 at 14:41 -0600, Gustavo A. R. Silva wrote:
> 
> It seems we run into the same issue in the function below, even in the
> case this `memset()` is unnecessary (which it seems it's not):
> 
> 	8920         memset(skb->data, 0, sizeof(*cmd));
> 
> Notice that if `cap->peer_chan_len == 0` or `cap->peer_chan_len == 1`,
> in the original code, we have `len == sizeof(*cmd) == 128`:

Right.

> -       /* tdls peer update cmd has place holder for one channel*/
> -       chan_len = cap->peer_chan_len ? (cap->peer_chan_len - 1) : 0;
> -
> -       len = sizeof(*cmd) + chan_len * sizeof(*chan);
> +       len = struct_size(cmd, peer_capab.peer_chan_list, cap->peer_chan_len);
> 
>          skb = ath10k_wmi_alloc_skb(ar, len);
>          if (!skb)
> 
> which makes `round_len == roundup(len, 4) == struct_size(cmd,...,...) == 104`
> when `cap->peer_chan_len == 0`

And yeah, that's really the issue, it only matters for ==0. For a moment
there I thought that doesn't even make sense, but it looks like it never
even becomes non-zero.

No idea then, sorry. You'd hope firmware doesn't care about the actual
message size if the inner data says "0 entries", but who knows? And how
many firmware versions are there? :)

So I guess you'd want to stay compatible, even if it means having a

	chan_len = min(cap->peer_chan_len, 1);

for the struct_size()?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
