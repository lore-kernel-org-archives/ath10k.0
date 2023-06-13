Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7184EB64D0
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSdK2v5RPcdsQYJXROrbkp7sneo0CNIFCG3Msi2i994=; b=UR5wzgx6Gu7Dil
	t5S9S1V157FZ4lS/iWlmSMwb9nEQe4MytKKmUVJM38UOHzusqMDYJUU2mVnYe+AMzw7TE5PnQxGFL
	kxvtPpnuV14jj1ULC7+LMibZyoE41GaTY8i6pSViM0iXekJ2Y3FqgClUbTsJhBd4nKm86NboGGcIG
	kSjY6+ANjRPHw/O3stbtCLgPaF9dNH9GHAsdShRavOM6QjYiJieeCb6tdop1QyuVb3IlS0QT+W3MS
	aEYStHrBr3MBgYaHo/j2dDtCNlsahSjI3HV2zO7nnERV0UMrJ+0msGxTJikg14W81VGk23tqqAbmg
	d0HBRg13n3SCP244fdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9649-008UPw-0C;
	Tue, 13 Jun 2023 15:36:17 +0000
Received: from softboy.mntmn.com ([91.250.115.15])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9644-008UMG-2t
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 15:36:15 +0000
From: Lukas F. Hartmann <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com 7F7A972033F
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
	s=mntremail; t=1686670561;
	bh=fX0uy7QVElI+3AH4vWRdEIAIth03wlXdRoBCF/jtYl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L9NXQHHJOvoK0dxwHb9Va+AKVS74UGyyE+iTSyXVKEi+DFZzQPIvsoWauK+c3Cz3T
	 OPmcX8ZyRoeBSoN83nCTlYIxOwHijzvHKTlRZs8Vuo+qYbSE/xR7VBK+tvGxxuUZtM
	 gSHLmfKfJPMlDdtUJ+OvsVE5/4e7HQgKafYP2x01rKYyV1Z8ttqu3xewjg2Aof8y1x
	 po0DDJs/Lu/8MGNpyK4ceHPPbIqRO5AgNrdTFzp2nJzBLtWntAl4zwFSYq4qLMOZVg
	 hSmR5sSBDgOkSni4R62R/bdNcOk3S1ECBWd6BC3m+5c+RhD2WjEUdpyQ4qPIEmsr76
	 G241qfU3YqiAQ==
To: Gary Bisson <bisson.gary@gmail.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, gary.bisson@boundarydevices.com
Subject: Re: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
In-Reply-To: <ZIgoHqP8gk5wdP8A@p1g2>
References: <875y7swixj.fsf@mntre.com> <87mt13eqit.fsf@kernel.org>
 <ZIgoHqP8gk5wdP8A@p1g2>
Date: Tue, 13 Jun 2023 17:35:58 +0200
Message-ID: <878rcn4boh.fsf@mntre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083613_076890_FB2CAEAF 
X-CRM114-Status: UNSURE (   9.88  )
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

Hi Gary & Kalle,

Gary Bisson <bisson.gary@gmail.com> writes:

>> Trying significantly older ath10k from an older kernel is something to
>> try in case there are recent regressions in ath10k.
>> 
>> I don't have an ath10k SDIO device myself so I don't know the state of
>> SDIO support in ath10k. Does anyone else from the list know?
>
> FYI we have a branch in our repo with the firmware that worked on ath10k
> at some point [2].

Thanks, I looked at this FW now and it is exactly the same as the
"untested" in the ath10k-firmware repo
https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested

So if that worked with ath10k several years ago (when?) I could try to
reconstruct an older version and try to bisect for a regression, though
I imagine it will be complicated to make these old versions work with
APIs that have changed in the meantime in Linux.

Best
Lukas
-- 
Lukas F. Hartmann, CEO
MNT Research GmbH
https://mntre.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
