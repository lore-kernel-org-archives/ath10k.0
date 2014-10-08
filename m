Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XboLl-000559-4p
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 10:20:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add tracing for frame transmission
References: <1412615346-18010-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87d2a3j1ja.fsf@kamboji.qca.qualcomm.com>
 <20141008031321.GB3116@qca.qualcomm.com>
Date: Wed, 8 Oct 2014 13:19:14 +0300
In-Reply-To: <20141008031321.GB3116@qca.qualcomm.com> (Rajkumar Manoharan's
 message of "Wed, 8 Oct 2014 08:43:23 +0530")
Message-ID: <8761fuhnj1.fsf@kamboji.qca.qualcomm.com>
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

>> > +	trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
>> > +				     skb_tailroom(msdu));
>> 
>> Why add skb_tailroom() to the length? I think that deserves a comment.
>
> It is used for rx crypto length. skb_tailroom is used in most of the
> places even while dumping rx pkt by ath10k_dbg_dump.

Ok, thanks for clarifying that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
