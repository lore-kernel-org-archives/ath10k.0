Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYfVp-0000bU-OM
 for ath10k@lists.infradead.org; Tue, 22 Oct 2013 17:12:58 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9MHCaEo028298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2013 10:12:36 -0700
Message-ID: <5266B204.8030901@candelatech.com>
Date: Tue, 22 Oct 2013 10:12:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: DMAR faults?
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

Any idea what this means?  The 05:00.0 is the ath10k device...

ath10k_pci 0000:05:00.0: BAR 0: assigned [mem 0xf4400000-0xf45fffff 64bit]
ath10k: MSI-X interrupt handling (8 intrs)
dmar: DRHD: handling fault status reg 3
dmar: DMAR:[DMA Write] Request device [05:00.0] fault addr ffe46000
DMAR:[fault reason 02] Present bit in context entry is clear
ath10k: Hardware name qca988x hw2.0 version 0x4100016c
ath10k: UART prints disabled
ath10k: firmware 999.999.0.636 booted
ath10k: htt target version 2.1
ath10k: Completion buffers are full

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
