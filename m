Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02641C433F5
	for <ath10k@archiver.kernel.org>; Mon,  4 Apr 2022 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IhV1NN35kcIKh1X6zaNfqI8W2c3jXUPcEjNXnFxCJo=; b=UJdmKkTKta+S3g
	ZG2Chwz3udiJHOZsUdl8wM1B/R6zgcWTydPZmmJQXjdJSVL9jAcx5czD8YN7OiKb6mtWwClj69AgS
	l/tK7rseg6OyJgdFebGQdJCOmd/F4LZY07QEEEFPxpZcIMs7posMGSHYP1nRVHArLgdUx1cENZSjS
	ALaApjtfRUn+AetVGaeBNW4qmFVCyv4rcz4jsKmo6w4zlnlK7vwlvlDUEXuNjlveSWIfJF1tldZ1s
	n6LDWpkjkylV4mu13Az90IyJn7b69f6Cslau+g8hTiKzzo3Peu/AKEE9AuLcl9iDwgS7wXh4TwD6J
	GivonGvPL/ZsHtbvfpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbGvs-00DZVD-MG; Mon, 04 Apr 2022 07:15:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbGvq-00DZUC-2G
 for ath10k@lists.infradead.org; Mon, 04 Apr 2022 07:15:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54A2EB80E77;
 Mon,  4 Apr 2022 07:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3A9C2BBE4;
 Mon,  4 Apr 2022 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649056519;
 bh=33JNaffd8otlV35YViy6jbj0lroij12UsvFEKWkDUX0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=sW9LQZuy5V2Si3gEkIjeOIOiAQBRX6aglO6grAFRG9O9pw26ieOEBWrtM/X2XyeUA
 eTrLOm6sfxpud/rFZx77fief7nxdJfWg0TaSuol3rGNGNh7axFCk+uyvlqw6Sh5Xmt
 4QmBhgWbaF12XqC8LOdIE8xuMEphoME2LZuTP3HNYcZtTdCV8efS0HuBZh1u5j4Pn1
 RejfZws/kQPA5ByQGubSq4MBHsR854bYJmaAxGH2nBkhrVGsFugQOpcWuO8aTgowEM
 hLfMvBSnmCWsNszYkZ0hiWfrfvNeJ0eG9LoNbba7keXTZdo71DQWcQ8ecyTB2TMGPj
 EigQjLnCGK36Q==
From: Kalle Valo <kvalo@kernel.org>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] ath10k: add encapsulation offloading support
References: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
Date: Mon, 04 Apr 2022 10:15:15 +0300
In-Reply-To: <20220402153615.9593-1-ryazanov.s.a@gmail.com> (Sergey Ryazanov's
 message of "Sat, 2 Apr 2022 18:36:12 +0300")
Message-ID: <87v8vps4jg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_001522_316601_6CE5BF8B 
X-CRM114-Status: GOOD (  20.58  )
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

Sergey Ryazanov <ryazanov.s.a@gmail.com> writes:

> Hello,
>
> this series introduces driver support for hardware encapsulation
> offloading feature.
>
> The main goal of the series is an overall improvement of system
> performance. On a QCA9563+QCA9888-based access point in bridged mode,
> encapsulation offloading increases TCP 16-streams DL throughput from
> 365 to 396 mbps (+8%) and UDP DL throughput from 436 to 483 mbps (+11%).
>
> The series consist of three patches, the first two prepare the code, and
> the last one introduces the offloading support itself. The first patch
> reworks transmission status reporting to make it flexible enough to
> support 802.11 and Ethernet encapsulated frames reporting. The second
> patch reworks the module parameter that configures the main
> encapsulation format of frames that are passed from the driver to the
> hardware. It makes it possible to configure more encapsulation methods
> than just raw or not-raw. And, as stated before, the third patch
> actually introduces offloading support. It changes a couple of frame
> analysis places along the xmit path and starts reporting offloading
> support to mac80211 via the corresponding hw attribute.
>
> The new feature has been extensively tested with QCA9888 and works well,
> but it may introduces some regression for other untested chips. So the
> series is just an RFC for now.

This looks very good to me. But the testing part concerns me as well, it
would be good to have some quick testing at least with QCA6174/QCA9377
PCI devices to make sure we don't break those. Preferably also
QCA6174/QCA9377 SDIO devices should be tested, they work somewhat
differently. Can anyone help?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
