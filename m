Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS1ET-0002Dt-Jg
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 11:08:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add pktlog support for 10.4 firmware
References: <1435043155-3111-1-git-send-email-rmani@qti.qualcomm.com>
Date: Wed, 19 Aug 2015 14:08:06 +0300
In-Reply-To: <1435043155-3111-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Tue, 23 Jun 2015 12:35:55 +0530")
Message-ID: <87io8ba63t.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> 10.4 firmware uses dedicated copy engine for pktlog transaction.
> Whatever the data received in that dedicated copy engine will
> have only pkt log header and followed by pktlog payload (will not
> have htc header). In the current design, htc layer callback
> registered with hif are acting as default receiver for all copy
> engine. We need to change the design in a way dedicated copy
> engine assigned for pktlog directly goes to pktlog module
> (bypassing htc) and rest of copy engine data goes to htc layer.
> In order to meet this, hif layer is changed to maintain copy
> engine specific tx and rx callbacks.
>
> Also, new firmware ie is added to get copy engine number used
> for pktlog in the firmware. Based this, pktlog receiver callback
> handler will be plugged into hif layer.
>
> pktlog.c/h are newly added to have pktlog related stuff.
> 10.4 firmware pktlog header differs from non 10.4 firmware.
> So, new pktlog header is added for 10.4.
>
> This patch enables pktlog to capture only TX related info on
> 10.4 firmware. Some more effort is need to capture RX related
> info in pktlog which is not covered in this patch.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Like discussed privately, let's drop this now and revisit later.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
