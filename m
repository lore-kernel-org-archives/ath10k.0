Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIXhD-0000Ac-LF
 for ath10k@lists.infradead.org; Fri, 24 Jul 2015 07:47:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/3] ath10k: update data path to support QCA99X0
References: <cover.1437011880.git.poh@qca.qualcomm.com>
Date: Fri, 24 Jul 2015 10:46:42 +0300
In-Reply-To: <cover.1437011880.git.poh@qca.qualcomm.com> (Peter Oh's message
 of "Wed, 15 Jul 2015 19:01:18 -0700")
Message-ID: <87r3nyf15p.fsf@kamboji.qca.qualcomm.com>
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

> This patch series update ath10k HTT Tx/Rx path to support
> QCA99X0 chip and make it able to run data traffic on both of
> Tx and Rx path.
>
> v2: fixed a type mismatch warning in htt_tx.c
> v3: fixed checkpatch warnings
>
> Peter Oh (3):
>   ath10k: update tx path to support QCA99X0
>   ath10k: redefine rx_ppdu_end_common structure to cover qca99x0
>   ath10k: add support for qca99x0 Rx descriptors

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
