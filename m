Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfZ1k-0002cu-WB
 for ath10k@lists.infradead.org; Wed, 30 Apr 2014 18:14:41 +0000
Received: by mail-vc0-f174.google.com with SMTP id ib6so2667583vcb.5
 for <ath10k@lists.infradead.org>; Wed, 30 Apr 2014 11:14:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmsXMo2eJCm5A7H+xBxHhQ8t1yoNfRFF8d+7PeTOJnSJw@mail.gmail.com>
References: <CAHqTa-31TAb=9+xyPzBVcEiipnN0_uV8mzSpEBD_sJVS1RDXZg@mail.gmail.com>
 <CA+BoTQmsXMo2eJCm5A7H+xBxHhQ8t1yoNfRFF8d+7PeTOJnSJw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 30 Apr 2014 14:13:59 -0400
Message-ID: <CAHqTa-3NVDL7GjgOYc-rSGwU5qGBqtuyMt9YepgLZcJqjk_YgA@mail.gmail.com>
Subject: Re: ath10k fails to recover from simulated firmware crash in AP mode
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
Cc: ath10k <ath10k@lists.infradead.org>

On Wed, Apr 30, 2014 at 2:01 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 30 April 2014 05:03, Avery Pennarun <apenwarr@gmail.com> wrote:
>> This is on a 3.2.26 kernel, mindspeed c2000 processor (ARMv7l), using
>> backports-v3.15-rc1 with today's kvalo/ath-next merged in (ie. commit
>> d9bc4b9b69 from Apr 23).
>>
>> Steps:
>> - modprobe ath10k_pci reset_mode=1  (this hardware crashes if you cold reset it)
>
> There is a reason why ath10k falls back to cold reset (unless you
> forbid it to): warm reset can't recover target in all cases.

That makes sense of course.  It's a little disappointing that even the
simulated firmware crash requires a cold reset to recover, though.
Wouldn't that be the first one the firmware developers would test?

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
