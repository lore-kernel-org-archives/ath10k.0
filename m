Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C597C52D6D
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 04:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GsQnhxsqicayvGUucI+ZWGDAQY9dTcFVmUnm38tQ6lo=; b=Ws4Cl7Q+QfRtzvd71y5eGfIFFx
	YHgQ2wEhi+xu8C/XVAQv4xJNatvcxtLDsoSbgBL85feTwQdOrIA5Q44Xgmo2Y3i56Cc0773s1sCp3
	J46mcw+7N5bdidlOCrF8en+lbXdBGC4dLCBxlcFCprATgB33ZLaTPdh9tr4nSsdsBkH1LvoI30umI
	RpyZhlHHPSLd0G7ZBYFA6WxY0wFjZg16EHNBswRLTUzBt3oSFJvCmNNWi5AjA7M/coMpFNNqd45NX
	Wpj1NNcZDEV0Sj4WUs0QEkRu5ltkiIpAOyEvtXH0cVRdXudSxtrlfHKMGf2eoL0Gw1rAygxlAneVR
	tZLzkoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoul-0000000EYMK-1mfb;
	Mon, 05 Aug 2024 04:01:43 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saouh-0000000EYKI-3OU9
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 04:01:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5067C005F;
	Mon,  5 Aug 2024 00:01:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722830523; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=GsQnhxsqicayvGUucI+ZWGDAQY9dTcFVmUnm38tQ6lo=;
	b=OF1LGJsioPiIYWkr11cBsPOSimABMCK3Nb9UjZA9q7p+f4fuNp1OSYFbfH+eCe1GuquS5l
	QphP3P0i1ItRDdVDOSbD7Ura+z9RehCwow5JcrQIQ6vssHQu2TG0gwSMwIW+8glWEj4uZP
	kPTuSBdtFG6YP4zWIO8zmeRPMemZzBU=
From: Felix Kaechele <felix@kaechele.ca>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 0/4] Add support for QCA9379 hw1.0 SDIO WiFi/BT
Date: Mon,  5 Aug 2024 00:01:27 -0400
Message-ID: <20240805040131.450412-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_210140_064648_B2AB9A7D 
X-CRM114-Status: GOOD (  17.52  )
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

Add support for Qualcomm QCA9379-3 SDIO based adapters.

The Bluetooth part is straightforward. It simply adds a DT compatible
string to the existing driver.

The WiFi part is a followup to the RFC I sent back in February [0], that
didn't receive any comments.

Since then I aligned the patch closer to what the driver does for the
QCA6174 rather than the QCA9377, as the latter hasn't been touched in a
while.
With that the driver no longer throws errors for non-existent calibration
data.

The roaming and group re-keying issues still persist, but may not be
specific to this chipset, as this (or a similar issue) is apparently seen
on other chipsets as well [1].
The user impact of this issue is an intermittent loss of connectivity
while the adapter re-associates. Other than that the connection is
stable.

I have tested this patch on a Lenovo ThinkSmart View (CD-18781Y) that
comes with a LITEON WCBN3510A module. The firmware and boardfile used for
testing was pulled from the original Android image. A file at
/modem/verinfo/ver_info.txt on the Android image identifies the WiFi
part as "WLAN.NPL.1.6-00163-QCANPLSWPZ-1" and the Bluetooth part as
"BTFM.NPL.1.0.4-00002-QCABTFMSWPZ-1".

No firmware files are currently available from public repositories, but
they should available from the vendor website [2] for customers that have
the according access.

I can submit the boardfile to the ath10k list once this patch is
accepted. The one that is included with the Android system image has a
sha256sum of 65767cca6a1ff88a9899235acdeeed1e9447a2f16f41d38052202835d5bda7d4.

If someone from Qualcomm could add both the WiFi and BT firmwares to the
linux-firmware repositories that would be much appreciated.
I'm happy to test any firmware before submission, if desired.

Thanks,
Felix

[0]: https://lore.kernel.org/ath10k/20240229032700.414415-1-felix@kaechele.ca/T/
[1]: https://lore.kernel.org/ath10k/c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com/T/
[2]: https://www.qualcomm.com/products/technology/wi-fi/qca9379#Software

Felix Kaechele (4):
  mmc: sdio: add Qualcomm QCA9379-3 SDIO id
  wifi: ath10k: add support for QCA9379 hw1.0 SDIO
  dt-bindings: net: bluetooth: qualcomm: add QCA9379 compatible
  Bluetooth: hci_qca: add compatible for QCA9379

 .../net/bluetooth/qualcomm-bluetooth.yaml     |  2 +
 drivers/bluetooth/hci_qca.c                   |  1 +
 drivers/net/wireless/ath/ath10k/core.c        | 37 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h          | 10 +++++
 drivers/net/wireless/ath/ath10k/pci.c         |  2 +
 drivers/net/wireless/ath/ath10k/sdio.c        |  5 ++-
 drivers/net/wireless/ath/ath10k/targaddrs.h   |  3 ++
 include/linux/mmc/sdio_ids.h                  |  1 +
 8 files changed, 60 insertions(+), 1 deletion(-)


base-commit: aefacd7c75edfaf6690819c1990b851f4c7b50cf
-- 
2.45.2


