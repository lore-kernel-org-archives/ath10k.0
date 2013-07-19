Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V096e-0005YJ-Pv
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 11:44:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: fixes
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <871u6u4xkk.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQna=a66_g+_WG8mnENEDEiUcAysa-joeP-xmTM+mYfY=Q@mail.gmail.com>
Date: Fri, 19 Jul 2013 14:43:28 +0300
In-Reply-To: <CA+BoTQna=a66_g+_WG8mnENEDEiUcAysa-joeP-xmTM+mYfY=Q@mail.gmail.com>
 (Michal Kazior's message of "Fri, 19 Jul 2013 13:10:52 +0200")
Message-ID: <87wqom3hcv.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 19 July 2013 13:07, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> Hi,
>>>
>>> Here are some fixes for ath10k. The rts threshold
>>> patch addresses my mistake in commit
>>> 9aeb6fe53d1f0d6e58658484ce9ad7b59f0ef16b which
>>> caused rts to be always enabled causing throughput
>>> issues in some cases.
>>>
>>>
>>> Michal Kazior (3):
>>>   ath10k: prevent HTC from being used after stopping
>>>   ath10k: fix memleak in mac setup
>>>   ath10k: fix rts/fragmentation threshold setup
>>
>> Doesn't apply:
>>
>> Applying: ath10k: prevent HTC from being used after stopping
>> Applying: ath10k: fix memleak in mac setup
>> Applying: ath10k: fix rts/fragmentation threshold setup
>> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/mac.c).
>> Repository lacks necessary blobs to fall back on 3-way merge.
>> Cannot fall back to three-way merge.
>> Patch failed at 0003 ath10k: fix rts/fragmentation threshold setup
>
> Eww. Sorry about that (I did warn you though). Perhaps that's because
> you skipped one of the recovery patches that git is confused now.

No worries. Most likely I could have fixed the conflict myself, but if
3-way merge doesn't work it's too much work.

> I'll resend the whole patchset rebased and with the HTC patch fixed.

Thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
