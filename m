Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF01FC4320E
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DC56054E
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0DC56054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X2aH70kS+g8QoGxzR1zKIeuxrSWLadopCmuewdDhlhI=; b=Pc5YWTR2KDBsCF
	CPBjpyg9h4LpY9klZnFWeEvmhRswMnLjCdnro+2Tktwl2oY8Nmy4MrbZFJBZ4z+4p7lDn38MuYjKe
	+5lyjCYdK3Pt3vz9zQ/DV9+cZPV1TFhw3xS9AC1d+fpn08EipwCEBetSow6VAElPPDOy4ZHQHGZVx
	PM2ZzVm9sleCHRy3uFOtVBn7a9VN6jWxOtR7tVk6+5yClJVVxOA/FsVtoUWGMdLCl38yhy/feC3eM
	AtKLyu9Q+JzyHOp5L75MizxSvtOK1LBdre5Qw+frtMsrAzfmjfpHI6j+kNW4PexAYVUd1PJlFsgya
	bGwjcKwJjtOMN/mtk57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnNw-000cBK-P1; Tue, 17 Aug 2021 00:55:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNr-000c9A-TZ
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id i28so8804941ljm.7
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C/jXyVM8A6IIIf73CUW3opic/WD75vfkmRvuKQWW4Jo=;
 b=Ilqv4TYrhWro5ne/pyK8Z8uNieTgQV6uYOzuf7BRghGmB8vnlhfGvOr/0/e/S1IwQs
 7hQf66rKkZbN2FzNg/lAkY8kGf8968Opho/WF3Oda7z3Bq5zGkHWUDeKdTIMK9vnpdcr
 Q21Q+ebQypHAX5SMsmdNk0shvXZpPmldQV8JkAnN+rTBj1EPUQqbI161vTAsodd2SjvZ
 MCqb1O1Ze+1fb4BtL/U3gENTSpiIzkKkc+t3xLBPezJesXnuxw+T6kn1KhGum0t21LcO
 jMIXT/hfLcwRdk65I9OuXZg0sgiZ+Ph1sisDURKJYN/RBaSvnazEEt1aLfLUFDVTen6Z
 an+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C/jXyVM8A6IIIf73CUW3opic/WD75vfkmRvuKQWW4Jo=;
 b=cHkD4wbB02toC0YJhNiHZXeg5Hmq+yDquI9la9Nl3R/flyqF6fujpSgXjga2u9EfZ2
 6eITnvBIO3Qaej+m15wPsH1TBi52Xvcmi8cLeg9EiQwCR/HAburAZZvPBzHM/Z5b/UL+
 EWr6XhLIyVE7OqAHrOPkgj29akHX8tr1I6sTLwxtNZPvpEkg5nPjuWZlu5z8iE0udVSI
 lQFsHavuM1H6QtKT1UW2pFCPThx7MuajUPBrBWUs0bQ29pXIkH2Wu3Unx2+27n6x3N74
 2RLKuZCOEM2Y3eXMUhB7dShuYSkuRcb+9MnpuMyseibchJfzzIb/iCm+vB2EVb1h9zgP
 DBcw==
X-Gm-Message-State: AOAM532+51EZrOMq1a7CCslAci6tPGnJ/L/WVvCCF0x8ZC6+DKkhlvW9
 Bm/Ctk/LnS9/Xmj5FCQ3ns8Ifw==
X-Google-Smtp-Source: ABdhPJxgPqsyxqeCXBI3IsVJLkcFyXipmzYz3hTJEmurF1pvQfTvThKjXBvusty3YDmk6qnRjBkDxQ==
X-Received: by 2002:a05:651c:118f:: with SMTP id
 w15mr779302ljo.47.1629161713357; 
 Mon, 16 Aug 2021 17:55:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [RFC PATCH 00/15] create power sequencing subsystem
Date: Tue, 17 Aug 2021 03:54:52 +0300
Message-Id: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175516_008427_FA48FF9F 
X-CRM114-Status: GOOD (  16.27  )
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

This is an RFC of the proposed power sequencer subsystem. This is a
generification of the MMC pwrseq code. The subsystem tries to abstract
the idea of complex power-up/power-down/reset of the devices.

The primary set of devices that promted me to create this patchset is
the Qualcomm BT+WiFi family of chips. They reside on serial+platform
interfaces (older generations) or on serial+PCIe (newer generations).
They require a set of external voltage regulators to be powered on and
(some of them) have separate WiFi and Bluetooth enable GPIOs.

This patchset being an RFC tries to demonstrate the approach, design and
usage of the pwrseq subsystem. Following issues are present in the RFC
at this moment but will be fixed later if the overall approach would be
viewed as acceptable:

 - No documentation
   While the code tries to be self-documenting proper documentation
   would be required.

 - Minimal device tree bindings changes
   There are no proper updates for the DT bindings (thus neither Rob
   Herring nor devicetree are included in the To/Cc lists). The dt
   schema changes would be a part of v1.

 - Lack of proper PCIe integration
   At this moment support for PCIe is hacked up to be able to test the
   PCIe part of qca6390. Proper PCIe support would require automatically
   powering up the devices before the scan basing on the proper device
   structure in the device tree.

----------------------------------------------------------------
Dmitry Baryshkov (15):
      power: add power sequencer subsystem
      pwrseq: port MMC's pwrseq drivers to new pwrseq subsystem
      mmc: core: switch to new pwrseq subsystem
      ath10k: add support for pwrseq sequencing
      Bluetooth: hci_qca: merge qca_power into qca_serdev
      Bluetooth: hci_qca: merge init paths
      Bluetooth: hci_qca: merge qca_power_on with qca_regulators_init
      Bluetooth: hci_qca: futher rework of power on/off handling
      Bluetooth: hci_qca: add support for pwrseq
      pwrseq: add support for QCA BT+WiFi power sequencer
      arm64: dts: qcom: sdm845-db845c: switch bt+wifi to qca power sequencer
      arm64: dts: qcom: qrb5165-rb5: add bluetooth support
      arm64: dts: qcom: sdm845-db845c: add second channel support to qca power sequencer
      WIP: PCI: qcom: use pwrseq to power up bus devices
      WIP: arm64: dts: qcom: qrb5165-rb5: add bus-pwrseq property to pcie0

 .../{mmc => power/pwrseq}/mmc-pwrseq-emmc.yaml     |   0
 .../{mmc => power/pwrseq}/mmc-pwrseq-sd8787.yaml   |   0
 .../{mmc => power/pwrseq}/mmc-pwrseq-simple.yaml   |   0
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  51 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  28 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   6 +
 drivers/bluetooth/hci_qca.c                        | 286 +++++++-------
 drivers/mmc/core/Kconfig                           |  32 --
 drivers/mmc/core/Makefile                          |   4 -
 drivers/mmc/core/core.c                            |   9 +-
 drivers/mmc/core/host.c                            |   8 +-
 drivers/mmc/core/mmc.c                             |   3 +-
 drivers/mmc/core/pwrseq.c                          | 117 ------
 drivers/mmc/core/pwrseq.h                          |  58 ---
 drivers/mmc/core/pwrseq_emmc.c                     | 120 ------
 drivers/mmc/core/pwrseq_sd8787.c                   | 107 ------
 drivers/mmc/core/pwrseq_simple.c                   | 164 --------
 drivers/net/wireless/ath/ath10k/snoc.c             |  63 +++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
 drivers/pci/controller/dwc/pcie-qcom.c             |  13 +
 drivers/power/Kconfig                              |   1 +
 drivers/power/Makefile                             |   1 +
 drivers/power/pwrseq/Kconfig                       |  57 +++
 drivers/power/pwrseq/Makefile                      |  11 +
 drivers/power/pwrseq/core.c                        | 411 +++++++++++++++++++++
 drivers/power/pwrseq/pwrseq_emmc.c                 | 118 ++++++
 drivers/power/pwrseq/pwrseq_qca.c                  | 291 +++++++++++++++
 drivers/power/pwrseq/pwrseq_sd8787.c               |  97 +++++
 drivers/power/pwrseq/pwrseq_simple.c               | 160 ++++++++
 include/linux/mmc/host.h                           |   4 +-
 include/linux/pwrseq/consumer.h                    |  88 +++++
 include/linux/pwrseq/driver.h                      |  71 ++++
 32 files changed, 1592 insertions(+), 789 deletions(-)
 rename Documentation/devicetree/bindings/{mmc => power/pwrseq}/mmc-pwrseq-emmc.yaml (100%)
 rename Documentation/devicetree/bindings/{mmc => power/pwrseq}/mmc-pwrseq-sd8787.yaml (100%)
 rename Documentation/devicetree/bindings/{mmc => power/pwrseq}/mmc-pwrseq-simple.yaml (100%)
 delete mode 100644 drivers/mmc/core/pwrseq.c
 delete mode 100644 drivers/mmc/core/pwrseq.h
 delete mode 100644 drivers/mmc/core/pwrseq_emmc.c
 delete mode 100644 drivers/mmc/core/pwrseq_sd8787.c
 delete mode 100644 drivers/mmc/core/pwrseq_simple.c
 create mode 100644 drivers/power/pwrseq/Kconfig
 create mode 100644 drivers/power/pwrseq/Makefile
 create mode 100644 drivers/power/pwrseq/core.c
 create mode 100644 drivers/power/pwrseq/pwrseq_emmc.c
 create mode 100644 drivers/power/pwrseq/pwrseq_qca.c
 create mode 100644 drivers/power/pwrseq/pwrseq_sd8787.c
 create mode 100644 drivers/power/pwrseq/pwrseq_simple.c
 create mode 100644 include/linux/pwrseq/consumer.h
 create mode 100644 include/linux/pwrseq/driver.h



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
