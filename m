Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdM9L-00049M-K7
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 17:09:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: implement more versatile set_bitrate_mask
References: <1427798961-7334-1-git-send-email-michal.kazior@tieto.com>
 <1427798961-7334-3-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQmhEf3fZSo2FPFbXa=Uc4ia0Sg2SD89gceyc8O+jVJeUg@mail.gmail.com>
Date: Wed, 1 Apr 2015 20:09:23 +0300
In-Reply-To: <CA+BoTQmhEf3fZSo2FPFbXa=Uc4ia0Sg2SD89gceyc8O+jVJeUg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 1 Apr 2015 14:38:13 +0200")
Message-ID: <87iodfzsfw.fsf@kamboji.qca.qualcomm.com>
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

> On 31 March 2015 at 12:49, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Until now only a single fixed tx rate or nss was
>> allowed to be set.
>>
>> The patch attempts to improve this by allowing
>> most bitrate masks. The limitation is VHT MCS
>> rates cannot be expressed separately and only the
>> following VHT MCS ranges are supported: none, 0-7,
>> 0-8, and 0-9.
>>
>> This keeps the old behaviour when requesting
>> single tx rate or single nss. The new bitrate mask
>> logic is only applied to other cases that would
>> return -EINVAL until now.
>>
>> Depending on firmware revisions some combinations
>> may crash firmware so use with care, please.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>
> Hi Kalle,
>
> Drop this patch ([2/2]) for now, please. It looks like it doesn't work
> well with crypto networks. I'll need to rework this. The [1/2] is fine
> as it is though.

Ok, patch 2 dropped.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
