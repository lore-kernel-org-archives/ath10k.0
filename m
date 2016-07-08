Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPZU-0006P8-S8
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:47:33 +0000
MIME-Version: 1.0
Subject: Re: ath10k: simplify pktlog htt event processing
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1466592761-6659-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <228b82f3cbc84bf7b217ef50632825cc@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:46:48 +0200
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> It is expected that all pktlog events for 10.4 firmware based solutions
> should come through CE8 where as in case of 10.2 firmware based solutions,
> it should come through one of the HTT events (HTT_T2H_MSG_TYPE_PKTLOG).
> 
> But from experiments with 10.4 based solutions, it is observed that pktlog
> event for ATH_PKTLOG_TYPE_TX_MSDU_ID is coming through HTT pktlog event.
> Currently, we always parse with 10.2 pktlog header which will lead to
> pktlog decoding issues (payload length mismatch exceptions)
> 
> For trace points, it is required to provide only the payload size. So
> fixing this by simplifying the payload size calculation without the use of
> ath10k pktlog headers.
> 
> While there, remove the unused ath10k pktlog headers.
> 
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

34293f75586b ath10k: simplify pktlog htt event processing

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9192399/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
