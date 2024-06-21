Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39DC27C4F
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6/YZMi1PRGyzwGqfPMZsqRzJZeRppnMfWSGALa3LgI=; b=qN70kQ5NJFMNLIm7EORzNj62O3
	Bdk6LSvIUILhzPbOmPg/AJzLiBtNjKpU0sKqNy0ij+os4fy35jFaHH+tMX3FpUuF3rWAwFd2c6a0Q
	Z+4WLYvleo7dGlzMajBYuco7cYypGXEi8dO7invbEz+S7RhHMCXEL8CvdfxLLhsUsCt5lfAHcUg6x
	LzM29EWZKdNzR3uqfZtbgXEIIiTHNCpzsYmEKdukXTxllxHVi3ot1M4P6JdnYskYuEc3bYjHzgyJi
	Pq9HIAGLInX9AIeJ+JA51Dcn8if5IRPHCb2B9qn+2xG/Ju3usJdJyul0yAXrxhy5yzBiDglzhRW8N
	Toxbi82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKab2-00000008YWv-3p5G;
	Fri, 21 Jun 2024 09:30:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKab0-00000008YW5-17Mj
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 09:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=l6/YZMi1PRGyzwGqfPMZsqRzJZeRppnMfWSGALa3LgI=;
	t=1718962211; x=1720171811; b=DLkP7TVJ9Dcgo39xbMu9CdhIz1iiH5NAkNe9YUDvfINEDVx
	/z7PFvK2YPPEImCvZfQdoxOhbwkFOSey7pEZDM4gD7FQJE2Ar/ZB/knZTGpy2dhzFsOectKwhTxEz
	ILOEDDUDPBgse4hjvU/3zz6ezihk9SM56eS10d4io30Z/GiI6l7E7phse159WzbveVorcz+KF3vqq
	vRSPLnDRrWUnsNd3SgRLh2xcTtneUKOEQUEfk/UZuNTl63zDA9g2bvE9jMfky5c6NbEWaOl/cpGgE
	IUxLwz6UOYTCmZueXMqC5o1wfjczGrfTaMff0U/x4WjG5xuaP3hziWRmKJLkvB7w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sKaav-0000000BjuR-0ohh;
	Fri, 21 Jun 2024 11:30:09 +0200
Message-ID: <83fcb33e3fadb457466126255297899fbc4186f8.camel@sipsolutions.net>
Subject: Re: ieee80211.h virtual_map splat
From: Johannes Berg <johannes@sipsolutions.net>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>, quic_jjohnson@quicinc.com
Cc: ath10k@lists.infradead.org, linux-wireless
 <linux-wireless@vger.kernel.org>
Date: Fri, 21 Jun 2024 11:30:08 +0200
In-Reply-To: <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
	 <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
	 <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_023014_327654_1BA2A718 
X-CRM114-Status: UNSURE (   2.53  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


> will this one get backported also?

Why? It's not even a bug.

johannes

