Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C92EC433FE
	for <ath10k@archiver.kernel.org>; Tue, 15 Mar 2022 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJB4vHDvK50rVTisN1+z5tbuMolaU42vVQihF/T86P8=; b=Veqi/a3dUFyXns
	W/bl9c3yxXW0dnDZUrJaXsFp7lVrqP4tlGGbUFVuNGd7iT1wk9PGzd3+DdLCqDt9oBL7qJkbgtzFU
	Atmdh15SDaPs8YGYvD62E7n4w3kOJzkw1Rb5J906pwEGEyqS3kCqvVkJJYI3DT2b1WXHsZOWzI0T8
	Ncbohh5Dyhq3tM5XRo8+GJbi9zsGlkKWUX5nkypL6vbR3hUMkrtMk+1FDklF97hWls/qnu/b87gW+
	kn/b8WDxRElr9LlaISPRnGa550TEof+JfYdHMqYfWGPkcGCbdfY6IPBWwknIIZSIWZvymoCno6q20
	pShnoeZaVcUP7WmKkIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU2bL-008Hnr-JM; Tue, 15 Mar 2022 08:32:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU2bI-008Hmh-Es
 for ath10k@lists.infradead.org; Tue, 15 Mar 2022 08:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=XvFNllMjXqE2uJ/FiYaesrXoFBwh6gj7NI26XPZO2Kc=; 
 t=1647333132; x=1648542732; b=Qjv37k+9GyyZhQ9W1ENTvugF3BBs7iTf+uBcB5ce13cY0Un
 BCdx+3OPPXX3xdKo+D5gqI9jd9iCrP5cfhdKt8omv3FrNvI658HQYcGjH/fu9HvmTePPvT2IGVbfq
 FXBYGQxnZbap/e01iaeFJ/MSMn/xbSkGcaW+6OOjCAhM/FATIG4VMs/xvW+OQZZQMKZGga5fj3XM2
 d0PeJa+pJ09v7Fbikcxg6ERDvZDNo8aoqjaWnQIlesBLnyosSqRw0bxWd6YYyFCjwR0zhzEvA9Yrr
 f2hUXh/NLbdQ9Ya/ogmrBmTTT78BEeB/eVh720X/kjrAPgt+PMh8ZFRq0nlZkCCg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nU2b8-00DQca-LQ; Tue, 15 Mar 2022 09:32:06 +0100
Message-ID: <20b7f8d9032e657d132f37b59b32f339308cb289.camel@sipsolutions.net>
Subject: Re: [PATCH v6 1/2] mac80211: Add support to trigger sta disconnect
 on  hardware restart
From: Johannes Berg <johannes@sipsolutions.net>
To: Youghandhar Chintala <youghand@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pillair@codeaurora.org, dianders@chromium.org, kuabhs@chromium.org, 
 briannorris@chromium.org, mpubbise@codeaurora.org, kernel test robot
 <lkp@intel.com>
Date: Tue, 15 Mar 2022 09:32:05 +0100
In-Reply-To: <20220315082944.12406-2-youghand@codeaurora.org>
References: <20220315082944.12406-1-youghand@codeaurora.org>
 <20220315082944.12406-2-youghand@codeaurora.org>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_013216_534793_A7BD5ED1 
X-CRM114-Status: UNSURE (   4.10  )
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

I already applied this patch, and sent a separate ifdef fix ...

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
