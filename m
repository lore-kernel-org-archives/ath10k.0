Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8oZM-0003yu-2P
 for ath10k@lists.infradead.org; Thu, 20 Aug 2020 17:41:45 +0000
Received: by mail-yb1-xb44.google.com with SMTP id a34so1545688ybj.9
 for <ath10k@lists.infradead.org>; Thu, 20 Aug 2020 10:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200214035555.24762-1-wgong@codeaurora.org>
 <878se9iup3.fsf@codeaurora.org>
 <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
 <b7e0e8dfe9a4ee0cb92c6c0f153c7bc2@codeaurora.org>
 <CABPxzYK6wd8FGaM9tb_PYroARJ8RCjJ0Y-nVxY3AoubrfSbZ4w@mail.gmail.com>
 <dcc45384935dca14ac6ab31ec1123414@codeaurora.org>
 <CABPxzYLu_81h+aWWeNKRyH=CJ=+waB3zmT41BTZ9Mo733PqErQ@mail.gmail.com>
 <acb2bd58-2f95-e09c-9575-b45c0e2aeb70@candelatech.com>
 <CABPxzY+tPos8ByT76hU1ngoxwYcBHaRpFMCKGQJcc_ssoqGNSw@mail.gmail.com>
 <47c1b1e0-afc4-b9b4-5fc0-4636d8b3b981@candelatech.com>
In-Reply-To: <47c1b1e0-afc4-b9b4-5fc0-4636d8b3b981@candelatech.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Thu, 20 Aug 2020 23:11:30 +0530
Message-ID: <CABPxzYLD-M5wpWF6r=K=8YTosSfjctmaaBPCyBP72q-mY0PTcw@mail.gmail.com>
Subject: Re: [RFC] ath10k: change to do napi_enable and napi_disable when
 insmod and rmmod for sdio
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>

On Thu, Aug 20, 2020 at 10:38 PM Ben Greear <greearb@candelatech.com> wrote:
>
> On 8/20/20 10:00 AM, Krishna Chaitanya wrote:
> > On Thu, Aug 20, 2020 at 10:02 PM Ben Greear <greearb@candelatech.com> wrote:
> >>
> >> On 8/20/20 9:08 AM, Krishna Chaitanya wrote:
> >>> On Thu, Aug 20, 2020 at 8:07 PM Wen Gong <wgong@codeaurora.org> wrote:
> >>>>
> >>>> On 2020-08-20 18:52, Krishna Chaitanya wrote:
> >>>>> On Thu, Aug 20, 2020 at 3:45 PM Wen Gong <wgong@codeaurora.org> wrote:
> >>>>>>
> >>>>>> On 2020-08-20 17:19, Krishna Chaitanya wrote:
> >>>> ...
> >>>>>>>> I'm not really convinced that this is the right fix, but I'm no NAPI
> >>>>>>>> expert. Can anyone else help?
> >>>>>>> Calling napi_disable() twice can lead to hangs, but moving NAPI from
> >>>>>>> start/stop to
> >>>>>>> the probe isn't the right approach as the datapath is tied to
> >>>>>>> start/stop.
> >>>>>>>
> >>>>>>> Maybe check the state of NAPI before disable?
> >>>>>>>
> >>>>>>>    if (test_bit(NAPI_STATE_SCHED, &ar->napi.napi.state))
> >>>>>>>     napi_disable(&ar->napi)
> >>>>>>> or maintain napi_state like this
> >>>>>>> https://patchwork.kernel.org/patch/10249365/
> >>>>>> it is better to use above link's patch.
> >>>>>> napi.state is controlled by napi API, it is better ath10k not know it.
> >>>>> Sure, but IMHO just canceling the async rx work should solve the issue.
> >>>> Oh no, canceling the async rx work will not solve this issue, rx worker
> >>>> ath10k_rx_indication_async_work call napi_schedule, after napi_complete,
> >>>> the NAPI_STATE_SCHED will clear.
> >>>> The issue of this patch is because 2 thread called to hif_stop and
> >>>> NAPI_STATE_SCHED not clear.
> >>> That fix is still valid and good to have.
> >>>
> >>> ndev_stop being called twice is typical scenarios (stop vs rmmod), so
> >>>    just checking the netdev_flags for IFF_UP and returning from hif_Stop
> >>> should suffice, no?
> >>
> >> My approach to fix this problem was to add a boolean in ath10k as to whether
> >> it had napi enabled or not, and then check that before trying to enable/disable
> >> it again.  Seems to work fine, and cleaner in my mind than checking internal
> >> napi flags.
> > A much simpler approach is just to check for IFF_UP and skip NAPI (and others)
> > in the hif_stop no? (provided proper RTNL locking is done if hif_stop
> > is being called
> > internally as well).
> >
>
> I'm not sure, but I think the driver should be internally consistent and not
> spend a lot of time trying to guess about interactions with objects higher
> in the stack.
Fair enough, the network interface state is a basic thing controlled
by the driver,
so, should be okay to use. Anyways, the in-driver approach has more control.
>
> Here is my original patch to fix this, it is not complex.
>
> https://patchwork.kernel.org/patch/10249363/
Sure, I have shared your patch above :).

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
