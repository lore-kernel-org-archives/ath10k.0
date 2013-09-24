Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOMbR-0004nm-Kw
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 07:00:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: replenish HTT RX buffers in a tasklet
References: <1379509691-19904-1-git-send-email-michal.kazior@tieto.com>
 <87r4cebuxm.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Tg1Qv8qXqw8++hXiDsBXyeQKDjYesWdNg25ORMQJGRg@mail.gmail.com>
Date: Tue, 24 Sep 2013 09:59:38 +0300
In-Reply-To: <CA+BoTQ=Tg1Qv8qXqw8++hXiDsBXyeQKDjYesWdNg25ORMQJGRg@mail.gmail.com>
 (Michal Kazior's message of "Tue, 24 Sep 2013 08:51:59 +0200")
Message-ID: <87eh8ebt7p.fsf@kamboji.qca.qualcomm.com>
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

> On 24 September 2013 08:22, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> This fixes system starvation when under heavy RX
>>> traffic. This problem could be observed on AP135
>>> and led to watchdog resetting the platform.
>>>
>>> Patch starves FW RX ring buffer by progressively
>>> replenishing buffers to auto-balance the RX
>>> handled to the host system.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> Looks good to me. I suspect there is a better way to do this in long
>> term, but this looks like a viable short term solution.
>>
>> Does it decrease throughput in a noticeable way?
>
> I have yet to observe any regressions.

Good. If you think the patch should be applied please resend it as
"[PATCH]" so that I can apply it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
