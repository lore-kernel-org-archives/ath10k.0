Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd56F-0003S7-BE
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 22:57:36 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 7FD1A40E9D0
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 15:57:14 -0700 (PDT)
Message-ID: <551B264A.8040700@candelatech.com>
Date: Tue, 31 Mar 2015 15:57:14 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: 4.0 kernel with CT firmware support is now available.
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

This kernel is only very lightly tested at this point.

But, for those wanting to use CT firmware's extra features on
a 4.0 kernel, it may be useful:

git clone git://dmz2.candelatech.com/linux-4.0.dev.y

http://dmz2.candelatech.com/?p=linux-4.0.dev.y/.git;a=summary

My current plan is to focus on 4.0 instead of 3.19,
so 3.19 will probably not be updated further.

Note that I rebase this often against Linus's tree (and backports
when those happen).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
