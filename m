Return-Path: <SRS0=gUy0=NU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A1DC432BE
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22F36023E
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D22F36023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o28qkl9hFVU3ChV8QAg20CeTyUU5ToH37pWY7ZQbN40=; b=VMVQDZgZ6J2536
	2Jd3ErLVHksuXSED/Tpf2veImiuvff8I1Xnsnb/8FA9+Vwdn/x75VZYY9Qlrt08TzIWdvSXVdCXkR
	mbg5e30LMS/rhZDDIRTRNHEchO+sRu3aBXHwW+8IyBkfsqqqi1yJBSgvUWt+tp48c5eoJNREyXucm
	i1XmQ12ZH8LRapn9ju11irsvHZbfbqqhS0qKykwbWgaYbDe96z2ufzd8VQw7LjknJd+Jmn3O2JP20
	MPefqWawo4Qjbrwlqwn5pUxkJ43hySkYUSUFHK7RSuYWX/t0HTuvAdvdTH2hD9rx7GMsUjXEdkgfa
	GyH46UuqFHsuC7Fw/Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKKci-00FWvQ-Rp; Sun, 29 Aug 2021 13:13:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKKcb-00FWrr-B0
 for ath10k@lists.infradead.org; Sun, 29 Aug 2021 13:13:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id k5so25303480lfu.4
 for <ath10k@lists.infradead.org>; Sun, 29 Aug 2021 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VaIELk3aejG928b4attVmLHeHooVAXSsVOw7u++6ic8=;
 b=NBuVmcUEZj+2izFzWo7km7GIur/VKIWIdCygLu4Gtd5j+RVmNsWMrgh04N2TZuSMfU
 qOCfcwDEjE8ZtdKrslnPtXszndze+62w2XWwb6xGVsH1q3jBWtuTLCb9KuSLNbPPRhlK
 IbpDOICgqNbLc24No+PMG8DhLUM2mN/elJS0GRGV4rFr6iSEdeGZxaI/ykar8IBYY9uy
 Mctoi0prxcBGI+UT9DvbqIAUUP2Iz4yWSGuhWEeXcrakwQ1fy45teTG3uj0aqnye2YP6
 lXtLTZX24wvaqQuWHyNbc/msMLpxxBuORKzKEUoSATLWOgQ2fAAvsiPWesmAzPXBNpqI
 WsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VaIELk3aejG928b4attVmLHeHooVAXSsVOw7u++6ic8=;
 b=shyn24IvXxrc8PT03Nd/yMt13ny3N0f3cUezGIsyU4IopI6ee+sYUKs9LpSUCtd7yk
 qf8zmtGQyYOeLgY8s19ChmoX+VJvckE5zM7IbJzD0sqokXYCv2zlRx9RtAm6MHBwNHHv
 PWNB9qpjxR37wGdJayClZElUpD+0SgUxZWVwYDROgpIgEqifwqXR56tY+blNSSLWeOxv
 jawuWV8FgpXADXeVSWysT7h/3LH7xJ8+HlcREBH5oJAPHlhhKKbHAK2867lW+C1OkBy3
 gCe6BOB99ifWFuadLjdO7tKqVA5YZ41Hx/vVK2L9NW5ZDdSAPfUyXw1IEyJGmdN914II
 II2Q==
X-Gm-Message-State: AOAM53157J69jcWklF2wFjldPKY/5gZDSpLXYscnEF6Dig5hPz9TGA9W
 wNs69/PaiJns6MScG57eTYk3cw==
X-Google-Smtp-Source: ABdhPJxoTTCTULxN0AI0ux6Ox/vGsWyAWulCZNHRsyc3AM9WfbWCnshA9YjeDZK67Cxvk0WaVZLaHA==
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr13935373lff.184.1630242789821; 
 Sun, 29 Aug 2021 06:13:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 06:13:09 -0700 (PDT)
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
Subject: [RFC v2 00/13] create power sequencing subsystem
Date: Sun, 29 Aug 2021 16:12:52 +0300
Message-Id: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_061313_487064_88795EF5 
X-CRM114-Status: GOOD (  14.46  )
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

This is the second RFC on the proposed power sequencer subsystem. This
is a generification of the MMC pwrseq code. The subsystem tries to
abstract the idea of complex power-up/power-down/reset of the devices.

To ease migration to pwrseq and to provide compatibility with older
device trees, while keeping drivers simple, this iteration of RFC
introduces pwrseq fallback support: pwrseq driver can register fallback
providers. If another device driver requests pwrseq instance and none
was declared, the pwrseq fallback code would go through the list of
fallback providers and if the match is found, driver would return a
crafted pwrseq instance. For now this mechanism is limited to the OF
device matching, but it can be extended further to use any combination
of device IDs.

The primary set of devices that promted me to create this patchset is
the Qualcomm BT+WiFi family of chips. They reside on serial+platform or
serial + SDIO interfaces (older generations) or on serial+PCIe (newer
generations).  They require a set of external voltage regulators to be
powered on and (some of them) have separate WiFi and Bluetooth enable
GPIOs.

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
   powering up the devices before the bus scan depending on the proper
   device structure in the device tree.

Changes since RFC v1:
 - Provider pwrseq fallback support
 - Implement fallback support in pwrseq_qca.
 - Mmove susclk handling to pwrseq_qca.
 - Significantly simplify hci_qca.c changes, by dropping all legacy
   code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
   parts of the chip.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
