Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7LHs-00064e-NJ
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 14:37:24 +0000
Received: from [192.168.1.16] (unknown [78.192.148.53])
 (Authenticated sender: lepoissonlibre@spika.xyz)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id BC547100018
 for <ath10k@lists.infradead.org>; Fri, 22 Mar 2019 14:36:44 +0000 (UTC)
From: LePoissonLibre <lepoissonlibre@spika.xyz>
Subject: ath10k_pci : failed to wake target for write32
Message-ID: <94b04bbd-1a12-5b65-185e-e41e80c8d5c4@spika.xyz>
Date: Fri, 22 Mar 2019 15:36:43 +0100
MIME-Version: 1.0
Content-Language: en-US
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

Hello,

I apologize in advance for not putting right shapes to my message.

During last months, I suffer randomly of crash from ath10k_pci. 
Network-manager continue to display that I'm connected to AP, but the 
connection itself didn't work.

When it occurs, in my journalctl, I have repeating messages like this :

mars 22 15:28:02 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ab7 at 0x0003543c: -110
mars 22 15:28:02 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ab9 at 0x0003543c: -110
mars 22 15:28:02 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001abb at 0x0003543c: -110
mars 22 15:28:02 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001abd at 0x0003543c: -110
mars 22 15:28:02 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001abf at 0x0003543c: -110
mars 22 15:28:03 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ac1 at 0x0003543c: -110
mars 22 15:28:03 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ac3 at 0x0003543c: -110
mars 22 15:28:03 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ac5 at 0x0003543c: -110
mars 22 15:28:03 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ac7 at 0x0003543c: -110
mars 22 15:28:03 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001ac9 at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_warn: 28 callbacks suppressed
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b03 at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b05 at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b07 at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b09 at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b0b at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b0d at 0x0003543c: -110
mars 22 15:28:07 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b0f at 0x0003543c: -110
mars 22 15:28:08 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b11 at 0x0003543c: -110
mars 22 15:28:08 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b13 at 0x0003543c: -110
mars 22 15:28:08 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b15 at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_warn: 23 callbacks suppressed
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b45 at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b47 at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b49 at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b4b at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b4d at 0x0003543c: -110
mars 22 15:28:12 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b4f at 0x0003543c: -110
mars 22 15:28:13 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b51 at 0x0003543c: -110
mars 22 15:28:13 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b53 at 0x0003543c: -110
mars 22 15:28:13 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b55 at 0x0003543c: -110
mars 22 15:28:13 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b57 at 0x0003543c: -110
mars 22 15:28:19 keaton kernel: ath10k_warn: 5 callbacks suppressed
mars 22 15:28:19 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b63 at 0x0003543c: -110
mars 22 15:28:22 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b65 at 0x0003543c: -110
mars 22 15:28:22 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b67 at 0x0003543c: -110
mars 22 15:28:22 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b69 at 0x0003543c: -110
mars 22 15:28:23 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b6b at 0x0003543c: -110
mars 22 15:28:26 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b6d at 0x0003543c: -110
mars 22 15:28:27 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b6f at 0x0003543c: -110
mars 22 15:28:28 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b71 at 0x0003543c: -110
mars 22 15:28:29 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b73 at 0x0003543c: -110
mars 22 15:28:29 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b75 at 0x0003543c: -110
mars 22 15:28:31 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b77 at 0x0003543c: -110
mars 22 15:28:31 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b79 at 0x0003543c: -110
mars 22 15:28:35 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b7b at 0x0003543c: -110
mars 22 15:28:36 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b7d at 0x0003543c: -110
mars 22 15:28:36 keaton kernel: ath10k_pci 0000:01:00.0: failed to wake 
target for write32 of 0x00001b7f at 0x0003543c: -110

Nothing different about ath10k_pci comes before or after.

Sometimes, disconnecting and rescanning pci devices solves the problem :
- echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove
- echo 1 > /sys/devices/pci0000:00/0000:00:13.0/rescan
But other times, only a reboot solves it.

I'm currently running 4.14.105-1-MANJARO and my linux-firmware package 
is 20190212.28f5f7d-1.
My card is QCA9377.

Thank you for your time, and sorry for the lack of information.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
