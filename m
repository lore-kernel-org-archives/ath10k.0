Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56D606A320
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3Aqj3dw;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=r53HDp9s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qVTGOF0g2lYLUrQkFxW8jn3nURBAzDjEGsnctCt4OlI=; b=Q3Aqj3dwCDgcCO
	24hIlujD17vClLMlzxxIz00vNJO8QNhvxUa6Qqe39gczBBB03bkBJMGDgyQXjdmEnsc8Tki5+w+dD
	jSVNddxGop4aZafljvIDJpqa7KY58bkCiTWO2JZD+V32sFomRUwOpSM8jJ1rUqO+u03cCxM6g+tdP
	7YasFIka6mOC9EB3MJBeClWc/gf062ETEjGluAdfALF0sH+r5YE7nA1ITQ9h1dzFmH3Zps6JC4vo0
	QuXAY7h+YcQRzUVCB8bS59exP45CRJiNG6/B45/n77hOeXkXc2TEXNCHj3IGxMmKEwhMjIyRJGVvi
	xZ2ctVvQ8JO4Zhj9l33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrdM-00000000CJq-48Sf;
	Sat, 21 Nov 2026 20:24:28 +0000
Received: from morty.yoxcu.de ([2a03:4000:4d:ce0:247a:4aff:fec8:b5a6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrdK-00000000CIq-0SpJ
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 20:24:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F4B51D87176;
	Sat, 21 Nov 2026 21:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795292662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qVTGOF0g2lYLUrQkFxW8jn3nURBAzDjEGsnctCt4OlI=;
	b=r53HDp9sQ+A2FMFvgrbb5uczUG7JsVKJDWMx9Uy4h9TFRbnnXRCv0RvsKJy9rNZCCaN3t5
	ftNh+JJaCtBrKBx4Pb0GY4bk90mUqryzHfjG69AIVW2qP5cFs3Dz0ST6oZ0hHxRaIic3cj
	XaCriiwMaL90OTJWIfxI5pY98XWxufTXl8l4hZpzXH78dTvVkCklQGyI2H2gIA7HoscI1J
	+Jh+I9aP+ShykT3SVi7auCtv8BcOUCZjVDg59Rs6w8XANigf0XnFNJp1L9ixgBZ5XNJJSL
	iK0EJAleQq3tUaQWN57yMkqhHIcu/N8nGXAlK06Re/uyIM4h5lLaChmURvHXCQ==
From: Michael Auer <mick@yoxcu.de>
To: shunsuke@nagashi.ma,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Fabricio Akio <fabricioakio@gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that never came up
Date: Sat, 21 Nov 2026 21:24:15 +0100
Message-ID: <20261121202416.841461-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma> <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_122426_311566_515E7870 
X-CRM114-Status: UNSURE (   5.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shunsuke,

I tested patches 2 and 3 on a OnePlus 6 (WCN3990,
WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1) on a 7.1-rc1 based kernel.

Aborting a connect before association (Station.Disconnect right after
Network.Connect in iwd) now logs "down (never up)" after the vdev stop.
In the 20 minutes of suspend after it, the modem was in sleep 77 % of
the time. Without a fix it never slept after such an abort (0 %, the
phone drew 103 to 205 mA in suspend instead of about 20 mA).

Tested-by: Michael Auer <mick@yoxcu.de> # OnePlus 6 (WCN3990)

Normal disconnects still keep the modem awake on this phone until the
next connect (0 % modem sleep in the same test). As your cover letter
says, the series does not change them. I have a separate fix for that
and can send it on top of your series.

Michael

