Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY75w-0003Ae-NQ
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 08:13:50 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA988X firmware pull-push support
Date: Mon, 30 Jan 2017 08:13:25 +0000
Message-ID: <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
In-Reply-To: <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>	(Adrian
 Chadd's message of "Sun, 29 Jan 2017 18:50:23 -0800")
Content-Language: en-US
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
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adrian Chadd <adrian.chadd@gmail.com> writes:

> On 29 January 2017 at 17:20, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>> Yep. Looks like so.
>
> Which is good, because my FreeBSD ath10k port only works with 10.1 /
> 10.2 firmware on earlier chips, and I haven't figured out the
> intermediate software queue support that came with 10.4. :-)
>
> But yeah. I'll wake for Kalle to verify, but I think it's a 10.4
> thing

So there are two parts here, ieee80211_ops::wake_tx_queue() support in
ath10k and ATH10K_FW_FEATURE_PEER_FLOW_CONTROL in firmware. We did have
wake_tx_queue() support enabled for all hw/fw combinations but it was
changed because some people claimed there are throughput regressions in
certain cases. So for now we only enable wake_tx_queue() support only if
firmware supports ATH10K_FW_FEATURE_PEER_FLOW_CONTROL:

	if (!test_bit(ATH10K_FW_FEATURE_PEER_FLOW_CONTROL,
		      ar->running_fw->fw_file.fw_features))
		ar->ops->wake_tx_queue = NULL;

I remember that there were some improvements with wake_tx_queue() even
if firmware didn't support ATH10K_FW_FEATURE_PEER_FLOW_CONTROL. I'm
starting to wonder should we have a module parameter to force use of
wake_tx_queue()?

And IIRC ATH10K_FW_FEATURE_PEER_FLOW_CONTROL was supported in some of
10.4 releases, but not all of them.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
