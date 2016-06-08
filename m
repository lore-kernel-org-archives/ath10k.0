Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAfn9-0005On-SL
 for ath10k@lists.infradead.org; Wed, 08 Jun 2016 15:53:18 +0000
MIME-Version: 1.0
Date: Wed, 08 Jun 2016 21:22:55 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
In-Reply-To: <CAHbf0-GT0y1pEs-ToxbPAf+aRo7TNAyV_Emies_rjL27R1fk2A@mail.gmail.com>
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com> <57504F05.3040200@candelatech.com>
 <1464887026467.72937@qti.qualcomm.com> <57506BA1.2090303@candelatech.com>
 <CAHbf0-GT0y1pEs-ToxbPAf+aRo7TNAyV_Emies_rjL27R1fk2A@mail.gmail.com>
Message-ID: <c36f442934605c492525af72fa04ada9@codeaurora.org>
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
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>

On 2016-06-02 23:03, Mike Lothian wrote:
> I've just tried those two changes, the machine now locks up before X
> has even started
> 
Mike,

Sorry for the delay. Found root cause for dead lock. Can you please give 
a try with below change?

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c 
b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 3b35c7ab5680..80e645302b54 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1905,7 +1905,6 @@ static void ath10k_htt_rx_in_ord_ind(struct ath10k 
*ar, struct sk_buff *skb)
                         return;
                 }
         }
-       ath10k_htt_rx_msdu_buff_replenish(htt);
  }


-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
