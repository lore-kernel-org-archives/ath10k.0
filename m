Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-f176.google.com ([209.85.217.176])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cX0Nd-0005Yl-CM
 for ath10k@lists.infradead.org; Fri, 27 Jan 2017 06:51:31 +0000
Received: by mail-ua0-f176.google.com with SMTP id y9so200151730uae.2
 for <ath10k@lists.infradead.org>; Thu, 26 Jan 2017 22:51:06 -0800 (PST)
MIME-Version: 1.0
From: Daniel J Blueman <daniel@quora.org>
Date: Fri, 27 Jan 2017 14:50:04 +0800
Message-ID: <CAMVG2ssLQ897kVVE2jZrqsDm2XFmq7snoOG649FgGEogVjWX7g@mail.gmail.com>
Subject: Incomplete scan results after rf(un)kill
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

On 4.9.5 and previous, I've noticed that 20% of the time after
rfunkilling, AP scan results would often have only 1-2 out of the
previous 10 APs, and the situation would persist until removing and
reinserting the ath10k_pci module.

This is on my Dell XPS 13 9360 (Kaby Lake) with current BIOS 1.2.3 on
Ubuntu (ElementaryOS) 16.04 with updates.

Could this have any relation to the missing firmware [1]?

What state can I capture to help diagnose this?

Thanks!

Dan

-- [1]

ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:3a:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: Direct firmware load for
ath10k/cal-pci-0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: Direct firmware load for
ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
ath10k_pci 0000:3a:00.0: could not fetch firmware file
'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
0x00340aff sub 1a56:1535
ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1
api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 6fc88fe7
ath10k_pci 0000:3a:00.0: htt-ver 3.26 wmi-op 4 htt-op 3 cal otp
max-sta 32 raw 0 hwcrypto 1
-- 
Daniel J Blueman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
