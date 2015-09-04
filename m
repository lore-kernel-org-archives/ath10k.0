Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-rs1-vallila2.fe.helsinki.fi ([128.214.173.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXfOq-0003VT-K3
 for ath10k@lists.infradead.org; Fri, 04 Sep 2015 01:02:42 +0000
Received: from [192.168.1.86] (104-58-201-5.lightspeed.sntcca.sbcglobal.net
 [104.58.201.5]) (authenticated bits=0)
 by smtp-rs1.it.helsinki.fi (8.14.4/8.14.4) with ESMTP id t8412CVK008951
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
 for <ath10k@lists.infradead.org>; Fri, 4 Sep 2015 04:02:15 +0300
From: Susi Lehtola <jussilehtola@fedoraproject.org>
Subject: QCA6164 in Fedora
Message-ID: <55E8ED93.4040504@fedoraproject.org>
Date: Thu, 3 Sep 2015 18:02:11 -0700
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello people,


I recently bought a Lenovo U31 laptop for work, and was surprised 
wireless didn't work out of the box.

Fortunately thanks to you the card (supposedly) works in linux, but I 
have yet to get mine to work.

I've patched the Fedora 4.1.6 kernel
  https://bugzilla.redhat.com/attachment.cgi?id=1069561&action=diff
to add support for the card, which I adapted from
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1436940

However, I'm having trouble loading the firmware. I took the firmware 
files from
 
https://github.com/atondwal/ath10k-firmware/commit/88fca85ef59d708b9874e5b7885416b58aef9ee7
and installed them into /lib/firmware/ath10k/QCA6174/hw2.1/, renaming 
firmare-5.bin to firmware-4.bin.

I also have added the necessary kernel option

$ cat /etc/modprobe.d/ath10k.conf
options ath10k_core skip_otp=y

After these changes, the kernel does detect the card, but it fails to 
load the firmware.

[10967.516277] ath10k_pci 0000:03:00.0: Direct firmware load for 
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[10968.660851] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 
47cbe9a4-5fcd-41ae-b8ff-91e93702d083)
[10968.660862] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 
0x003405ff) fw atheros-12.0.0.102-fw api 4 htt 0.0 wmi 4 cal otp max_sta 32
[10968.660865] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0 dfs 
0 testmode 0
[10968.662882] ath10k_pci 0000:03:00.0: firmware register dump:
[10968.662884] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 
0x000A012D 0x00955B31
[10968.662886] ath10k_pci 0000:03:00.0: [04]: 0x000A012D 0x00060330 
0x00000016 0x8C605006
[10968.662888] ath10k_pci 0000:03:00.0: [08]: 0x00000000 0x00400000 
0x00400600 0x00000001
[10968.662890] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000 
0x00931C61 0x00931C7D
[10968.662892] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x0097F8C6 
0x00000000 0x00000000
[10968.662894] ath10k_pci 0000:03:00.0: [20]: 0x400A012D 0x0040E2B0 
0x00955A00 0x00404590
[10968.662896] ath10k_pci 0000:03:00.0: [24]: 0x809287D9 0x0040E310 
0x7A508BF8 0xC00A012D
[10968.662898] ath10k_pci 0000:03:00.0: [28]: 0x809288D7 0x0040E340 
0x00000000 0xFFF08040
[10968.662899] ath10k_pci 0000:03:00.0: [32]: 0x809290FE 0x0040E360 
0x00400000 0x00400600
[10968.662901] ath10k_pci 0000:03:00.0: [36]: 0x80929205 0x0040E380 
0x00000000 0x00400600
[10968.662903] ath10k_pci 0000:03:00.0: [40]: 0x40928024 0x0040E3B0 
0x0040D3D0 0x0040D3D0
[10968.662905] ath10k_pci 0000:03:00.0: [44]: 0x00000000 0x0040E3D0 
0x009BB001 0x00040020
[10968.662907] ath10k_pci 0000:03:00.0: [48]: 0x00401BF0 0x00000001 
0x00404B9C 0x00400000
[10968.662909] ath10k_pci 0000:03:00.0: [52]: 0x40928024 0x0040E3B0 
0x0040D3D0 0x0040D3D0
[10968.662910] ath10k_pci 0000:03:00.0: [56]: 0x51196000 0xEAB3E3DF 
0x36E760CE 0xE34A47DC
[10969.660666] ath10k_pci 0000:03:00.0: failed to receive control 
response completion, polling..

The card in question is
03:00.0 Network controller [0280]: Qualcomm Atheros Device [168c:0041] 
(rev 20)

What might be the problem?
-- 
Susi Lehtola
Fedora Project Contributor
jussilehtola@fedoraproject.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
