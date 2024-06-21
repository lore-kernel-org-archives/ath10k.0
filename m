Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D902C2BA1A
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1xmQpWGsjWQda1p8ndKjiH35/ZHpzAoDvnE7zeCxrY=; b=AxPLgiiiU2ii4i5F8g8qwj0Jpx
	bRzlLGJHOQPkhAvhuOwp9Ynlja1mqhaLBkpr36/8Y1zMivQluo9qbclDGKy5HWKevdWPGHImSGfEW
	N5Hl+90mY70aBUyH8M+IXT0KfPvUSQkUh0fhFh8uiHREuu6IJayu/DVA9OqhqYgB6SHsIX5zxYOAO
	wovT52wWNRbO7HdRV6HrQoc6ZrLPLPlRn2GEFSzCKjzdVoWmHjDNaW4OatFDPrFOTg6ZD5mC+e1kF
	BXVOuBbSjmIqgRoxXShHv77MRVdbeQhYvEI4tar19mAsX7jokNDe6GZhTKQS4dA6owMzO8pBydPhE
	YThU5lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZWg-00000008Jis-0DbB;
	Fri, 21 Jun 2024 08:21:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZWd-00000008JgJ-3Cdf
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 08:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=U1xmQpWGsjWQda1p8ndKjiH35/ZHpzAoDvnE7zeCxrY=;
	t=1718958098; x=1720167698; b=UlINek0FzNw3VDQKkPoUWNX2ntarRG1R2Tt6Q4TI5QJK9YI
	b+QEC7Ds1iwocJ6ymY5YvX/EA/aNmT9CxeNzXXpyfsvPXuTecoAxCj1FsxvR2F8h8afBOPuak8HQ5
	Tc1sg0cVQnCleCeRpGBKbh7KnW++fO/N1qY7M7MEeCv/Nce7gSh4xy4a3NQOSO1mfbBu5peY0viu4
	FIWkrNQiDMSn7zU1i+Idf6/6BcT9ZlDa1Z/Mv8SISOLC/2qATerc5Mxyz9ZcTBtl7krfGOypLO4Es
	obLAzx7G7Elv0OBncuzP415NZVw3fV5iEATMn7y34dpcj6KFOEzYHo9gxcofApiw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sKZWZ-0000000BgQG-1HcI;
	Fri, 21 Jun 2024 10:21:35 +0200
Message-ID: <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
Subject: Re: ieee80211.h virtual_map splat
From: Johannes Berg <johannes@sipsolutions.net>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>, 
	ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>
Date: Fri, 21 Jun 2024 10:21:34 +0200
In-Reply-To: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_012140_109680_2DD22E03 
X-CRM114-Status: UNSURE (   4.60  )
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

On Fri, 2024-06-21 at 10:04 +0200, Koen Vandeputte wrote:
>=20
> memcpy: detected field-spanning write (size 64) of single field
> "tim->virtual_map" at
> ../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.c:=
4043
> (size 1)
>=20

Check out commit 2ae5c9248e06 ("wifi: mac80211: Use flexible array in
struct ieee80211_tim_ie") ... :)

johannes

