Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiMeD-0006Yn-4J
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 12:42:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: use PRI value given by spec for fixed PRI
References: <1427475590-2198-1-git-send-email-poh@qca.qualcomm.com>
 <55191D89.2000300@neratec.com> <55198EA4.1010101@codeaurora.org>
 <551BC2B1.3030002@neratec.com> <551C5C51.8010109@codeaurora.org>
Date: Wed, 15 Apr 2015 15:41:58 +0300
In-Reply-To: <551C5C51.8010109@codeaurora.org> (Peter Oh's message of "Wed, 01
 Apr 2015 14:00:01 -0700")
Message-ID: <87fv817ecp.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Peter Oh <poh@qca.qualcomm.com>, Zefir Kurtisi <zefir.kurtisi@neratec.com>

Peter Oh <poh@codeaurora.org> writes:

>> As for your patch at hand, I tested it for ETSI and it does not
>> change detector performance,
>
> The patch is useful when there are many missing pulses within a burst.
> It happens almost every time when channel loading rate is higher than
> 40%, but around 30% channel loading does not miss pulses that much.
>
>> therefore (please replace 16 with PRI_TOLERANCE in the macro)
>
> I'll do.
>
>> Acked-by: Zefir Kurtisi <zefir.kurtisi@neratec.com>

So what's the conclusion? Should I wait for v2 or is this good to
commit? I didn't quite get Zefir's comment about PRI_TOLERANCE above.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
