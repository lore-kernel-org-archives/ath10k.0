Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkZe1-0008V8-6R
 for ath10k@lists.infradead.org; Wed, 14 May 2014 13:54:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: recovery improvements 2014-05-09
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=VxSu9q_w3tjMNikKxuiMAfW5=k9La_AK3PoP8azgFUA@mail.gmail.com>
 <87oaz0fprm.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmytFM-YxXCMdhZ8J3OhK2udRrAtuWrY0rrLrHbASjGgA@mail.gmail.com>
Date: Wed, 14 May 2014 16:54:24 +0300
In-Reply-To: <CA+BoTQmytFM-YxXCMdhZ8J3OhK2udRrAtuWrY0rrLrHbASjGgA@mail.gmail.com>
 (Michal Kazior's message of "Wed, 14 May 2014 15:43:11 +0200")
Message-ID: <87fvkcfotr.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 14 May 2014 15:34, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> On 9 May 2014 14:35, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>> Hi,
>>>>
>>>> This depends on my `ath10k: recovery fixes
>>>> 2014-05-09`.
>>>>
>>>> Hopefully the split makes it a little saner to
>>>> review.
>>>>
>>>> Please note: `ath10k: make wmi timeout trigger hw
>>>> restart` effectively hides the mgmt tx / htc
>>>> credit starvation issue that was discussed
>>>> recently. My intention is to make the driver more
>>>> robust and as a side effect it makes the
>>>> starvation issue less painful. If desired so
>>>> the patch can be easily ignored in the series as
>>>> nothing depends on it.
>>>>
>>>>
>>>> Michal Kazior (7):
>>>>   ath10k: move restart_work call
>>>>   ath10k: introduce core restart symbol
>>>
>>>
>>>>   ath10k: drain wmi quickly upon hw restart
>>>>   ath10k: wake up everything on core restart
>>>
>>> These 2 are harmful as they are. In case of early fw crash
>>> uninitialized structures are accessed. I'll re-spin later.
>>
>> So I can drop the whole series, right?
>
> Correct.

Thanks. I dropped the series from my queue now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
