Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF515606A334
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zzbOGqS1;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rxAzhwTU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=; b=zzbOGqS1n/advBClBXtU1L+cWt
	pZv4v215PMynTRsVVBfZLgHGnz8w2sW9wLpsXfWzJaZgkzm1y74bdcHC4idgXY4dh56NYvTCPx+X6
	gyzj5TJT/u1Wj117onpgGL3NvsfpeWgpfJcTSZiLKgwWWhPbG4Rc8dp1OpVqAoglNhYVYVHbnAQIr
	bK7G9L0IzGKZsjH7KFiT9iFSnOsDUWJw7PkRA8K+T1LXlw202krnVKkC2fqhZSxBsTpo1M8MhVzm4
	XKiC94vKkXy5xEooGBVj2uEIAeb2eFUa1iyki4ozz5EB8nXtfiVDNqz0EERZLVC7/Vdem5WWVw1JU
	YISxoViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpHr-0000000019g-3vhR;
	Sat, 21 Nov 2026 17:54:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpHo-0000000018h-3i2X
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 17:54:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c4322d310e7so351355366b.0
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=rxAzhwTUnDRJYfTErvaNqtZCstuXi8HJ/4LUnlYuqfbKyDauJAxhpNkBvum4itjDzU
         +CUjfoLmr7Ek4lNBwe/SG6klOn+G1pnbv0ihlnm4E68fDmMeydXq2Ux5dmW6Y4MjLDv8
         YD6n2x4Ek1BTxihvsHArIRwyF396i766dxNoaIhW/fLhJQhV+RQrhschKrBWBLT1eXZX
         WJkOQLQTZ3cBC3iwLecjZr2mb64w1PbepRyL1UFqpufu4sTnD1YENlK/EMEaeRUXe9pq
         1FooW8EC40Zd2VPz5fJZlJIoHf4I1C4xofJGXiIACh7JXDrINflZxGhYwVhXWwD6zJEL
         XXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=22BeTk3EE+7Ccv2TV8Ih7DM/WefXrkNy8XNu12sQnkA85xIMqHwmFRv0I0+Bz3H+q6
         xCFR+eyhGaCAwdFilcYxrEDf8KvBrkgzucjMAZ/gKbhtrMShg/t91nYaUzonVAsGPobF
         ySwqVlPaAKSuUfUwwLWl44q3nWoB6XfofKI+z2IrcyyEzXX3d4ZWH0MDIMNz59Cwl+Nb
         6n0/jOtR+sfldsbscpLHZ0AK/QIHoH5DLMHkzlq+CfSU3ZzP+uhMosMDgmrkVflYPvI0
         juH5B02A5AjP+ozDHYksW4kAvrQ9fHmN/NzLCt/1jY59/F8u509G1EEyMTwFOA1U/C1l
         cJOA==
X-Gm-Message-State: APuU4Z+kW1ESFmRjVOI/PMpdTy10lOAhMU/5OYryGiDyxiyVQFBQoPwQ
	Z7JL4jGn11xvNMoeta9Ch6zVRaCKV+dV+NsmBzzLqX13pNyA+Y6NAtbuwe3XWZ1xGw==
X-Gm-Gg: AZFdTZdd4KzYcracZb8jc7GHASmWwW4KFi6jKEigXbytCRftv8AT6FmvJyHjrrdG0oo
	GgvwrbQb4Xda9kL7L2hFTOirFCaJShGSnjNArTcbjN0EuLpY4xGX4FDpkMDQSUpm4jPZ5C77bje
	btrn52oWPnKarnbzQC1XAmuCr1snkuEUOP4G2zNRzlru/DiP9jCl5/nEoUAPnjbFFlCCj5Va97q
	sFLoFWOy+TOX5d9dLAdMVQcNRcguBJUB9uawnarYN4rBp1Rb4qq1jhPdUkx6Rfr8YolPLKNH1yM
	bldfq7uJxweMkyj44ZJ9RtjluWe5jkyhL4UZ/rGsdvFgZXJZL1D6FImUHAyEgnATMmYQQeaaFtT
	H/MylspUaTkFE4N1TC6WXNNv8Ja7kab1eLBZxKeBgF2FPJ7LP0da4+AoxtUdTL2uRXHvSoyqvz2
	TJnr/MgxzDYEJeDF96iyxGMDu7mNTbh7PYv2jhezlBsrNsJGbjcemTolXAVHQVhsDN3y8BYr3AX
	4pojzL/4zTZHfPmhANi5mUkMN7yTVMKn4BHcHO7ahfeG0o66exrTPfHdXTa/KK8jt2h/+96Decl
	4lda0/UaKII4IH+3KKWcH8cpE+nEuglYp+NDQ/pTxY9Fui4eIcCQCwuy5ge1ibjCg4m4id6YeXt
	QqJYlfz0HP+lN0TJACy+hxSNwJqH7D7vBI3vHQyJ+AKelImGtkVweH1oCY9T97bsxGdRerYb8Pc
	3QMOsQs2TCZCURTbdFH+otkHaeU30CF8IA7lJAb9eac6TlaoMOTA3GgnjAgJM8FJ6Upah/1TQ35
	Q0bfjbteFajRu1hbjIQe/DS21Hh7bXN9W4ndnYq4W7II+gLp9b+/pjp+tFgnE/jbhFlcunXx2Co
	UaqKf6kvTsrf9qQSAZTFsrroL6aYRV1xhxbI+6KHsZVxyH5BR/Lsm2Qfe3nBJbxpXyxnQzm76f7
	Z
X-Received: by 2002:a17:907:1b1a:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c513a99a675mr589342866b.16.1795283642275;
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:00 +0100
Message-ID: <20261121175402.644803-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_095404_980421_939CF6FD 
X-CRM114-Status: GOOD (  14.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCI ath10k devices are capable of multiple MSI, and with all
their vectors the firmware interrupt and each copy engine have one of
their own. ath10k has asked for a single vector since commit
cfe9011a05a8 ("ath10k: remove MSI range support"), so all the copy
engine interrupts and the NAPI they schedule run on one CPU.

That commit dropped per copy engine handlers and tasklets along with
the vector block. 2/2 brings back only the block: every vector keeps
the one handler that schedules the NAPI for all copy engines, so the
copy engine locking and NAPI stay as they are and only the CPU the
interrupts land on changes.

Only the chips used in access points take the block (QCA988X, QCA9887,
QCA99X0, QCA9984, QCA9888). QCA6174, QCA6164 and QCA9377, the Wi-Fi and
Bluetooth combination chips, keep one vector and no affinity hint, as
now.

1/2 fixes the probe error path, which leaves MSI enabled on the device
after a failed probe. 2/2 requests the vector block the copy engine
layout needs, or one vector, and spreads the vectors over the CPUs.

On the AX3600, uploading 83-84 Mbit/s over the QCA9889, the HTT copy
engine's 37326-37927 interrupts in 14 s moved from CPU0 (21-22% busy,
37957-38630 interrupts without the patch) to its vector on CPU2 (21-23%
busy), and downloading 87-88 Mbit/s CPU2 was 8-13% busy against 15-17%
for CPU0 without the patch; the system total stays within the spread of
idle priority spinners, 16-33% of one CPU with and 16-34% without (3
runs each). With the block not granted one vector is used and carries
38285 interrupts in 14 s at 84 Mbit/s, and a firmware crash forced
through debugfs recovers with the vectors on the same CPUs (1 run each).
Without 1/2 an injected probe failure gave a WARNING in
msi_device_data_release() (kernel/irq/msi.c:294), and the router then
stopped answering; with 1/2 there was no WARNING and the rebind used 8
MSI vectors (1 run each).

Changes in v2:
- 1/2 is new: the err_deinit_irq label of ath10k_pci_probe() did not
  release the interrupt mode, so a failed probe left MSI enabled on the
  device.
- 2/2: Jeff Johnson pointed out that mobile clients want their
  interrupts on as few CPUs as possible. Only QCA988X, QCA9887,
  QCA99X0, QCA9984 and QCA9888 take the vector block now; QCA6174,
  QCA6164 and QCA9377 keep one vector and no affinity hint.
- 2/2: Loic Poulain asked to say why cfe9011a05a8 removed the vector
  block and how this differs; the commit message does, and the comment
  above ath10k_pci_interrupt_handler() that still described per copy
  engine handlers is updated.
- 2/2: Sashiko pointed out that the maximum of CE_COUNT_MAX + 1 vectors
  is not a power of two, which multi-MSI cannot encode and some MSI
  controllers do not accept. v2 requests exactly
  roundup_pow_of_two(MSI_ASSIGN_CE_MAX + 1) vectors, and one vector if
  the block is not granted.
- 2/2: Loic Poulain asked why pci_alloc_irq_vectors_affinity() is not
  used. The answer is at
  https://lore.kernel.org/all/20261114210506.787342-1-julius@bairaktaris.de/
  and the commit message now says why PCI_IRQ_AFFINITY is not used.
- Rebased onto ath-next-20261118.

v1:
https://lore.kernel.org/all/20261101164247.258200-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath10k: release the PCI interrupt mode when probe fails
  wifi: ath10k: spread the PCI copy engine interrupts over the CPUs

 drivers/net/wireless/ath/ath10k/hw.c  |  3 +
 drivers/net/wireless/ath/ath10k/hw.h  |  2 +
 drivers/net/wireless/ath/ath10k/pci.c | 87 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/pci.h |  3 +
 4 files changed, 79 insertions(+), 16 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0


