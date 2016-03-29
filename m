Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akxib-0002Ri-8b
 for ath10k@lists.infradead.org; Tue, 29 Mar 2016 17:46:17 +0000
Received: by mail-io0-x229.google.com with SMTP id e3so32449189ioa.1
 for <ath10k@lists.infradead.org>; Tue, 29 Mar 2016 10:45:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FAB79D.2020203@candelatech.com>
References: <56F97F91.10007@candelatech.com>
 <CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>
 <56FAA3D5.3070409@candelatech.com>
 <CAJ-Vmo=RzwymMtdWkrKTEnf+FU=Q3MU3QNqFneq74Qcn3BMfyg@mail.gmail.com>
 <56FAB79D.2020203@candelatech.com>
Date: Tue, 29 Mar 2016 10:45:44 -0700
Message-ID: <CAJ-VmokzeRX=ZPtP+JJqfL+tL60GR8aZpaBCCxVHZ=D8JRD3ww@mail.gmail.com>
Subject: Re: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for
 pipe-id 3 (WMI).
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 29 March 2016 at 10:13, Ben Greear <greearb@candelatech.com> wrote:
> On 03/29/2016 10:08 AM, Adrian Chadd wrote:
>>
>> Does it eventually catch up?
>
>
> It seems to.
>
>> IE, put a wait completion in there?
>
>
> Maybe so, but the current wait-completion waits on tx-credits,
> so more like I'd need to put the whole wait-completion in a loop
> and add a small sleep, maybe?
>
> Or, maybe try to force a read of the CE entries if the CE logic
> ever detects the ring is full?

Right. A little sleep (as long as its in a place where you can do it!)
just to check would be good. I'd also print out the CE ring contents
as well - see where the firmware has gotten to.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
