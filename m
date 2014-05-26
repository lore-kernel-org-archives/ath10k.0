Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wor4f-0005qN-Lf
 for ath10k@lists.infradead.org; Mon, 26 May 2014 09:20:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: revert incomplete scatter-gather pci tx
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1400158139-13836-3-git-send-email-michal.kazior@tieto.com>
 <87fvjytht6.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkfZbzy62xZV0tcPw1xu8B-rioVVags3z+DJMGxMB-jFQ@mail.gmail.com>
Date: Mon, 26 May 2014 12:19:31 +0300
In-Reply-To: <CA+BoTQkfZbzy62xZV0tcPw1xu8B-rioVVags3z+DJMGxMB-jFQ@mail.gmail.com>
 (Michal Kazior's message of "Mon, 26 May 2014 07:37:13 +0200")
Message-ID: <877g58ucbg.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 25 May 2014 09:53, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> This prevents leaving incomplete scatter-gather
>>> transfer on CE rings which can lead firmware to
>>> crash.
>>>
>>> Reported-By: Avery Pennarun <apenwarr@gmail.com>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> The title is a bit misleading as usually the commit log with the word
>> revert means that the commit is reverting another git commit. Maybe
>> something like this is better:
>>
>> ath10k: drop incomplete scatter-gather pci tx transfers
>
> Good point. I was actually thinking 'abort' .. 'properly'.

Sounds good to me.

>>> +err:
>>> +     for (; i > 0; i--)
>>
>> Isn't this just a fancy way to say 'while (i-- > 0)'?
>
> Not really. More like do { .. } while (--i > 0), no? First iteration
> must use unmodified `i`.

Ok, I missed that. Then the for loop is good here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
