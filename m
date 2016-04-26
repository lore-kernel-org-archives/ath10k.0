Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1av8lF-0001rY-GV
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 19:35:05 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id AB34D40A339
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2016 12:34:22 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: QCA99XX, IBSS, and no transmitted frames?
Message-ID: <571FC2BD.6080602@candelatech.com>
Date: Tue, 26 Apr 2016 12:34:21 -0700
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
To: ath10k <ath10k@lists.infradead.org>

Just curious if anyone has any ideas...I've been staring that this one
for days without much luck...

Test case is to bring up two 9990 NICs, using my kernel and firmware, and
then run 56kbps UDP traffic bi-directional.

It works for a bit, and then I see a case where one side cannot seem
to answer ARP.  I still see beacons from it, and probe responses,
and I see it receive ARP and try to respond at the netdev level.

But, when sniffing the air, I do not see any ARP response on the air.
I've tried verifying the rate-ctrl logic is right and all of that.

Unless I'm really missing something, this is a firmware issue.

Any suggestions for what might be the issue?  Anyone else see problems
where 9990 NICs go selectively silent on transmit?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
