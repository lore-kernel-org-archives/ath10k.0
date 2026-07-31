Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C4C55167
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C3kzKsjx1i/oqnnr7TqivG/v2a5qqKglXp3keQit4E=; b=UN34RPauU//T7KtqiEain22Iy4
	u22bMBmCNcQbgGFIYXTfCbQhArpm9xZsDYmyHLX/C1tOJe0YMlK8B1f9DBDQ5EDhbRmNroLLCf1Mm
	RhmHGXiky5taPPc6FDRYtjip/+PFKh6uPxjoVBUjKxMqpi+uCvIGj5WydQCyxL/1HCLB6LPlWn+0Y
	ZQ7Ix+CY2d3Kud4O+IAkm+TfsN2Hu2vVfoB78cBiYve6sIMUbKL4SEaGe4mOZJ0SDlmdDE8bEH1cl
	c2Sgjy0vvliuYAxOomj7TR00AVXVc2N3HcnwiftXJPG521UXT7m5f7ssBJs2kZZutrQ2yvW4op8UC
	oVWs7Cow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgoo-0000000BtJq-4Av7;
	Fri, 31 Jul 2026 06:34:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgol-0000000BtJM-2qKN
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 06:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1C3kzKsjx1i/oqnnr7TqivG/v2a5qqKglXp3keQit4E=;
	t=1785479643; x=1786689243; b=Uwa6oWyEJQ2BdRcxlliqxPbBL4Ho/oWQ3nLU1CVBPW8UanY
	AdUppBqVz5B3WViIBbf8fI8dyNgIEz0KhF8fQtzHmFE/vPl95ftooNtPObJTE5txrzBt+mGhQR2mn
	fL4hfkUnCyx0PX/vXHzxx9v9TcUEOVP+2hIOPxIGSG8kYe3gwW51fKN8SIlgdFl/35Vi+hn1q+HKZ
	3wQ76mrwCGQrez6qWscTD8VSUZMTeGoksa5/wiY76C8CPJABHjxY0a4VIYnZrS1leL1cixyiTsvrO
	4r5YV90yg178piaE60I0RPRM/6JD/38gKkma2pA5wWY4cTiYCfHBd50sn8xWCAVQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wpgoZ-0000000CyEL-34Zo;
	Fri, 31 Jul 2026 08:33:52 +0200
Message-ID: <60bba9a844d8fe0a94d19b8e59f52b4b36e9a35a.camel@sipsolutions.net>
Subject: Re: [PATCH RFC v2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, david@ixit.cz, Jeff
 Johnson	 <jjohnson@kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Michal
 Kazior	 <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Date: Fri, 31 Jul 2026 08:33:50 +0200
In-Reply-To: <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
References: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
	 <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_233403_996529_F54EB1F1 
X-CRM114-Status: GOOD (  16.19  )
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

On Thu, 2026-07-30 at 19:24 -0700, Jeff Johnson wrote:
> On 7/19/2026 2:45 PM, David Heidelberg via B4 Relay wrote:
> > From: Richard Acayan <mailingradian@gmail.com>
> >=20
> > The WCN3990 might split MSDUs among multiple "in-order" indications. Th=
e
> > driver needs information from previous indications to handle MPDUs that
> > are not started by the same indications that complete them. Move the
> > list that tracks unprocessed MSDUs to the driver state so the driver ca=
n
> > handle MPDUs that are split in this way and be less confused.

> I'm transcribing a few comments from my review agent (which may overlap
> Sashiko). I have not vetted them for correctness. Hopefully I placed them=
 at
> the correct spots!

I think this is one of those cases where just doing LLMs isn't all that
helpful?

I'm not at all familiar with this, but why does this really need all the
complexity of hanging on to the entire MPDU etc. when "[the] driver
needs information"? Couldn't it just hang on to the relevant information
and reduce the complexity here?

Also, the entire point of this is for the loop, so when the LLM says:

> > +	msdu =3D skb_peek(list);
> > +	rxd =3D HTT_RX_BUF_TO_RX_DESC(hw,
> > +				    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);
>=20
> Dead rxd computation before the loop =E2=80=94 VALID, MINOR

I feel like it's probably missing the point entirely - the in-loop
version should be removed?

johannes

