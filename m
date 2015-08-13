Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPwrA-00053a-IY
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 18:04:00 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 04B6E40B69E
 for <ath10k@lists.infradead.org>; Thu, 13 Aug 2015 11:03:37 -0700 (PDT)
Message-ID: <55CCDBF9.2050205@candelatech.com>
Date: Thu, 13 Aug 2015 11:03:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New CT firmware beta-15 available.
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

I've just uploaded the latest beta-15 firmware build.

It has a few fixes related to rate-ctrl, and it can also
transmit on a Monitor interface now.  The monitor TX packets
are all sent out at 1Mbps encoding rate currently (though
a better use of radiotap might give up to 6Mbps, perhaps),
and all 3 of the MAC addresses in the ieee80211 header
are that of the Monitor device.

I think if someone cared it would be easy enough to
make the driver add real peers to the Monitor device,
but I'm not sure what good that would do.

And, some day, maybe there could be a way to pass rate-ctrl
info to the firmware so that you could specific particular
rates...

The firmware has a few hacks that should let this feature work
on an un-patched driver, I think.  I was testing on my 4.0.4
kernel, however.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
