Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJI2H-0001Rc-A8
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 07:39:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k:  support msdu chaining.
References: <1393550452-1302-1-git-send-email-greearb@candelatech.com>
Date: Fri, 28 Feb 2014 09:38:41 +0200
In-Reply-To: <1393550452-1302-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 27 Feb 2014 17:20:52
 -0800")
Message-ID: <87fvn3d6v2.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Consolidate the list of msdu skbs into the msdu-head skb, delete the
> rest of the skbs, pass the msdu-head skb on up the stack as normal.
>
> Tested with high-speed TCP and UDP traffic on modified firmware that
> supports raw-rx.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v2:  Add note about skb_try_coalesce, though I am not sure it will
>      work or not.
>      Only grow skb once, which should save on some memory (re)allocation
>      and copying when we have more than one chained skb.

I didn't look at the patch itself yet, but I see checkpatch warnings:

drivers/net/wireless/ath/ath10k/htt_rx.c:1022: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/htt_rx.c:1032: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/htt_rx.c:1044: WARNING: labels should not be indented
drivers/net/wireless/ath/ath10k/htt_rx.c:1053: WARNING: labels should not be indented

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
