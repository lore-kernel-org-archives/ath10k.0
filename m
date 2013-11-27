Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlgX0-00062w-Vl
 for ath10k@lists.infradead.org; Wed, 27 Nov 2013 14:55:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: use nss provided by mac80211
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-2-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQmtkBGpktbLRfmiLuLDKP9TnUeWu4OMeGUsVcq7m05u4Q@mail.gmail.com>
Date: Wed, 27 Nov 2013 16:55:32 +0200
In-Reply-To: <CA+BoTQmtkBGpktbLRfmiLuLDKP9TnUeWu4OMeGUsVcq7m05u4Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 27 Nov 2013 11:25:45 +0100")
Message-ID: <87ppplgahm.fsf@kamboji.qca.qualcomm.com>
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

> On 26 November 2013 14:57, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Calculating STA NSS just from the mcs rateset is
>> not the greatest idea.
>>
>> This should prevent connectivity issues if
>> mac80211 is ever to set rx_nss to something other
>> rather than base on max mcs map. As an example
>> operation mode change notification in assoc
>> request may change rx_nss initial values in the
>> future.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>
> Drop this single patch, please.
>
> I just noticed rx_nss doesn't seem to have correct value when associating..

Ok, I'm dropping this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
