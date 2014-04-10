Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY9GQ-000446-AF
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 07:19:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFTv2 3/5] ath10k: rework peer accounting
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
 <87k3axhdqc.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=c+dTcK_diBKi6VJVgUkyBv21bDkRf+9GvGyhhqqMuNQ@mail.gmail.com>
Date: Thu, 10 Apr 2014 10:18:40 +0300
In-Reply-To: <CA+BoTQ=c+dTcK_diBKi6VJVgUkyBv21bDkRf+9GvGyhhqqMuNQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 10 Apr 2014 09:11:13 +0200")
Message-ID: <87fvllhctr.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>>> +/* hold conf_mutex for simple iteration, or conf_mutex+data_lock for
>>> + * modifications */
>>>  struct ath10k_peer *ath10k_peer_find(struct ath10k *ar, int vdev_id,
>>>                                    const u8 *addr)
>>>  {
>>>       struct ath10k_peer *peer;
>>>
>>> -     lockdep_assert_held(&ar->data_lock);
>>> -
>>>       list_for_each_entry(peer, &ar->peers, list) {
>>>               if (peer->vdev_id != vdev_id)
>>>                       continue;
>>
>> The comment here makes me suspicious. How can we safely iterate the list
>> if we don't take data_lock? Doesn't it mean that the list can change
>> while we have conf_mutex?
>
> The idea is you need BOTH locks to modify the list structure, but you
> need only one of them to iterate over the list safely and
> consistently. This means writer will not alter the list structure
> until there are no readers.

Still not understanding this. Why not then use conf_mutex always, why do
we need data_lock at all?

Or are you saying that one can iterate the list by either taking
conf_mutex or by taking data_lock, depending on context?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
