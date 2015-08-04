Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ZMhB0-0004tv-Cd
 for ath10k@lists.infradead.org; Tue, 04 Aug 2015 18:43:02 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5958040A0D9
 for <ath10k@lists.infradead.org>; Tue,  4 Aug 2015 11:42:39 -0700 (PDT)
Message-ID: <55C1079E.80301@candelatech.com>
Date: Tue, 04 Aug 2015 11:42:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ps_wake_refcount warning in ath10k_pci_hif_stop
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
To: ath10k <ath10k@lists.infradead.org>

I'm porting forward to the 4.2-rc5+ kernel.

I'm seeing this splat hit often.  I'm using my CT firmware and
have a fair amount of ath10k patches, so it could be me.

	WARN_ON(ar_pci->ps_wake_refcount > 0);


Any idea what can cause this sort of thing?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
