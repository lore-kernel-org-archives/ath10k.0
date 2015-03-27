Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbYIt-0003r2-Ea
 for ath10k@lists.infradead.org; Fri, 27 Mar 2015 17:44:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 6/6] ath10k: introduce basic tdls functionality
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-7-git-send-email-marek.puzyniak@tieto.com>
 <CADnKcVhg8ZVD8Nn7pqjtCUWWOiO_8Zp7-U0zaMh4FKL-pj3bLg@mail.gmail.com>
Date: Fri, 27 Mar 2015 19:43:38 +0200
In-Reply-To: <CADnKcVhg8ZVD8Nn7pqjtCUWWOiO_8Zp7-U0zaMh4FKL-pj3bLg@mail.gmail.com>
 (Marek Puzyniak's message of "Fri, 27 Mar 2015 10:33:56 -0400")
Message-ID: <87iodm72ut.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> Hi Kalle,
>
> On 20 March 2015 at 07:02, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
>> This patch introduces tdls without tdls peer uapsd
>> and tdls channel switching.
>> Transmitting tdls data frames works only for ethernet
>> type frames, that's why data addressed to tdls sta
>> is in ethernet format.
>>
>> This patch depends on:
>> mac80211: initialize rate control earlier for tdls station
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>> ---
> [...]
>
>> +static int ath10_mac_tdls_vifs_count(struct ieee80211_hw *hw)
> [...]
>> +               num_tdls_vifs = ath10_mac_tdls_vifs_count(hw);
> [...]
>
> I found typo in my patch. This can be fixed by

Thanks, I fixed this directly in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
