Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKoTT-0005No-Oy
 for ath10k@lists.infradead.org; Thu, 30 Jul 2015 14:06:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: initialize msdu ext. descriptor before use
References: <1437694326-31977-1-git-send-email-poh@qca.qualcomm.com>
Date: Thu, 30 Jul 2015 17:05:47 +0300
In-Reply-To: <1437694326-31977-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Thu, 23 Jul 2015 16:32:06 -0700")
Message-ID: <87r3np3flw.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Initial QCA99X0 support has a known issue with TCP Tx throughput.
> All other path such as UDP Tx/Rx and TCP Rx meet their expectation
> (> 900Mbps), but TCP Tx marked as low as 5Mbps when single pair is
> used on iperf.
>
> The root cause is turned out because TSO flag is not initialized
> properly so that firmware configures TSO in wrong way.
> TSO flags in msdu extension descriptor is required to be reset
> to indicate firmware there is no TSO is enabled, otherwise it
> could act as TSO is enabled which causes huge throughput drop.
>
> In fact, it's enough by resetting TSO flags only to prevent the
> unexpected behavior, but initializing whole msdu ext. descriptor
> will help to clear uncertainty of firmware could bring on as it
> constantly updated.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
