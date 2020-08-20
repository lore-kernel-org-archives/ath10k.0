Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8lhT-0006Qm-I2
 for ath10k@lists.infradead.org; Thu, 20 Aug 2020 14:37:56 +0000
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 22:37:50 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [RFC] ath10k: change to do napi_enable and napi_disable when
 insmod and rmmod for sdio
In-Reply-To: <CABPxzYK6wd8FGaM9tb_PYroARJ8RCjJ0Y-nVxY3AoubrfSbZ4w@mail.gmail.com>
References: <20200214035555.24762-1-wgong@codeaurora.org>
 <878se9iup3.fsf@codeaurora.org>
 <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
 <b7e0e8dfe9a4ee0cb92c6c0f153c7bc2@codeaurora.org>
 <CABPxzYK6wd8FGaM9tb_PYroARJ8RCjJ0Y-nVxY3AoubrfSbZ4w@mail.gmail.com>
Message-ID: <dcc45384935dca14ac6ab31ec1123414@codeaurora.org>
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

On 2020-08-20 18:52, Krishna Chaitanya wrote:
> On Thu, Aug 20, 2020 at 3:45 PM Wen Gong <wgong@codeaurora.org> wrote:
>> 
>> On 2020-08-20 17:19, Krishna Chaitanya wrote:
...
>> >> I'm not really convinced that this is the right fix, but I'm no NAPI
>> >> expert. Can anyone else help?
>> > Calling napi_disable() twice can lead to hangs, but moving NAPI from
>> > start/stop to
>> > the probe isn't the right approach as the datapath is tied to
>> > start/stop.
>> >
>> > Maybe check the state of NAPI before disable?
>> >
>> >  if (test_bit(NAPI_STATE_SCHED, &ar->napi.napi.state))
>> >   napi_disable(&ar->napi)
>> > or maintain napi_state like this
>> > https://patchwork.kernel.org/patch/10249365/
>> it is better to use above link's patch.
>> napi.state is controlled by napi API, it is better ath10k not know it.
> Sure, but IMHO just canceling the async rx work should solve the issue.
Oh no, canceling the async rx work will not solve this issue, rx worker
ath10k_rx_indication_async_work call napi_schedule, after napi_complete,
the NAPI_STATE_SCHED will clear.
The issue of this patch is because 2 thread called to hif_stop and
NAPI_STATE_SCHED not clear.
...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
