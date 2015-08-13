Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPzkD-00012c-36
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 21:09:01 +0000
Received: by ykdt205 with SMTP id t205so52878410ykd.1
 for <ath10k@lists.infradead.org>; Thu, 13 Aug 2015 14:08:40 -0700 (PDT)
From: S Prasad Kandregula <sprasad.kandregula@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Ath10 firmware crashing in Monitor mode(Sniffer mode)
Date: Thu, 13 Aug 2015 17:01:23 -0400
Message-Id: <4670C821-E536-47CF-BBC4-CC83F54BAE86@gmail.com>
References: <CAJa-X95EBdGASnz3KAdYz5R6w5g-a=dBy5VCZYwHp6SzQ+gUSw@mail.gmail.com>
 <CA+BoTQkFSQe0di1vqqB5cAPKaizRkBT5cu4fA8dQ_uR_a2HdJw@mail.gmail.com>
 <CAJa-X96spUg7+EZqH-Mv3s7OzbHzmXmcZ7uOw1KvPShexW6D_w@mail.gmail.com>
 <CA+BoTQ=Qpws=928TZe22Ds-UO_qQJ2Om+=DW=VUNUS59o1BQAA@mail.gmail.com>
 <CAJa-X96KPw6dY0pK1zc8UD4TdQcG0KuA3m6DSueVVyK-VPhn9g@mail.gmail.com>
 <CA+BoTQ=bqHPrdgGVfSfdJa5vobDBRdxRwMR_wJzUj4Z9WjotoQ@mail.gmail.com>
 <CAJa-X945Xvn0jHQVcKn-pyYQVNpxXnqjOH_VHJv8pVwR4kFXcw@mail.gmail.com>
 <CA+BoTQmLFGAn2z=E3J1C2qfNP34v57B7-rtALUQhNXrHqJeA6Q@mail.gmail.com>
 <55521102.9020306@candelatech.com>
 <CAJa-X97Av+FKwy5Q3x3jnC=KPmqFt_JfsaVQ6J3bScM-SEKnYg@mail.gmail.com>
 <55CD0176.5080003@candelatech.com>
In-Reply-To: <55CD0176.5080003@candelatech.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thank you Ben for immediate response,

Don't mind, could you please share your firmware path. 

Sorry I didn't change old subject line.

Thanks & Regards,
S Prasad

> On Aug 13, 2015, at 4:43 PM, Ben Greear <greearb@candelatech.com> wrote:
> 
>> On 08/13/2015 01:35 PM, s prasad wrote:
>> Hi Ben,
>> 
>> did you get a chance to look into this issue(injecting frames when
>> device in monitor mode).
> 
> Injection works in a limited fashion in my latest firmware.
> 
> I'd like to figure out how to pass rate-ctrl (and other info?) down to the
> firmware on a per-pkt basis..but I don't see a way yet.
> 
> Probably I have to hack the htt header or something like that
> to give some extra space.  That sort of thing might allow a host-based
> rate-ctrl algorithm to be used....if someone is interested in working on
> the driver/kernel side of things for this effort let me know.
> 
> I am not aware of any crashes related to monitor mode in my
> firmware..but if you can crash it, send me the crash dump and
> I'll take a look.
> 
> Thanks,
> Ben
> 
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
