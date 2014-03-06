Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLbh7-0006hj-Tw
 for ath10k@lists.infradead.org; Thu, 06 Mar 2014 17:02:54 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s26H2VGq010998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Thu, 6 Mar 2014 09:02:31 -0800
Message-ID: <5318AA27.4090609@candelatech.com>
Date: Thu, 06 Mar 2014 09:02:31 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Let ath10k_err take 'ar' argument?
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

I have two NICs in a system, and it died overnight (full host lockup).
Console shows this:

[root@ct523-9292 ~]# ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5
ath10k: target stalled
ath10k: failed to wait for target to init: -5


I was thinking of changing ath10k_err to take
'ar' as argument and then print out pci-id or some
other identifier so that we can tell which
NIC is having issues on systems with multiple NICs?

Any opinions on this before I get started?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
