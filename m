Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x234.google.com ([2607:f8b0:4002:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYqAg-0005Pi-9r
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 08:21:43 +0000
Received: by mail-yw0-x234.google.com with SMTP id w75so57413625ywg.1
 for <ath10k@lists.infradead.org>; Wed, 01 Feb 2017 00:21:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Wed, 1 Feb 2017 11:21:00 +0300
Message-ID: <CAHNKnsSz_tz-7081SwpJ5+V7UMyOM1PXnHzf8cF1or4SVk9axQ@mail.gmail.com>
Subject: Re: QCA988X firmware pull-push support
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Adrian Chadd <adrian.chadd@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jan 30, 2017 at 11:13 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Adrian Chadd <adrian.chadd@gmail.com> writes:
>
>> On 29 January 2017 at 17:20, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>>> Yep. Looks like so.
>>
>> Which is good, because my FreeBSD ath10k port only works with 10.1 /
>> 10.2 firmware on earlier chips, and I haven't figured out the
>> intermediate software queue support that came with 10.4. :-)
>>
>> But yeah. I'll wake for Kalle to verify, but I think it's a 10.4
>> thing
>
> So there are two parts here, ieee80211_ops::wake_tx_queue() support in
> ath10k and ATH10K_FW_FEATURE_PEER_FLOW_CONTROL in firmware. We did have
> wake_tx_queue() support enabled for all hw/fw combinations but it was
> changed because some people claimed there are throughput regressions in
> certain cases. So for now we only enable wake_tx_queue() support only if
> firmware supports ATH10K_FW_FEATURE_PEER_FLOW_CONTROL:
>
>         if (!test_bit(ATH10K_FW_FEATURE_PEER_FLOW_CONTROL,
>                       ar->running_fw->fw_file.fw_features))
>                 ar->ops->wake_tx_queue = NULL;
>
> I remember that there were some improvements with wake_tx_queue() even
> if firmware didn't support ATH10K_FW_FEATURE_PEER_FLOW_CONTROL.

Yes, Rajkumar Manoharan made some fix for wake_tx_queue (). I think
that I could test this fix with QCA988x in the couple of weeks. May be
we could return to total intermediate queues support.

> I'm
> starting to wonder should we have a module parameter to force use of
> wake_tx_queue()?

Maybe. This could be useful at stage of final testing, if the last fix
for wake_tx_queue() really solves the performance issues. Before we
returning to total support of intermediate queues.

> And IIRC ATH10K_FW_FEATURE_PEER_FLOW_CONTROL was supported in some of
> 10.4 releases, but not all of them.

Yep, only few of 10.4 firmware have support of tx pull-push mode.

-- 
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
