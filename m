Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWac7-00077K-7F
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 00:39:23 +0000
Received: by mail-wg0-f47.google.com with SMTP id y10so5707675wgg.30
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 17:39:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54219A6E.6080902@candelatech.com>
References: <54205FA0.5000802@candelatech.com>
 <CA+BoTQ=wwCbfFqdQqgYfu9RTLiuot-bNh3mNN0c3R=1R_FUTzQ@mail.gmail.com>
 <54219A6E.6080902@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 23 Sep 2014 20:38:40 -0400
Message-ID: <CAHqTa-05-6xXfR9nhf4p=1ygWrcBv5WLrJFGbSQ-J=ME+RdZ8A@mail.gmail.com>
Subject: Re: Using host's rate-ctrl in ath10k?
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
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Tue, Sep 23, 2014 at 12:06 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 09/23/2014 12:17 AM, Michal Kazior wrote:
>> On 22 September 2014 19:42, Ben Greear <greearb@candelatech.com> wrote:
>>> Has anyone looked into what it would take to use standard host OS's
>>> rate control (minstrel_ht) with ath10k?
>>>
>>> I suspect the ath10k rate control logic in the firmware is
>>> a bit dodgy, and it would be nice to use something with wider
>>> testing such as minstrel_ht...
>>
>> Correct me if I'm wrong but that would require tx completions to
>> include tx retry information and a way to setup tx retries.
>
> Something like that...I have not looked in detail.  It would
> require a re-compile of the firmware at least.
>
> I just don't like that we are depending on the firmware for something
> something as tricky as rate control, especially when it seems buggy.

I definitely agree with this.  Once of the best things about the ath9k
driver is its excellent rate control, and the ability of others to
experiment on rate control to improve it further.  We've lost this
with the ath10k and it makes things significantly worse in some of our
benchmarks in non-ideal network conditions.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
