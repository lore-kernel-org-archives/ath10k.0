Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68614C4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 15:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CCF610A3
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 15:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36CCF610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5kM+Qgd1rEZC3ORGRtxNq7HElvmiCWrB5FwVmYWkz4=; b=boHCpnPK+MxSGs
	A/pyyp/gWli9aXl0QUc/oaVI/WeiC9hmQQ+Cq5a2CxkhEqTqkkYK+po3rgR6xb2f49F7dxRNvgjwL
	D/c2loKGJQgj/l52J9ZlijEzn6fWy1JIibE1SYUOyexBcHfpwFalmGFhbLXjMi5f847wHlLAYMwXb
	QxNN86kSoiaO4J/z7av9hzNao717gMN72mrX/4zKIDPmYD3LoKm8fJCHIG4cdkBj6iWZq1ZPCVEjU
	CosRQDW7cIwK9/GxGy2ZvyY6QzdqsgM9zP+AUHLo6J8oT4V7+3YkYld/oNwYCqNX+IlxswoOjQMC5
	nSnx1OnDMRFKf7m9ud8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjtS-008oHX-FB; Thu, 19 Aug 2021 15:23:46 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjtM-008oGg-3C
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 15:23:44 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 04B76CED17;
 Thu, 19 Aug 2021 17:23:37 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH 00/15] create power sequencing subsystem
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
Date: Thu, 19 Aug 2021 17:23:36 +0200
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 MSM <linux-arm-msm@vger.kernel.org>, linux-mmc@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Message-Id: <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_082340_329024_1A8311D1 
X-CRM114-Status: GOOD (  27.67  )
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

Hi Dmitry,

> This is an RFC of the proposed power sequencer subsystem. This is a
> generification of the MMC pwrseq code. The subsystem tries to abstract
> the idea of complex power-up/power-down/reset of the devices.
> 
> The primary set of devices that promted me to create this patchset is
> the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> interfaces (older generations) or on serial+PCIe (newer generations).
> They require a set of external voltage regulators to be powered on and
> (some of them) have separate WiFi and Bluetooth enable GPIOs.
> 
> This patchset being an RFC tries to demonstrate the approach, design and
> usage of the pwrseq subsystem. Following issues are present in the RFC
> at this moment but will be fixed later if the overall approach would be
> viewed as acceptable:
> 
> - No documentation
>   While the code tries to be self-documenting proper documentation
>   would be required.
> 
> - Minimal device tree bindings changes
>   There are no proper updates for the DT bindings (thus neither Rob
>   Herring nor devicetree are included in the To/Cc lists). The dt
>   schema changes would be a part of v1.
> 
> - Lack of proper PCIe integration
>   At this moment support for PCIe is hacked up to be able to test the
>   PCIe part of qca6390. Proper PCIe support would require automatically
>   powering up the devices before the scan basing on the proper device
>   structure in the device tree.
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (15):
>      power: add power sequencer subsystem
>      pwrseq: port MMC's pwrseq drivers to new pwrseq subsystem
>      mmc: core: switch to new pwrseq subsystem
>      ath10k: add support for pwrseq sequencing
>      Bluetooth: hci_qca: merge qca_power into qca_serdev
>      Bluetooth: hci_qca: merge init paths
>      Bluetooth: hci_qca: merge qca_power_on with qca_regulators_init
>      Bluetooth: hci_qca: futher rework of power on/off handling
>      Bluetooth: hci_qca: add support for pwrseq

any chance you can try to abandon patching hci_qca. The serdev support in hci_uart is rather hacking into old line discipline code and it is not aging well. It is really becoming a mess.

I would say that the Qualcomm serial devices could use a separate standalone serdev driver. A while I send an RFC for a new serdev driver.

https://www.spinics.net/lists/linux-bluetooth/msg74918.html

There I had the idea that simple vendor specifics can be in that driver (like the Broadcom part I added there), but frankly the QCA specifics are a bit too specific and it should be a separate driver. However I think this would be a good starting point.

In general a H:4 based Bluetooth driver is dead simple with the help of h4_recv.h helper we have in the kernel. The complicated part is the power management pieces or any vendor specific low-power protocol they are running on that serial line. And since you are touching this anyway, doing a driver from scratch might be lot simpler and cleaner. It would surely help all the new QCA device showing up in the future.

Regards

Marcel


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
