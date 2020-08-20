Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8hgf-0000C2-15
 for ath10k@lists.infradead.org; Thu, 20 Aug 2020 10:20:50 +0000
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 18:20:46 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [RFC] ath10k: change to do napi_enable and napi_disable when
 insmod and rmmod for sdio
In-Reply-To: <CABPxzYJLvrZKFeun0PmvE5NbXfke3orJnaXEY3e17xeBYkSqnw@mail.gmail.com>
References: <20200214035555.24762-1-wgong@codeaurora.org>
 <878se9iup3.fsf@codeaurora.org>
 <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
 <CABPxzYJLvrZKFeun0PmvE5NbXfke3orJnaXEY3e17xeBYkSqnw@mail.gmail.com>
Message-ID: <17857699628b4627ac3c781d9a20c0d8@codeaurora.org>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

On 2020-08-20 17:26, Krishna Chaitanya wrote:
> On Thu, Aug 20, 2020 at 2:49 PM Krishna Chaitanya
> <chaitanya.mgit@gmail.com> wrote:
>> 
>> On Thu, Aug 20, 2020 at 2:03 PM Kalle Valo <kvalo@codeaurora.org> 
>> wrote:
>> >
>> > Wen Gong <wgong@codeaurora.org> writes:
>> >
...
>> > I'm not really convinced that this is the right fix, but I'm no NAPI
>> > expert. Can anyone else help?
>> Calling napi_disable() twice can lead to hangs, but moving NAPI from
>> start/stop to
>> the probe isn't the right approach as the datapath is tied to 
>> start/stop.
>> 
>> Maybe check the state of NAPI before disable?
>> 
>>  if (test_bit(NAPI_STATE_SCHED, &ar->napi.napi.state))
>>   napi_disable(&ar->napi)
>> 
>> or maintain napi_state like this 
>> https://patchwork.kernel.org/patch/10249365/
>> 
>> Also, the most common cause for such issues (1st
>> napi_synchronize/napi_disable hang)
>> is that napi_poll is being scheduled, so, you might want to check that
>> napi_schedule isn't
>> called after stop.
>> 
>> cd ath10k; git log --grep=napi shows plenty of such issues. the one
>> that matches closest is
>> c2cac2f74ab4bcf0db0dcf3a612f1e5b52d145c8, so, it could just be a 
>> regression.
> Also, I see that napi_schedule() is being called from work_queue 
> async_work_rx
> so we should cancel that work in hif_stop before calling 
> napi_synchronize.
Yes, I will do that in a new patch.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
