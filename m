Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BCCD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPpaot2Svx2MSbq7KY9ZMt5/x26NfewXAR6zENf8kbQ=; b=2+bILbSyhVqXQ8au2CTtEqmCKZ
	k9ZRETqIJ3zi992ltBG7KlUA3UkK9inQXPOmxDlqrc55wIMnRLgL1bySh/7YttioCYBC5cIVxWJ5a
	/NYiYWaksz24GpeRxFR/g6dYUBIKbN3DJ+qsNKVHh2Fzv080PRDYr3WUh2etWvlPsijmG0oRtvAD1
	NgLreHP/RgQHRw/tAj1z0J+QCUFq5DdZ/45wogMr5wUpeclcEyoayrZz0ZXK8pb02x+72QuTbK21W
	p1TK0ht7+7l1KZuRlO07n8PB+82e2vPhxTuTTP5IJuEPIAWjwd3cXscn5b9v06whykqd3F5xrhoya
	sn+nNLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY0T-00000003Ph1-1wdY;
	Mon, 08 Jun 2026 11:19:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY0S-00000003PgY-0h5V
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA40F445A5
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D41F00A06
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917539;
	bh=DPpaot2Svx2MSbq7KY9ZMt5/x26NfewXAR6zENf8kbQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kqjKgFkObqfwVvcVXJkmpZpX1TkQLYU2+UZlp+tpOIg2EQzD0ciQMwI5eKqP5zNNy
	 1MnoAYN3hwHkJNojge4fY+NqquZfjcy1RFbVwG9S5vYZVoS7zIvnokjvKHsnZsatXL
	 rkNjgnxHzxM+NNcXGGfbHCf4YLS0NUpvgH2u75haXaazraTVOdDCnaGnrs9qfizMBr
	 OCXo4+GKRuOhfmzK7xphPdiBEIcJ5D7IVc10xgYL1LHgOXKW5TfbZJEfdl7/0qO9m9
	 EuWqidU/SAy83NacJkFbC1yw+bkT0wGwguF7deGgd3UfJtYIBpIQrvdTVsXuRdl+QS
	 +EgFvL7SjvVuQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso4181070e87.3
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:18:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BSWtfJE0eTqwlonxG8G5kjiA8Z+H80FUTyTNfvn6RTOew1bwzq8SKv1PK7BoJlVSJumk7E1w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt5JRbo32Q6h6vAQenmFuZ1QmQZIWEA77NprlTflUOjO4RSoOd
	X7l2Aauud05tLdNBq0rEgp6rAC3ifHJM9M+BXI6fW4/J1JKi2vv3Cz/eS9gS8DONo+eaXxf3nM8
	5KKZl3m/+W9akViCwrLxedqe+AU88KvC03owQlaWT7w==
X-Received: by 2002:a05:6512:61d3:10b0:5aa:6b85:85cf with SMTP id
 2adb3069b0e04-5aa87babf3bmr2724481e87.10.1780917538408; Mon, 08 Jun 2026
 04:18:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:18:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeyOS=ngzVcu9zHN1g2W60GXHuZgSFozCTSVb1cGxJwMw@mail.gmail.com>
X-Gm-Features: AVVi8CevzSi8FWjqPtdJGMMjRNFkh5D31R7JAhStRKSOzvhr_7JJA4oBvY-YP1c
Message-ID: <CAMRc=MeyOS=ngzVcu9zHN1g2W60GXHuZgSFozCTSVb1cGxJwMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
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
	Saravana Kannan <saravanak@kernel.org>
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

On Mon, 8 Jun 2026 12:50:39 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Document the NVMEM cells supported by the ath10k driver, the
> mac-address, pre-calibration data, and calibration data.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

