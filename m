Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi220-0000DR-Gj
 for ath10k@lists.infradead.org; Wed, 07 May 2014 13:37:09 +0000
Message-ID: <536A36E5.6040100@candelatech.com>
Date: Wed, 07 May 2014 06:36:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] ath10k: 2014-05-07 fixes
References: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

On 05/07/2014 05:33 AM, Michal Kazior wrote:
> Hi,
> 
> These 2 patches address kernel panics reported by
> Avery recently. One of them was most likely
> reported by Ben some time ago already.
> 
> I've never seen these panics myself. It'd be great
> if you guys could give it a try and (assuming
> you're capable of reproducing) see if it actually
> helps.

I'll add these to my tree today and we'll run them through
our test harness.

I have not been able to repeat any crashes like this recently...but
I'll let you know if I see anything strange after applying
the patches.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
