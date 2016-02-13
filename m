Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUTsC-0002A8-Ut
 for ath10k@lists.infradead.org; Sat, 13 Feb 2016 06:40:06 +0000
Received: by mail-vk0-x22a.google.com with SMTP id c3so75811701vkb.3
 for <ath10k@lists.infradead.org>; Fri, 12 Feb 2016 22:39:43 -0800 (PST)
Received: from darkstar ([161.0.247.254])
 by smtp.gmail.com with ESMTPSA id 71sm700372vkc.3.2016.02.12.22.39.40
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Fri, 12 Feb 2016 22:39:41 -0800 (PST)
From: gloudon.jamie@gmail.com
Date: Sat, 13 Feb 2016 02:39:26 -0400
Subject: QCA6174 firmware crash in monitor mode 
Message-ID: <20160213063926.GA1767@darkstar>
MIME-Version: 1.0
Content-Disposition: inline
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

QCA6147 monitor mode stopped working ever since after kernel v4.3. Here is the firmware crash log:

Feb 13 01:39:36 darkstar kernel: [   34.010363] ath10k_pci 0000:01:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 168c:3344
Feb 13 01:39:36 darkstar kernel: [   34.010373] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
Feb 13 01:39:36 darkstar kernel: [   34.012252] ath10k_pci 0000:01:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad crc32 10bf8e08
Feb 13 01:39:36 darkstar kernel: [   34.012291] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 cdb586cf
Feb 13 01:39:36 darkstar kernel: [   34.012301] ath10k_pci 0000:01:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Feb 13 01:39:36 darkstar kernel: [   34.067918] ieee80211 phy0: Hardware restart was requested

Feb 13 01:39:36 darkstar kernel: [   34.010318] ath10k_pci 0000:01:00.0: firmware crashed! (uuid cb6fc88d-918d-4c7a-af69-15a713136bf7)
Feb 13 01:39:36 darkstar kernel: [   34.014330] ath10k_pci 0000:01:00.0: firmware register dump:
Feb 13 01:39:36 darkstar kernel: [   34.014340] ath10k_pci 0000:01:00.0: [00]: 0x05010000 0x00000000 0x0099987C 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014349] ath10k_pci 0000:01:00.0: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014358] ath10k_pci 0000:01:00.0: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014366] ath10k_pci 0000:01:00.0: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014375] ath10k_pci 0000:01:00.0: [16]: 0x00000000 0x00000000 0x00000000 0x0099987C
Feb 13 01:39:36 darkstar kernel: [   34.014384] ath10k_pci 0000:01:00.0: [20]: 0x00000000 0x004018F0 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014392] ath10k_pci 0000:01:00.0: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014401] ath10k_pci 0000:01:00.0: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014409] ath10k_pci 0000:01:00.0: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014418] ath10k_pci 0000:01:00.0: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014426] ath10k_pci 0000:01:00.0: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014435] ath10k_pci 0000:01:00.0: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014443] ath10k_pci 0000:01:00.0: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014452] ath10k_pci 0000:01:00.0: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014460] ath10k_pci 0000:01:00.0: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
Feb 13 01:39:36 darkstar kernel: [   34.014625] ath10k_pci 0000:01:00.0: failed to set 2g txpower 0: -108
Feb 13 01:39:36 darkstar kernel: [   34.014636] ath10k_pci 0000:01:00.0: failed to setup tx power 0: -108
Feb 13 01:39:36 darkstar kernel: [   34.014644] ath10k_pci 0000:01:00.0: failed to recalc tx power: -108
Feb 13 01:39:36 darkstar kernel: [   34.014714] ------------[ cut here ]------------
Feb 13 01:39:36 darkstar kernel: [   34.014730] WARNING: CPU: 1 PID: 1471 at net/mac80211/iface.c:421 ieee80211_add_virtual_monitor+0xd7/0x17c()
Feb 13 01:39:36 darkstar kernel: [   34.014739] CPU: 1 PID: 1471 Comm: ifconfig Not tainted 4.5.0-rc3 #3
Feb 13 01:39:36 darkstar kernel: [   34.014745] Hardware name: Dell Inc. Inspiron 11 - 3147/06G7R2, BIOS A05 03/16/2015
Feb 13 01:39:36 darkstar kernel: [   34.014750]  00000000 00000286 f53fbdb4 c11c002d 00000000 c1732845 f53fbdcc c1037740
Feb 13 01:39:36 darkstar kernel: [   34.014767]  c14d18e6 f58e6000 f54803e0 ffffff94 f53fbddc c10377f1 00000009 00000000
Feb 13 01:39:36 darkstar kernel: [   34.014782]  f53fbdf4 c14d18e6 698e7e68 f63454c8 f63454c0 00000000 f53fbe1c c14d22a5
Feb 13 01:39:36 darkstar kernel: [   34.014796] Call Trace:
Feb 13 01:39:36 darkstar kernel: [   34.014809]  [<c11c002d>] dump_stack+0x47/0x5b
Feb 13 01:39:36 darkstar kernel: [   34.014820]  [<c1037740>] warn_slowpath_common+0x7e/0x95
Feb 13 01:39:36 darkstar kernel: [   34.014828]  [<c14d18e6>] ? ieee80211_add_virtual_monitor+0xd7/0x17c
Feb 13 01:39:36 darkstar kernel: [   34.014837]  [<c10377f1>] warn_slowpath_null+0x14/0x18
Feb 13 01:39:36 darkstar kernel: [   34.014845]  [<c14d18e6>] ieee80211_add_virtual_monitor+0xd7/0x17c
Feb 13 01:39:36 darkstar kernel: [   34.014853]  [<c14d22a5>] ieee80211_do_open+0x285/0x5be
Feb 13 01:39:36 darkstar kernel: [   34.014862]  [<c14d2620>] ieee80211_open+0x42/0x4d
Feb 13 01:39:36 darkstar kernel: [   34.014871]  [<c1436d6a>] __dev_open+0x7e/0xd1
Feb 13 01:39:36 darkstar kernel: [   34.014879]  [<c1436fc7>] __dev_change_flags+0x98/0x124
Feb 13 01:39:36 darkstar kernel: [   34.014888]  [<c1437078>] dev_change_flags+0x25/0x50
Feb 13 01:39:36 darkstar kernel: [   34.014897]  [<c147cee9>] devinet_ioctl+0x211/0x4b0
Feb 13 01:39:36 darkstar kernel: [   34.014906]  [<c147dc7a>] inet_ioctl+0x81/0x9a
Feb 13 01:39:36 darkstar kernel: [   34.014916]  [<c14228db>] sock_ioctl+0x165/0x186
Feb 13 01:39:36 darkstar kernel: [   34.014930]  [<c1422776>] ? sock_fasync+0x6b/0x6b
Feb 13 01:39:36 darkstar kernel: [   34.014934]  [<c10eb8f7>] vfs_ioctl+0x1c/0x26
Feb 13 01:39:36 darkstar kernel: [   34.014937]  [<c10ec2fb>] do_vfs_ioctl+0x4a6/0x510
Feb 13 01:39:36 darkstar kernel: [   34.014941]  [<c10d79db>] ? virt_to_head_page+0x19/0x1b
Feb 13 01:39:36 darkstar kernel: [   34.014945]  [<c10da3c0>] ? kmem_cache_free+0x37/0xd9
Feb 13 01:39:36 darkstar kernel: [   34.014949]  [<c10e6baa>] ? putname+0x44/0x47
Feb 13 01:39:36 darkstar kernel: [   34.014952]  [<c10e6baa>] ? putname+0x44/0x47
Feb 13 01:39:36 darkstar kernel: [   34.014956]  [<c10dee01>] ? do_sys_open+0xc0/0xca
Feb 13 01:39:36 darkstar kernel: [   34.014959]  [<c10ec3a6>] SyS_ioctl+0x41/0x5b
Feb 13 01:39:36 darkstar kernel: [   34.014963]  [<c1001167>] do_syscall_32_irqs_on+0x3e/0x50
Feb 13 01:39:36 darkstar kernel: [   34.014968]  [<c15072f6>] entry_INT80_32+0x2a/0x2a
Feb 13 01:39:36 darkstar kernel: [   34.014983] ---[ end trace 46261952c940b8db ]---
Feb 13 01:39:36 darkstar kernel: [   34.046345] ath10k_pci 0000:01:00.0: device has crashed during init
Feb 13 01:39:36 darkstar kernel: [   34.067412] ath10k_pci 0000:01:00.0: device has crashed during init
Feb 13 01:39:36 darkstar kernel: [   34.067426] ath10k_pci 0000:01:00.0: failed to wait for target init: -70
Feb 13 01:39:36 darkstar kernel: [   34.100453] ath10k_pci 0000:01:00.0: device has crashed during init
Feb 13 01:39:36 darkstar kernel: [   34.121502] ath10k_pci 0000:01:00.0: device has crashed during init
Feb 13 01:39:36 darkstar kernel: [   34.121517] ath10k_pci 0000:01:00.0: failed to wait for target init: -70


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
