Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs6ID-0007MY-Nk
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 13:34:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
 <e18e50cae69e44f4b9e4abb1fa110193@aptaiexm02f.ap.qualcomm.com>
 <877eea8kys.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 08 Feb 2019 15:34:04 +0200
In-Reply-To: <877eea8kys.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Fri, 08 Feb 2019 15:32:11 +0200")
Message-ID: <8736oy8kvn.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: =?utf-8?Q?Micha=C5=82?= Kazior <kazikcz@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> writes:

>> This change's purpose is to disallow user to trigger fw crash if the fw is not in a
>> Normal state.
>>
>> If the fw is in recovering state triggered by user's command or by fw, then it will
>> disallow user to run command to trigger fw crash again until fw become to a normal
>> State.
>
> I agree with Michal here and his proposal about having a crash counter
> sounds like a good to me. So I'm dropping this patch.

Bah, missed a word again. I meant "sounds like a good idea to me".

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
