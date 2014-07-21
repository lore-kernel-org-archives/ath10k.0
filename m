Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Mbf-00080o-Cf
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 23:02:55 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 964CD409C9D
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 16:02:33 -0700 (PDT)
Message-ID: <53CD9C08.9090908@candelatech.com>
Date: Mon, 21 Jul 2014 16:02:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New CT firmware release is uploaded.
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

Release notes:

      Improve RAM usage:  Re-organized, trimmed, and otherwise made better use
      of RAM.  Allow compiling out swbmiss, beacon filtering, roaming code.
      Images with 'full' in their name do NOT have the previously mentioned features
      compiled out.

      Over-all, freed up about 80k of extra RAM, which can be used for more vdevs,
      peers, buffers, etc.

      Supports 64 vdevs (one should be reserved for monitor interface, so
      effectively 63 vdevs for current kernels.)

I have only lightly tested this on my 3.14 kernel so far.

A lot of these changes could potentially introduce run-time
crashes due to extensive use of a different type of RAM for
storing many structures.  Should be a quick fix should problems
arise.

As always, let me know if you find any problems.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
