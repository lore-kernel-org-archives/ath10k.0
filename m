Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTCtu-00071V-Dn
 for ath10k@lists.infradead.org; Mon, 16 Jan 2017 19:25:08 +0000
Received: by mail-wm0-x243.google.com with SMTP id r126so33014022wmr.3
 for <ath10k@lists.infradead.org>; Mon, 16 Jan 2017 11:24:45 -0800 (PST)
Received: from naiad (fishface.org.uk. [5.196.65.160])
 by smtp.gmail.com with ESMTPSA id d64sm30888334wmh.3.2017.01.16.11.24.42
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Jan 2017 11:24:42 -0800 (PST)
Message-ID: <1484594680.14978.5.camel@gmail.com>
Subject: ath10k failing with firmware RM.4.4-00022-QCARMSWPZ-2 on QCA6174
 (Killer 1535)
From: Chris Le Sueur <thefishface@gmail.com>
Date: Mon, 16 Jan 2017 19:24:40 +0000
Mime-Version: 1.0
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

Dear all,

(per request by kvalo on #ath10k)

I was trying out the firmware-5 from git to see if it would fix
throughput issues, but instead the driver just failed to work. I am
using kernel 4.8.15 on Fedora 25, and the following was printed to the
kernel log:

ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
reset_mode 0
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
0000:3a:00.0 .bin failed with error -2
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
0x00340aff sub 1a56:1535
ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
testmode 0
ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
5 features wowlan,ignore-otp crc32 4d458559
ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 
32 raw 0 hwcrypto 1
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to enable dynamic BW: -11
ath10k_pci 0000:3a:00.0: could not suspend target (-11)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
