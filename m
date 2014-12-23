Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3KBF-0006HJ-UQ
 for ath10k@lists.infradead.org; Tue, 23 Dec 2014 07:46:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 8/8] ath10k: ath10k: add support to send delba
References: <1418972099-5296-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1418972099-5296-9-git-send-email-rmanohar@qti.qualcomm.com>
 <1419142431590.38389@qti.qualcomm.com>
Date: Tue, 23 Dec 2014 09:46:28 +0200
In-Reply-To: <1419142431590.38389@qti.qualcomm.com> (Rajkumar Manoharan's
 message of "Sun, 21 Dec 2014 06:13:52 +0000")
Message-ID: <87d27ag65n.fsf@kamboji.qca.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com> writes:

>> Subject: [PATCH 8/8] ath10k: ath10k: add support to send delba
>> 
>> This per-station debugfs entry helps to send delba in manual mode
>> for debugging purpose. It accepts tid, initiator and reason code
>> as inputs.
> Kalle,
>
> Subject needs small correction (ath10k: ath10k:). Do you want
> me send v2 patch for this change?

No need to send v2, I can do the change myself. But I noticed that you
already sent it :)

But in the future please don't resubmit individual patches, that's just
too error prone. Instead just resubmit the whole series.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
