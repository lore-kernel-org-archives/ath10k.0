Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D43C38147
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPhjX5HX44G16GnSy7yCRIA4xcoPU0onHiIeFr1VyDw=; b=26pql0WdZAbbOL
	lLKoKqNFILb9wTi2J5U+mOVqnJhni2xiLA6X/FV5oaKrKfi26Cgno4Umv9KjwoscKf3AWYzqDzHwt
	16ksPEpUzDd6ueT4XsPP+bDUXWRO5Xx/Rvw9+yOOs33YqUv+ZqIEQFMLkBbDFoJZwBseDcbEDZNbK
	6ZAvm/QT/k+aP2lWM+zGoY8oF5Gc7DB1rgoeRd6sX7II4BhpVwpwKgURfD66RUGwqLlXLzpMiUQJq
	PIn0R4GqCEtDSlqw6lZ71B5S5FCR91QB4ksP45U6urPjWa7n/W9ooofHtKJaa8Xh+2bAy3OOt94oj
	JKarOQku37JHdScjGLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIBKN-001pgc-Gl; Wed, 18 Jan 2023 16:30:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIBKK-001pen-SZ
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 16:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=K/+rA7ADEh7Cf9JIm+LeaHAHtk2gmiF0EE0EQlQ4VrM=;
	t=1674059415; x=1675269015; b=XtojV5SSh5megmKTifUGL+8U2pqmuXb0h45soXQavoosVIX
	3JyWJnKx5cCaIwZdpj7QlZ+u9lKptfrVdfaeeoDKnpTSGDNxOEo10KMxUfGHTvKymcdOdd1qHVuRe
	07dBC1E8P6d27KBl16SPD+yGDHJdgRUGdGhe+ypuKs40FQhGaPTMFWM7graHZc0b6KwfWhfYrImll
	U/P8545x/kncz2HeNQTC6KmfFINb1RbY0kN+6RiqvwbNE09AtHHAb/8pCVkYzj04bFHvH64QH1Fkm
	XlzxexnVGBSAwkrLpk8YfyjH6fV8DBtpc0IP0H8QiTx4zB0BrsU3JIpGWfJIx7rw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pIBKG-005fqO-24;
	Wed, 18 Jan 2023 17:30:12 +0100
Message-ID: <1df59863e78e8ddbe7eb3a74e6dd4c8f0bd7f098.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: cfg80211: Add beacon hint notifier support
From: Johannes Berg <johannes@sipsolutions.net>
To: Youghandhar Chintala <quic_youghand@quicinc.com>, 
	ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_mpubbise@quicinc.com
Date: Wed, 18 Jan 2023 17:30:11 +0100
In-Reply-To: <20221222124221.30894-2-quic_youghand@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
	 <20221222124221.30894-2-quic_youghand@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_083016_945456_9FEF043D 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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


> +++ b/include/net/cfg80211.h
> @@ -5386,6 +5386,8 @@ struct wiphy {
>  	void (*reg_notifier)(struct wiphy *wiphy,
>  			     struct regulatory_request *request);
>  
> +	void (*beacon_hint_notifier)(struct wiphy *wiphy);


missing documentation, for sure

Also this should probably be in the ops, rather than here? Not sure why
reg_notifier is here.

> -	if (channel_changed)
> +	if (channel_changed) {
>  		nl80211_send_beacon_hint_event(wiphy, &chan_before, chan);
> +		if (wiphy->beacon_hint_notifier)
> +			wiphy->beacon_hint_notifier(wiphy);
> +	}

This also seems excessive if you're not even passing the channel - you
call it for every (affected) channel, but you don't tell it anything
about the channel? Seems strange.


However ...

Why is this even needed? You should always get reg_notifier after this
anyway?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
