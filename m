Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34450FF8867
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00CFuie/XpWwEcDph5j08NpwMgP7MNQHVTxW7dFgKvc=; b=garnYeqyo/RPECHuZCCh5mwwlM
	lyzbs8WM3j0nVagzcyE2kwdZe2pWWK/4KrWVKaWnyMQsTKbnAr3vRjP6sPahpy0f53b7SFR+arbts
	sTApk6pIC9a0Xs3CIexI4NAXWL24B/t018l8qsQps49jiVgOmh8WLIzNr3aNlBK9MOez1MUvdjN7Z
	z+ED06NkaqCYlSaYZ0HmfVfFNHek2uIHwaXRyWGbbMNc8tJWdQib9DfHbIJHJW+VUHkJM/TaZOq87
	uv34txqzrfsVOdGSZUnN8ZxUMi/+DqIMEWU41bZP8xoIAHIvp6yBmYPRN0Zm7hW/WzIR60SZtIef1
	DWdscF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4lu-00000003eVu-0LAQ;
	Wed, 29 Apr 2026 13:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4lt-00000003eVT-00p0
	for ath10k@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=00CFuie/XpWwEcDph5j08NpwMgP7MNQHVTxW7dFgKvc=; b=YdEay/YPN9nqrzuee4LTL4Sqg7
	J1vojd92N2Af3K51G7oDwedo8NtzNSDDpUQID/fzIvW96vpJy6vm0A31gHjzt6nXJVp25teJwHH5y
	g6arMIpBYfulIh1F0zSVsCXZTthQC8Kp028sB8BWN7mSd6/IRdyRMefT9kgWOZmKhPvlMBGyD2z2B
	JELcZNZxFJbN4bFlc2Z+E69sgr04FJbBOLnucinqKn9gI+yOTBlh8e8MZ5DXZntJKvwW2VWIouOjS
	0bY5LBVWldH+l8nV1jzgvedpUrXO2xWesZNKPiCv7mt1emb9IrJchlkt+lnw/5ikGA89IcK5lyrYt
	MKlBxPOQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4lq-00000005N7S-1OGp
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 13:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=00CFuie/XpWwEcDph5j08NpwMgP7MNQHVTxW7dFgKvc=; b=ny
	hjsUcehLWZHWmuH2QESULtjCVCzsB1GVU/3RY7G8eO0LlZxg2TwHfvVGmvv68h2hOgOqaMx5j3zMi
	ZWKXOP8J7vwKYMWMmgN0+IHllH8GYfSvIlBNQPz8hcfTPChEK7Rq6H+eqMH7z5vy7LUOO6ooCm6Qn
	PGTItSJjEk8NOks=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wI4lK-000XF0-0n; Wed, 29 Apr 2026 15:15:34 +0200
Date: Wed, 29 Apr 2026 15:15:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: [PATCH 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Message-ID: <e0adaf64-10d7-4e28-8403-769e3070ec30@lunn.ch>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
 <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_141606_432302_7548178B 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Apr 29, 2026 at 10:53:13AM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 28, 2026 at 4:23 PM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Some devices store the Bluetooth BD address in non-volatile
> > memory, which can be accessed through the NVMEM framework.
> > Similar to Ethernet or WiFi MAC addresses, add support for
> > reading the BD address from a 'local-bd-address' NVMEM cell.
> >
> > As with the device-tree provided BD address, add a quirk to
> > indicate whether a device or platform should attempt to read
> > the address from NVMEM when no valid in-chip address is present.
> > Also add a quirk to indicate if the address is stored in
> > big-endian byte order.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> 
> Is there any reason why we can't extend the existing
> of_get_mac_address() with another property name and use it here? It
> already has support for mac addresses from nvmem.

Does it even need to be a different property name? Is a bluetooth MAC
address somehow different to an Ethernet MAC address? Isn't it just a
EUI-48, independent of it being Ethernet, Bluetooth, wifi, fddi, token
ring, homing pigeon?

      Andrew

