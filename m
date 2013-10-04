Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRz1K-0002AY-BL
 for ath10k@lists.infradead.org; Fri, 04 Oct 2013 06:37:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix scheduling while atomic bug
References: <1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380292567-2363-3-git-send-email-michal.kazior@tieto.com>
 <8761th6ja6.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnjG9MnbPsLM-RtAwuGNp_ZAfbvwvR_zg1Ks0ZmUxAtrQ@mail.gmail.com>
Date: Fri, 4 Oct 2013 09:37:18 +0300
In-Reply-To: <CA+BoTQnjG9MnbPsLM-RtAwuGNp_ZAfbvwvR_zg1Ks0ZmUxAtrQ@mail.gmail.com>
 (Michal Kazior's message of "Wed, 2 Oct 2013 07:35:37 +0200")
Message-ID: <871u41y21t.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 1 October 2013 18:35, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> Recent WMI/HTC changes broke WEP with multiple
>>> keys. If WMI had no HTC TX credits to submit
>>> command for default wep index update it would
>>> trigger a bug.
>>>
>>> This simply moves the wep key index update to a
>>> worker.
>>>
>>> The key update may happen some time after first
>>> frame with a different wep key has been sent (i.e.
>>> some frames will be sent with old key). This was
>>> the case before too as WMI commands were
>>> asynchronous.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> This looks problematic. Basically you just delay sending the WMI
>> command, but there's no guarantee that we actually have free credits at
>> the time of transmission. So to me it looks like this fixes the issue
>> just by luck.
>
> One thing at a time.
>
> This patch fixes 'scheduling while atomic' bug that was introduced
> with recent HTC/WMI changes.

Ah, that's what you mean with "triggers a bug" in the commit log? Ok,
even though I consider this very ugly I guess it's alright as a short
term fix. But please describe the bug in more detail in the commit log,
at least mention that we are sleeping in an atomic context (or something
like that).


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
