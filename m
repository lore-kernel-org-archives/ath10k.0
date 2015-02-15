Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMzRG-0005Tn-Gq
 for ath10k@lists.infradead.org; Sun, 15 Feb 2015 13:40:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: station kickout
References: <54D29F71.50603@candelatech.com>
Date: Sun, 15 Feb 2015 15:40:16 +0200
In-Reply-To: <54D29F71.50603@candelatech.com> (Ben Greear's message of "Wed,
 04 Feb 2015 14:38:41 -0800")
Message-ID: <87d25bi98f.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

(Adding linux-wireless)

Ben Greear <greearb@candelatech.com> writes:

> In AP mode, it seems that 3.17-ish kernels (at least) always set station kickout
> to hard-coded value of 50.
>
> Is this something that should be configurable?  Maybe a module parameter
> if nothing else?

Or should we add this to nl80211/cfg80211/mac80211? I would guess other
drivers also have similar functionality.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
