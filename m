Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9zI0-0005fY-RC
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 16:21:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: fix Rx aggregation reordering
References: <1405505855-13741-1-git-send-email-michal.kazior@tieto.com>
 <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 <87r41dtf2u.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQng1xwLEbwfQ6P-T=VWYby529jFZ=duTH6hC=HzMW9Y=w@mail.gmail.com>
Date: Wed, 23 Jul 2014 19:20:46 +0300
In-Reply-To: <CA+BoTQng1xwLEbwfQ6P-T=VWYby529jFZ=duTH6hC=HzMW9Y=w@mail.gmail.com>
 (Michal Kazior's message of "Wed, 23 Jul 2014 11:50:02 +0200")
Message-ID: <87fvhst5b5.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

>> The mac80211 patches are in mac80211-next, but I can only apply this one
>> only once they are in wireless-next.
>>
>> Also the other thing is that 3.17 merge window is very close. I might be
>> able to squeeze this in but there's the risk that this patch hasn't
>> received enough testing from being in ath.git. How safe (or risky) is
>> this patch? If we push this to 3.17, we could try to fix regressions in
>> -rc releases but that's always more difficult than waiting for 3.18.
>
> I think it should be fairly safe. The stalls I've observed don't make
> it worse than it is without Rx reordering.
>
> But! I need to re-spin this patch since there's an endianess bug with
> info0 being treated as __le32 while its __le16.

Ok, let's try to get the new version of this patch to 3.17, if at all
possible. But if there are any regressions, please let me know ASAP so
that we can quickly fix it and push the fix to -rc releases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
