Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vfumk-00065C-K3
 for ath10k@lists.infradead.org; Mon, 11 Nov 2013 16:56:23 +0000
Message-ID: <52810C1F.3060600@candelatech.com>
Date: Mon, 11 Nov 2013 08:55:59 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add logging to better determine some VIF/STA
 creation failures.
References: <1383585574-17779-1-git-send-email-greearb@candelatech.com>
 <87ppqbb4g0.fsf@kamboji.qca.qualcomm.com> <527D1704.2000508@candelatech.com>
 <87d2m7b8qj.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d2m7b8qj.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

On 11/11/2013 01:14 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 11/08/2013 01:58 AM, Kalle Valo wrote:
>>> greearb@candelatech.com writes:
>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>
>>> I did some changes to this patch:
>>>
>>> https://github.com/kvalo/ath/commit/20c062b93a1addc863d15334dd1eb5892a759f78
>>>
>>> The patch is still on ath-next-test branch. Please take a look and if
>>> it's ok for you, send you S-o-b tag so that I can apply it (it was
>>> missing).
>>
>> This part has some grammar issues, it seems to say that the failure
>> is due to changed bssid.  Maybe make it instead:
>>
>> Failed to add peer %pM for vdev %d when changing bssid, error: %i
>>
>> -        ath10k_warn("Failed to add peer: %pM for VDEV: %d\n",
>> -              info->bssid, arvif->vdev_id);
>> +        ath10k_warn("Failed to add peer %pM for vdev %d due to changed bssid: %i\n",
>> +              info->bssid, arvif->vdev_id, ret);
>>
>> Either way, it's better than what was there before, so:
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> Good point, thanks. I just didn't use the word error as I thought that
> wasn't necessary. New version which I'll apply soon:
>
> https://github.com/kvalo/ath/commit/ee309046323f2af1d2cd6f5c1361a6ce8dae5f87
>

Looks good.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
