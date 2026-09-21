Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD53C982DE
	for <ath10k@archiver.kernel.org>; Mon, 21 Sep 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDN5tiTALp2HjdaynTUWOVRoE4KJy7qUfZYfcVAfO6M=; b=pH6y82eY1bv0iU9VkAJhKKLh25
	Kj928FxEJeEEhX5o0sakqqDkID2b3Fp7DkjH/TRA8Qa9ZvxeFNUgFP8yies75pZ5IpfYC8tVRuMYD
	O1Sk/EWnhXznJH2bXwBXbz53l/b3SEJMlhxyWaYxKVFzF2PhBEXoLQdekhKTufffNchGSRWsZPteL
	l2dqwJpMCoE2cEtuuhLtfE0g85DlcGLP+1YWse0VSW+u7VU4ofu+kVYBN6SK60RkIyaRr9MbzSAxr
	amTAfAc2RCw96xkD71D4AS0JHQm4eAiOi//f+hM36FnnSHU4XY2TXibEaP+I3vgEehyZRCZDvuq9+
	q87g2RIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aIn-00000001VIj-1hzx;
	Mon, 21 Sep 2026 09:27:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aIl-00000001VIR-2JYA
	for ath10k@lists.infradead.org;
	Mon, 21 Sep 2026 09:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8988600C8;
	Mon, 21 Sep 2026 09:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1B31F000FF;
	Mon, 21 Sep 2026 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982826;
	bh=HDN5tiTALp2HjdaynTUWOVRoE4KJy7qUfZYfcVAfO6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SCPakuZ00OQvwOBru74VDnsKgxqtvVnrpR4I4DTicBqplzKxQ1/JHVYalVOy+fBXi
	 phx16fde0X+tPcXeoa0K3HI7/4FErzYLoUE19z7668esyTacgyXRl2vi0aqLXzrzny
	 xE3I9ulze6NBKfB8UUyrdOi+/sNT/7ZKDg+Yj4RTK2u9fr8JYKuMo1E5yCg0K9LYcX
	 9kFWWkaRbnDDmv8uANkCdutrg7zm6ZK2w1zE5nXsd6D3TjbJUPJmmDupo0zzl94mcR
	 vTNy3USx3CuoctNsxdOYI2NHDisLrB/u7y1ol6g+vlVg4HRks82m8D8b3NVJK4T08o
	 8wktRkjTt4ZAQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, daniel@makrotopia.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Christoph Hellwig <hch@lst.de>, 
 Piotr Kwapulinski <piotr.kwapulinski@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
Message-Id: <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 10:26:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> On embedded devices, it is common for factory provisioning to store
> device-specific information, such as Ethernet or WiFi MAC addresses,
> in a dedicated area of an eMMC partition. This avoids the need for
> and additional EEPROM/OTP and leverages the persistence of eMMC.
> 
> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> Bluetooth Device address are stored in the eMMC Boot1 partition.
> 
> [...]

Applied, thanks!

[04/10] nvmem: layouts: Support fixed-layout as the nvmem device node itself
        commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


