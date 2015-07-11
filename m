Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDxR1-0006tq-BS
 for ath10k@lists.infradead.org; Sat, 11 Jul 2015 16:15:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: update tx path to support QCA99X0
References: <1436287676-25767-1-git-send-email-poh@qca.qualcomm.com>
 <1436287676-25767-2-git-send-email-poh@qca.qualcomm.com>
Date: Sat, 11 Jul 2015 19:14:56 +0300
In-Reply-To: <1436287676-25767-2-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Tue, 7 Jul 2015 09:47:54 -0700")
Message-ID: <87egkewu0v.fsf@kamboji.qca.qualcomm.com>
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

> Since QCA99X0 uses fragmentation descriptor differently from
> other ones on tx path, we need to handle it separately.
>
> QCA99X0 is using 48 bits for address and 16 bits for length
> out of 2 dword and each values have to be programmed by frag
> desc base addr + msdu id, so that hardware can retrieve
> corresponding frag data.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

kbuild found a new warning:

>> drivers/net/wireless/ath/ath10k/htt_tx.c:547:52: sparse: incorrect
>> type in assignment (different base types)
   drivers/net/wireless/ath/ath10k/htt_tx.c:547:52:    expected
>> restricted __le16 [usertype] len_16
   drivers/net/wireless/ath/ath10k/htt_tx.c:547:52:    got restricted
>> __le32 [usertype] <noident>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
