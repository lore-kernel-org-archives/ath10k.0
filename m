Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvpbQ-0002UL-VT
 for ath10k@lists.infradead.org; Mon, 09 Nov 2015 16:47:33 +0000
Subject: Re: ath10k AP "failed to delete peer" errors when using Nexus 5X
References: <CADLC3L1xeetwWLn1FbSyzvFYHvPw2z8C3OmQ-w9Bi0U=iLqZiA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5640CE0E.8040206@candelatech.com>
Date: Mon, 9 Nov 2015 08:47:10 -0800
MIME-Version: 1.0
In-Reply-To: <CADLC3L1xeetwWLn1FbSyzvFYHvPw2z8C3OmQ-w9Bi0U=iLqZiA@mail.gmail.com>
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
To: Robert Hancock <hancockrwd@gmail.com>, ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>

On 11/08/2015 10:02 PM, Robert Hancock wrote:
> I'm using OpenWRT on a TP-Link Archer C7, currently running
> development rev 47397 which is kernel 4.1.1 and compat-wireless
> 2015-10-26. Ever since I got a new Nexus 5X phone, it seems like
> periodically (once a day or so), the 5GHz wireless (using ath10k)
> craps out and I get a bunch of errors in the kernel log on the router.
> I have to reboot the router to get the 5GHz working again. Full kernel
> log from one of these failures is below. Any thoughts on what is going
> on here?
>
> There are reports of a newer Android build (which I don't have yet)
> which supposedly has some wireless fixes on the Nexus 5X, but I'm not
> sure what it could be doing that would be causing the router to crap
> out like this.

> [ 2178.931641] ---[ end trace 6751cc6390d26848 ]---
> [ 2181.926812] ath10k_pci 0000:01:00.0: failed to delete peer
> 8c:3a:e3:15:29:f3 for vdev 0: -11
> [ 2184.946721] ath10k_pci 0000:01:00.0: failed to set beacon mode for
> vdev 0: -11
> [ 2187.946538] ath10k_pci 0000:01:00.0: failed to set dtim period for
> vdev 0: -11
> [ 2190.986373] ath10k_pci 0000:01:00.0: failed to recalculate rts/cts
> prot for vdev 0: -11
> [ 2193.986210] ath10k_pci 0000:01:00.0: failed to set protection mode
> 0 on vdev 0: -11
> [ 2196.986045] ath10k_pci 0000:01:00.0: failed to set preamble for vdev 0: -11

Usually this means firmware has stopped processing WMI messages.

You might try different firmware versions in hopes one of them fixes the
problem.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
