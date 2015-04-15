Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiQsJ-0000IY-N1
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 17:13:20 +0000
Message-ID: <552E9B7C.5080109@codeaurora.org>
Date: Wed, 15 Apr 2015 10:10:20 -0700
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ath: use PRI value given by spec for fixed PRI
References: <1427475590-2198-1-git-send-email-poh@qca.qualcomm.com>
 <55191D89.2000300@neratec.com> <55198EA4.1010101@codeaurora.org>
 <551BC2B1.3030002@neratec.com> <551C5C51.8010109@codeaurora.org>
 <87fv817ecp.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fv817ecp.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org, Zefir Kurtisi <zefir.kurtisi@neratec.com>


On 04/15/2015 05:41 AM, Kalle Valo wrote:
> Peter Oh <poh@codeaurora.org> writes:
>
>>> As for your patch at hand, I tested it for ETSI and it does not
>>> change detector performance,
>> The patch is useful when there are many missing pulses within a burst.
>> It happens almost every time when channel loading rate is higher than
>> 40%, but around 30% channel loading does not miss pulses that much.
>>
>>> therefore (please replace 16 with PRI_TOLERANCE in the macro)
>> I'll do.
>>
>>> Acked-by: Zefir Kurtisi <zefir.kurtisi@neratec.com>
> So what's the conclusion? Should I wait for v2 or is this good to
> commit? I didn't quite get Zefir's comment about PRI_TOLERANCE above.
>
Please wait for 2nd patches. I'll prepare the patches that do not void 
this current products certificate.

Regards,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
