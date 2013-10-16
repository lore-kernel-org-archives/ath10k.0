Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWQVq-0007KR-Lh
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 12:47:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/7] ath10k: track vif list internally
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
 <20131015184656.14123.70575.stgit@localhost6.localdomain6>
 <87a9iabc9c.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=CqXN24Y-tb=r_ruUUNR_imcztULnoTScAvScvbPDbdA@mail.gmail.com>
Date: Wed, 16 Oct 2013 15:47:15 +0300
In-Reply-To: <CA+BoTQ=CqXN24Y-tb=r_ruUUNR_imcztULnoTScAvScvbPDbdA@mail.gmail.com>
 (Michal Kazior's message of "Tue, 15 Oct 2013 12:37:42 -0700")
Message-ID: <87k3hd757w.fsf@kamboji.qca.qualcomm.com>
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

> On 15 October 2013 11:49, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>>
>>> From: Michal Kazior <michal.kazior@tieto.com>
>>>
>>> mac80211 interface interations functions have
>>> peculiar locking issues. This patch introduces
>>> internal (to ath10k) vif list that will be used
>>> for vif iteration purposes.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>
>> [...]
>>
>> Michal, why do the INIT_LIST_HEAD() twice? Isn't it enough to do it
>> core_start()?
>
> Ah, good point. It's most likely okay to just do it in
> ath10k_core_start(). The one in ath10k_core_create() isn't required.

Ok, I removed the one from ath10k_core_create() before I commited this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
