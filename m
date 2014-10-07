Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbVYb-0006Wv-9H
 for ath10k@lists.infradead.org; Tue, 07 Oct 2014 14:16:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: Add pktlog support
References: <1412269778-1045-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 7 Oct 2014 17:15:20 +0300
In-Reply-To: <1412269778-1045-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 2 Oct 2014 22:39:34 +0530")
Message-ID: <87sij0hsp3.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> This implements the Packet log feature for ath10k.
> All tx and rx events and rx descriptor details are
> posted to user space by tracepoints.
>
> v2: Addressed review comments and based on discussion with Michal
>     dropped tx_msdu_id patch and added tx info changes
>
> Rajkumar Manoharan (4):
>   ath10k: Add support to configure pktlog filter
>   ath10k: add tracing for ath10k_htt_pktlog
>   ath10k: add tracing for rx descriptor
>   ath10k: add tracing for tx msdu pktlog event

Thanks, all four patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
