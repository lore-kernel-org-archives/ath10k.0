Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKRQ7-0003wT-SM
 for ath10k@lists.infradead.org; Mon, 12 Jun 2017 15:38:25 +0000
MIME-Version: 1.0
Subject: Re: [1/1] Add per chain RSSI reporting.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <CAAV6Hgmjq9DDpcUUTZtDwodUjKrkzjnKSNZ+sK8U=M_AQgr-iQ@mail.gmail.com>
References: <CAAV6Hgmjq9DDpcUUTZtDwodUjKrkzjnKSNZ+sK8U=M_AQgr-iQ@mail.gmail.com>
Message-ID: <866823ed4ac64b8dae61f791aeb7e6f9@eusanexr01a.eu.qualcomm.com>
Date: Mon, 12 Jun 2017 08:37:56 -0700
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
To: Norik Dzhandzhapanyan <norikd@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Norik Dzhandzhapanyan <norikd@gmail.com> wrote:

> Report per chain RSSI to mac80211.
> 
> Signed-off-by: Norik Dzhandzhapanyan <norikd@gmail.com>
> [kvalo@qca.qualcomm.com: fix conflicts and style]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This failed to apply and had quite a few checkpatch warnings. So I recreted the
patch manually:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5df110e3a093771f23001be2012ab6fa4d87089b

-- 
https://patchwork.kernel.org/patch/9760887/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
