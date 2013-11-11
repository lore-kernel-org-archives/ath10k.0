Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfnaR-0001Rk-T8
 for ath10k@lists.infradead.org; Mon, 11 Nov 2013 09:15:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add logging to better determine some VIF/STA
 creation failures.
References: <1383585574-17779-1-git-send-email-greearb@candelatech.com>
 <87ppqbb4g0.fsf@kamboji.qca.qualcomm.com>
 <527D1704.2000508@candelatech.com>
Date: Mon, 11 Nov 2013 11:14:44 +0200
In-Reply-To: <527D1704.2000508@candelatech.com> (Ben Greear's message of "Fri, 
 8 Nov 2013 08:53:24 -0800")
Message-ID: <87d2m7b8qj.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 11/08/2013 01:58 AM, Kalle Valo wrote:
>> greearb@candelatech.com writes:
>> 
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>> 
>> I did some changes to this patch:
>> 
>> https://github.com/kvalo/ath/commit/20c062b93a1addc863d15334dd1eb5892a759f78
>> 
>> The patch is still on ath-next-test branch. Please take a look and if
>> it's ok for you, send you S-o-b tag so that I can apply it (it was
>> missing).
>
> This part has some grammar issues, it seems to say that the failure
> is due to changed bssid.  Maybe make it instead:
>
> Failed to add peer %pM for vdev %d when changing bssid, error: %i
>
> -        ath10k_warn("Failed to add peer: %pM for VDEV: %d\n",
> -              info->bssid, arvif->vdev_id);
> +        ath10k_warn("Failed to add peer %pM for vdev %d due to changed bssid: %i\n",
> +              info->bssid, arvif->vdev_id, ret);
>
> Either way, it's better than what was there before, so:
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Good point, thanks. I just didn't use the word error as I thought that
wasn't necessary. New version which I'll apply soon:

https://github.com/kvalo/ath/commit/ee309046323f2af1d2cd6f5c1361a6ce8dae5f87

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
