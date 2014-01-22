Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W64Ux-0003tT-32
 for ath10k@lists.infradead.org; Wed, 22 Jan 2014 20:34:07 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s0MKXiD0028093
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 22 Jan 2014 12:33:44 -0800
Message-ID: <52E02B28.6020503@candelatech.com>
Date: Wed, 22 Jan 2014 12:33:44 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: BAR error, failed to get chip id.
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


I see this fairly often on module reload.  Firmware is modified
by me, based on 10.1.389, so if there are firmware fixes since then
that address this problem I would not know of it.  Kernel is ath-testing,
with some local changes, but nothing pertaining to the pci code.


Kernel 3.13.0-rc8-wl-ath+ on an x86_64 (ttyS0)

ct523-9292 login: ath10k_pci 0000:05:00.0: BAR 0: error updating (0xf4400004 != 0xffffffff)
ath10k_pci 0000:05:00.0: BAR 0: error updating (high 0x000000 != 0xffffffff)
ath10k: Failed to get chip id: -110


After this, it takes a power cycle to get the system working again.

Anyone seen similar?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
