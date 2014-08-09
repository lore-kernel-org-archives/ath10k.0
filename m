Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGDbL-0006F3-Nx
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 20:50:56 +0000
Message-ID: <53E68995.1020005@candelatech.com>
Date: Sat, 09 Aug 2014 13:50:29 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] ath10k: firmware crash dump
References: <20140809180552.29215.58612.stgit@potku.adurom.net>
In-Reply-To: <20140809180552.29215.58612.stgit@potku.adurom.net>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 08/09/2014 11:07 AM, Kalle Valo wrote:
> Next version of ath10k firmware crash dump feature, based on Ben's patches but
> heavily modified.
>
> v6:

I see no obvious problems.  If it passes basic testing, poke it upstream
and I'll start making my decode tool able to parse it (and package my CT
firmware with the BSS addrs/lengths..it is currently using a slightly
different IE format.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
