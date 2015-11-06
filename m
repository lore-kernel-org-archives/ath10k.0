Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuZrQ-0001Tv-RZ
 for ath10k@lists.infradead.org; Fri, 06 Nov 2015 05:46:54 +0000
Message-ID: <563C3E8A.8050904@qti.qualcomm.com>
Date: Fri, 6 Nov 2015 11:15:46 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/3] Fix few WMI/HTT interfaces
References: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>	<87h9l1bq7o.fsf@kamboji.qca.qualcomm.com>	<20151105045754.GA12919@qca.qualcomm.com>
 <87d1vobte4.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d1vobte4.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thursday 05 November 2015 04:33 PM, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:
>
>> On Wed, Nov 04, 2015 at 07:59:39PM +0200, Kalle Valo wrote:
>>> Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:
>>>
>>>> This patch set fixes mismatch in peer_assoc complete wmi command for
>>>> version 10.4 and peer_id configuration for HTT version < 3.4.
>>>>
>>>> V2:
>>>> 	- Add cover letter
>>>> 	- Rename ath10k_mac_need_offchan_tx_work() to
>>>> 	  ath10k_mac_tx_frm_has_freq(). Add htt-op-version check
>>>> 	  to the helper and use it in ath10k_htt_tx() while configuring
>>>> 	  peerid.
>>>>
>>>> Vasanthakumar Thiagarajan (3):
>>>>    ath10k: Fix peer assoc complete WMI command for 10.4
>>>>    ath10k: Rename the helper which is used for off-channel tx
>>>>    ath10k: Fix peerid configuration in htt tx desc for htt version < 3.4
>>>
>>> These had a conflict but you didn't use ath.git as the baseline so I
>>> can't easily fix them. Please try always to use clean ath.git master
>>> branch as the baseline for your patches.
>>>
>>> Applying: ath10k: Fix peer assoc complete WMI command for 10.4
>>> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/wmi.h).
>>> Repository lacks necessary blobs to fall back on 3-way merge.
>>> Cannot fall back to three-way merge.
>>> Patch failed at 0001 ath10k: Fix peer assoc complete WMI command for 10.4
>>
>> Sorry for this. I prepared these patches on ath:master on top of my other pending
>> patch set. Not sure what went wrong.
>
> If you have two patchsets you shouldn't have them on the same branch,
> unless they have a strict dependency with each other of course. I prefer
> that you have two separate topic branches which both use the master
> branch as the baseline as then it's easiest for me to handle conflicts
> etc.
>

Sure, thanks.

Vasanth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
