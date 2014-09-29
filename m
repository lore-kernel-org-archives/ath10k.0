Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYWDU-0001TU-DX
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 08:21:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 03/10] ath10k: support ethtool stats.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-3-git-send-email-greearb@candelatech.com>
 <CA+BoTQkK=6NfPN9e-3qN2Qaq2RLVdEwrp5x03_T=E2ZLcBeiaA@mail.gmail.com>
 <5422D71F.7080809@candelatech.com>
Date: Mon, 29 Sep 2014 11:21:10 +0300
In-Reply-To: <5422D71F.7080809@candelatech.com> (Ben Greear's message of "Wed, 
 24 Sep 2014 07:37:19 -0700")
Message-ID: <87eguu3ki1.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 09/24/2014 12:44 AM, Michal Kazior wrote:
>> On 23 September 2014 23:17,  <greearb@candelatech.com> wrote:
>> [...]
>>> +void ath10k_get_et_stats(struct ieee80211_hw *hw,
>>> +                        struct ieee80211_vif *vif,
>>> +                        struct ethtool_stats *stats, u64 *data)
>>> +{
>>> +       struct ath10k *ar = hw->priv;
>>> +       int i = 0;
>>> +       struct ath10k_target_stats *fw_stats;
>>> +
>>> +       fw_stats = &ar->debug.target_stats;
>>> +
>>> +       mutex_lock(&ar->conf_mutex);
>>> +
>>> +       if (ar->state == ATH10K_STATE_ON)
>>> +               ath10k_refresh_peer_stats(ar);
>>> +
>>> +       mutex_unlock(&ar->conf_mutex);
>>
>> Just for correctness sake - it's probably a good idea to
>> mutex_unlock() at the end (i.e. after spin_unlock_bh()) to make sure
>> the stats are for this particular request. With your patch there's a
>> very slight chance that, e.g. fw_stats debug file is being read at the
>> same time and it updates fw stats between the above mutex_unlock() and
>> following spin_lock_bh().
>
> That makes no difference at all to the user though, and it is one less
> set of nested locks to worry about.

I still do not want to have known races, especially when it's so easy to
fix. The ethtool patches patches conflict with Michal's fw_stats fixes.
Let me take the ethtool patches so that I can rebase them, fix this race
and do some other small changes as well. I'll send v2 soon.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
