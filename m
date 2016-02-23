Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1aZHa4-0006NH-Hn
 for ath10k@lists.infradead.org; Fri, 26 Feb 2016 12:33:13 +0000
Message-ID: <56CC6471.8050204@candelatech.com>
Date: Tue, 23 Feb 2016 05:53:53 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Reduce number of peers to support peer stats
 feature
References: <1456210197-27892-1-git-send-email-akolli@qti.qualcomm.com>
In-Reply-To: <1456210197-27892-1-git-send-email-akolli@qti.qualcomm.com>
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
To: akolli@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 02/22/2016 10:49 PM, akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> To enable per peer stats feature we are reducing the number of peers.
> Firmware has introduced tx stats feature. We have memory limitation in
> firmware to add these additional bytes.

Maybe this is OK for defaults, but we should also give the user the ability
to configure various things, including disabling pktlog, setting number
of vdevs, peers, tids, etc.  Maybe something like the parseable config file
patch I linked too earlier?

http://dmz2.candelatech.com/?p=linux-4.4.dev.y/.git;a=commit;h=6708e4047d91edf234239943332bc2f0d124d009

You can also save a lot of RAM in your firmware if you naturally pack your structs
better, and remove un-used members from various structures, etc.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
