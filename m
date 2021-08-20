Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBAEC432BE
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 13:08:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8129610CC
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 13:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8129610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXa/gpzVofYUWh9TBW0dgYlYh3jR2qrngabfQ9darHM=; b=KA6X3y9tRi7uYW
	QU11mXtVRwBd9PJYIbNoqhYg0JLx7Mx6oB91WfQ3IOyw6MYlaxE84I5x1qkkdDwHXrue9osPo2qos
	ewE4doAZ55gGZi4TGwcP1MMAd5kREWb4/CTPgsvf8QjA2z2knvDsJPdxd104LNmhwdmViUZI6iUap
	ZR7NSXXLj6pCQq+oy15/2r69Ne163MyO+YgRqV8IZHucP4ZClPxRUCPOBnVZAUjDallzXY77+wVNG
	CTWgK0QINsJi3kmtAvPfaGdseVI3LCtUV+51zv5xSRIBGUu/BoX/2PHvGY36sib4iU/cbJ44R39VT
	pSxOcZlitPh3LzSmbfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH4GH-00BEc9-KO; Fri, 20 Aug 2021 13:08:41 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH4GB-00BEbH-Q1
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 13:08:40 +0000
Received: by mail-qt1-x82d.google.com with SMTP id r21so7368084qtw.11
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TUaFXYR3HgX7rq/VVrgPte+1/jUiDRhyGavFeUWW8ns=;
 b=qyykdYkmfS+sozWV6prsKemkogSdt6dw3JI6xplGBEyTZrCLVw/V2WrXps+vMYETkc
 8Te8E/naVt9sCYftHN+RQWgeipXTUxRrtvWgldkYCu2Cbe9g6ADwtRoynUE5z+qBzTjG
 54yO9pPGaOTEYQUVc1FEW/T8RQKm7EsP8D7GtvNgk4bFWoxEOLRtHkxavfl9A0+APfke
 fUSP5CH+beQOqMRPOpWAxyXQpPSp8NBKx7ZcRxpsbapjzzBlp12z8K73a7u/zLR3Yi/5
 /eO+ssNjqZxgkZLIbtO1QrlN47VLwXpLqfNwD+gSTbQel6v8qOEG9qHA3WYS7WzopQpP
 XncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TUaFXYR3HgX7rq/VVrgPte+1/jUiDRhyGavFeUWW8ns=;
 b=HG3Vm4PMqIEFKCS6TkdZafmbGUNF28XJ2Teu946phaN/5FeJ3Z8OF0LzlZitFK15OU
 vHKWP72KuD7ZEu48PKbQ0kHOhEzzYWIOIyN5TzrrkKrQ7Cl5l/etXQB5AFryxvOyeaZD
 qPtV/244f1MLuCQiG8aYfkrpCxdOhEUrvE85ctDeOF2qG1dvYh00/aWYY6SPenkIgQxB
 LAWStNncLAc7I4boJSvUOS1fsG1iqdZCpKmhpMqHlI/eC5BfGMSnO1JPgCmXlC8mAsue
 0OETcwYHh7DEtc4iezBTNz+6lVWa0GnYEwNZuao3tPb2hX9Jv2gb9Gs1RmmYYr6OCINb
 mCZg==
X-Gm-Message-State: AOAM532rI+Tb9wSCagguLBzetz6EiL82fu/auU5yuZPV9lL7uuaoZli6
 DOpq6Kj4XzbnJ+p9ENJ+/OFIcLok/bmuv6mDyTpoZg==
X-Google-Smtp-Source: ABdhPJyHXvzqFdkh92xFSl2Tfgr6Wq+GnxyuqFmSQJ3g0FPjwxN9S26JOc0IArVq879EP1YIZ1goBTULRA693ce45J8=
X-Received: by 2002:a05:622a:13c8:: with SMTP id
 p8mr17705841qtk.238.1629464912762; 
 Fri, 20 Aug 2021 06:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
In-Reply-To: <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Aug 2021 16:08:21 +0300
Message-ID: <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/15] create power sequencing subsystem
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>, MSM <linux-arm-msm@vger.kernel.org>, 
 linux-mmc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_060835_892855_6D97E44E 
X-CRM114-Status: GOOD (  35.25  )
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

Hi,

On Thu, 19 Aug 2021 at 18:23, Marcel Holtmann <marcel@holtmann.org> wrote:
> > This is an RFC of the proposed power sequencer subsystem. This is a
> > generification of the MMC pwrseq code. The subsystem tries to abstract
> > the idea of complex power-up/power-down/reset of the devices.
> >
> > The primary set of devices that promted me to create this patchset is
> > the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> > interfaces (older generations) or on serial+PCIe (newer generations).
> > They require a set of external voltage regulators to be powered on and
> > (some of them) have separate WiFi and Bluetooth enable GPIOs.
> >
> > This patchset being an RFC tries to demonstrate the approach, design and
> > usage of the pwrseq subsystem. Following issues are present in the RFC
> > at this moment but will be fixed later if the overall approach would be
> > viewed as acceptable:
> >
> > - No documentation
> >   While the code tries to be self-documenting proper documentation
> >   would be required.
> >
> > - Minimal device tree bindings changes
> >   There are no proper updates for the DT bindings (thus neither Rob
> >   Herring nor devicetree are included in the To/Cc lists). The dt
> >   schema changes would be a part of v1.
> >
> > - Lack of proper PCIe integration
> >   At this moment support for PCIe is hacked up to be able to test the
> >   PCIe part of qca6390. Proper PCIe support would require automatically
> >   powering up the devices before the scan basing on the proper device
> >   structure in the device tree.
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (15):
> >      power: add power sequencer subsystem
> >      pwrseq: port MMC's pwrseq drivers to new pwrseq subsystem
> >      mmc: core: switch to new pwrseq subsystem
> >      ath10k: add support for pwrseq sequencing
> >      Bluetooth: hci_qca: merge qca_power into qca_serdev
> >      Bluetooth: hci_qca: merge init paths
> >      Bluetooth: hci_qca: merge qca_power_on with qca_regulators_init
> >      Bluetooth: hci_qca: futher rework of power on/off handling
> >      Bluetooth: hci_qca: add support for pwrseq
>
> any chance you can try to abandon patching hci_qca. The serdev support in hci_uart is rather hacking into old line discipline code and it is not aging well. It is really becoming a mess.

I wanted to stay away from rewriting the BT code. But... New driver
would have a bonus point that I don't have to be compatible with old
bindings. In fact we can even make it the other way around: let the
old driver always use regulators and make the new driver support only
the pwrseq. Then it should be possible to drop the old hci_qca driver
together with dropping the old bindings.

> I would say that the Qualcomm serial devices could use a separate standalone serdev driver. A while I send an RFC for a new serdev driver.
>
> https://www.spinics.net/lists/linux-bluetooth/msg74918.html

Any reason why your driver stayed as an RFC and never made it into the
kernel? Do you plan to revive your old RFCs on H:4 and H:5?

> There I had the idea that simple vendor specifics can be in that driver (like the Broadcom part I added there), but frankly the QCA specifics are a bit too specific and it should be a separate driver. However I think this would be a good starting point.
>
> In general a H:4 based Bluetooth driver is dead simple with the help of h4_recv.h helper we have in the kernel. The complicated part is the power management pieces or any vendor specific low-power protocol they are running on that serial line. And since you are touching this anyway, doing a driver from scratch might be lot simpler and cleaner. It would surely help all the new QCA device showing up in the future.

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
