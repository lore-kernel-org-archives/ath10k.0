Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from server14-mail.hostwhitelabel.com ([104.152.168.114]
 helo=server14.hostwhitelabel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZC7x8-0004UX-Gv
 for ath10k@lists.infradead.org; Mon, 06 Jul 2015 15:05:03 +0000
Received: from [50.106.40.168] (port=48038 helo=andromeda.localnet)
 by server14.hostwhitelabel.com with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85)
 (envelope-from <CACook@quantum-sci.com>) id 1ZC7wp-000slJ-7J
 for ath10k@lists.infradead.org; Mon, 06 Jul 2015 11:04:43 -0400
From: CACook@quantum-sci.com
Subject: Buss Reset Problem
Date: Mon, 06 Jul 2015 08:04:39 -0700
Message-ID: <3969592.crxpsBTBQa@andromeda>
MIME-Version: 1.0
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


CPU: Intel(R) Xeon(R) CPU E3-1265L v3 @ 2.50GHz
KVM: qemu-kvm-1.5.3-86.el7_1.2.x86_64
Kernel: 4.1.1-1.el7.elrepo.x86_64, and kernel-3.10.0-229.7.2.el7.x86_64
Host & Guest: CentOS 7.1
Using virt-manager-1.1.0-12.el7.noarch to create, configure, and start guest
I am trying to do a PCI passthrough of a QCA988X wifi card. It's a Doodle Labs military-grade 802.11ac miniPCI card. This card configures nicely on the host, and seems to pass through to the KVM guest, but early in the boot of the guest it says "Unknown header type" at the wifi's bus address. And sure enough, lspci -vv on the host then shows:
        !!! Unknown header type 7f
        Kernel driver in use: vfio-pci
It seems to be the buss reset problem, as outlined here:
http://www.gossamer-threads.com/lists/linux/kernel/2054846
 
... Except my card locks up on boot of the KVM guest.
 
When I logged a bug at QEMU (https://bugs.launchpad.net/qemu/+bug/1471583), Alex suggested I add to the patch:
DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003c, quirk_no_bus_reset);
 
... So I am in the process of trying that now.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
