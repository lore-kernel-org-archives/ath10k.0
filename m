Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A787C55167
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9twirzm5nktw8mCQZKCsisWF22u3KfRsBskDwndW4Kk=; b=wUK3vJjPgyZz/Cqf96xoUVoHfI
	WCQGZhZGzxikWGx1x6IGlJzUHgllRCUjxPzJWF1s2xky+UgdUwv0M78SsCBfU1ddQzThMXUIWycQ3
	ExLOIByfoHC4FaE5oXyA85uRQSAybcGFl0YIKKZ8w6YsYLixSOgXhOoZMEj4op4CeTedsq7Go2qwN
	vqKpM5l7Zcha1yMbxuwWaT4LD6iKyx7pAYuXMG6iyBOxosB7ErbVl5aglHZWw2vYBOZ9Xxe3UlhJ/
	AFriph/Qt3Ej8ygREvw6c0rPDOkHMYVGEQHCRrDmT1yG2WFSOg2BK3yeaon1Mu+yxkpzdaH3Sd3wi
	OHIleMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpim3-0000000C599-3yLF;
	Fri, 31 Jul 2026 08:39:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpim2-0000000C58s-3sUI
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 08:39:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B7FA60A7A
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67201F00A3E
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487161;
	bh=9twirzm5nktw8mCQZKCsisWF22u3KfRsBskDwndW4Kk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cjb/dd+51J8KLsvFQz1XCBr/Eh1elTDHf+94E8yxXnjPA5Myp3+d9527UZ63cP7DX
	 A/uoKegoL+ZNdNCEWYYyIKjekXBIQn+ciLwfj17ngQElOo0YP1TstGOhIa3UwLRfij
	 9RJ5sDQoLVxRcS5HEXowRGtJAUGRaCfTfuhjwJsOXK0kqIdRBuIAJRXaWOELobG7+p
	 RFrL3UjoS19yoc2drI2021i472x/CxOXQCElYIFZVtqMoP3Fu9NjZ8nKxH1sK1CCXA
	 ST31OZhhFcckXXFUZ5hsL05RIUGw79RMw7GKySri7MEgHiUGOWpmg/P+5Kc+w9jyAU
	 FyHv+39gTplaw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so6373651fa.0
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 01:39:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLMHn8JhNHLwLT5WskU0WZpQb1LlHWCK7X97zRYGiwhAKTNExUgHH1ZV/FajRysi1UB3xJcI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHwOKYdla2onwsiDjDoieQoElfCUXiNoVJ74w8EKJjujDIszLZ
	nsqhcXx5M9GvFPg7Z6afwL3SGRL6+SuZ40nHRKWbMFDUaHEffsKClQ9tHeFCN7hjNO5in/dFkac
	7DhscHYTz5pAUA81zTiZGsQvcNhkL3ADk6Ou6Modkuw==
X-Received: by 2002:a2e:a806:0:b0:39a:fec6:efd0 with SMTP id
 38308e7fff4ca-39f7e3b70e1mr2581091fa.23.1785487160524; Fri, 31 Jul 2026
 01:39:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 01:39:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 01:39:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com> <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 01:39:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdRd-FgAa+NMf-GZLi05G8PrGjD9LB2h7dQ=9iXiLh9sw@mail.gmail.com>
X-Gm-Features: AUfX_myHE9QF2TZrMuCq1Fl8GoUB-sokgcKRRxyeNwASqhiRSWL8Z59R0TWE-vo
Message-ID: <CAMRc=MdRd-FgAa+NMf-GZLi05G8PrGjD9LB2h7dQ=9iXiLh9sw@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 30 Jul 2026 18:00:31 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

