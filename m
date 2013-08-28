Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEdY4-0008Kx-Co
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 11:04:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/4] ath10k: synchronize tx/rx reporting to mac80211
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-2-git-send-email-michal.kazior@tieto.com>
 <87txiajveo.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmW8F+e3YqLSoCWbYRSzZAM=Wy2GvGfbbW7iwVHtaesOQ@mail.gmail.com>
Date: Wed, 28 Aug 2013 14:04:01 +0300
In-Reply-To: <CA+BoTQmW8F+e3YqLSoCWbYRSzZAM=Wy2GvGfbbW7iwVHtaesOQ@mail.gmail.com>
 (Michal Kazior's message of "Wed, 28 Aug 2013 12:54:46 +0200")
Message-ID: <87bo4igjq6.fsf@kamboji.qca.qualcomm.com>
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

> On 28 August 2013 06:23, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> According to mac80211 docs tx and rx reporting
>>> routines must not run concurrently unless they are
>>> _irqsafe variants.
>>>
>>> This doesn't fix any visible bug but is apparently
>>> the right thing to do as per the documentation.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> I had a quick chat with Johannes and Sujith about this. The concurrency
>> requirements are for the STA PS race in AP mode (see
>> ieee80211_handle_filtered_frame()).
>>
>> I think we should drop this frame, revisit later and properly analyse

"drop this frame". Heh, of course I was trying to say "drop this
patch" :)

>> how to fix the race. But it would be good add this to the todo list:
>>
>> http://wireless.kernel.org/en/users/Drivers/ath10k#TODO
>
> I've added this to the TODO list.

Thanks!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
