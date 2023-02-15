Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B4C636CC
	for <ath10k@archiver.kernel.org>; Wed, 15 Feb 2023 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEGX2Hs3qtyYo297cnQpAWoxQmJJ514bcERI94LZXKw=; b=b3x8CejSEBsNLE
	TKR1mfC1ilkgPOnBdMOOIo3xmUUx1LgnzExOntgUVUnDRw1ss89PziGgiqeLuxvsO6NTScnO817af
	LW0+FmTr9R2qFkduU5qJ4Tl6T0/nVPxQFuD9g9uuyyYXZ9cnRP0dLHQXUnBDwZ0uR4ywr/4miG2qt
	re7AFQH2pu4ugJt5HPouRXsCaKLJwY819bZJtY9ac6cQsZ4Qbe0hrpYan7CQdWWilaupo73ljzBDX
	CTm/sH0bab0HS7QUskBjJwcyqregFhGxy5upZ5wv6vL1HUGaR2lxvsJpCiCs/ZhrKBgpP0vUTPLGi
	zwL8X+xqLTeodoHzYDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJQJ-006Ku0-U0; Wed, 15 Feb 2023 15:10:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJQH-006Kst-UU
	for ath10k@lists.infradead.org; Wed, 15 Feb 2023 15:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+IhXvip6E0zB3m+HmAxx505GyG5cx1vo0UJZ0GujIH0=;
	t=1676473815; x=1677683415; b=PGR/oPAmC1dCpGoSUF2uLvszQ5SfjrJGDfq+Nj6HJr+yBKM
	M9ucmRIaSTb7zvYNcMNhfASMmBgPS0r3mVupPair1PF0TObX9q5ulOiYK+zmOxPk3v2rIsTZcUihM
	rZXx7oerBqfpgnabnOvCdLu2R0qypqpV9mCwbH2PZrVJ8l2XaJ8+ULyapO8qQ44U+YcghgxAvJoQb
	dcpqlN8s2Iam3KHoa42of8R1mh2zrnEk5CkC+xRNL+tX1eNTXhfuPg9ffZ+thRStRwGBC/nAILcGB
	1ZGcdBSwa8Wf9nLTI7FQguUmUSd5XIcvK/cKKbpp9vYFOey2WE5kcO9VM/IaT3DQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSJQC-00D6at-0S;
	Wed, 15 Feb 2023 16:10:12 +0100
Message-ID: <0d4b99ab0a5bedc82f35bc1e548a611564b010e5.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: cfg80211: Add beacon hint notifier support
From: Johannes Berg <johannes@sipsolutions.net>
To: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>, 
	ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_mpubbise@quicinc.com
Date: Wed, 15 Feb 2023 16:10:11 +0100
In-Reply-To: <96cab5d9-9090-4cb2-ff17-eadc9da12f50@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
	 <20221222124221.30894-2-quic_youghand@quicinc.com>
	 <1df59863e78e8ddbe7eb3a74e6dd4c8f0bd7f098.camel@sipsolutions.net>
	 <96cab5d9-9090-4cb2-ff17-eadc9da12f50@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_071018_001727_ECDEF7F0 
X-CRM114-Status: UNSURE (   7.05  )
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

> > 
> > Why is this even needed? You should always get reg_notifier after this
> > anyway?
> 
> Currently when channel flag changed through the beacon hints are not 
> informed to driver.
> 
> reg_notifier will be triggered for regdomain changes but not for channel flag changes due to beacon hints.
> 

So maybe triggering reg notifier once would be sufficient, a la Wen's
patch that I recently merged?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
