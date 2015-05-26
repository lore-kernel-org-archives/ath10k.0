Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yx8ER-0006OC-LH
 for ath10k@lists.infradead.org; Tue, 26 May 2015 06:20:56 +0000
Date: Tue, 26 May 2015 11:50:13 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: possible memory leak or memory waste
Message-ID: <20150526062009.GA14525@qca.qualcomm.com>
References: <55636088.1080506@dd-wrt.com> <55636198.8020802@candelatech.com>
 <55637637.8020103@dd-wrt.com> <556378E3.7050707@candelatech.com>
 <55639395.6070207@dd-wrt.com> <5563A491.8070701@candelatech.com>
 <5563A990.5000606@dd-wrt.com> <5563B357.9060309@candelatech.com>
 <5563B934.5050306@dd-wrt.com>
 <CA+BoTQmmjnyei4LGzEU9=68QkgGY6Rn08X8=TP7R6qQBzvMAEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQmmjnyei4LGzEU9=68QkgGY6Rn08X8=TP7R6qQBzvMAEQ@mail.gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On Tue, May 26, 2015 at 07:42:35AM +0200, Michal Kazior wrote:
> On 26 May 2015 at 02:07, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
> > Am 26.05.2015 um 01:42 schrieb Ben Greear:
> >>
> >> Can you test with ath9k to make sure it is actually ath10k related?
> >
> > already tested. this device has 2 chipsets. one is ath9k based and the
> > second is ath10k based. :-)
> > only if i kill the hostapd process which controls ath10k. the memory waste
> > is gone
> 
> Keep in mind that hostapd itself requires memory to function as well.
> Each process (and thread) need some internal kernel memory (stack, et
> al).
>
Have seen simialar issue long hours run in mbssid mode with multi-client.
Killing hostapd regains memory.

[<c021dd44>] (unwind_backtrace) from [<c021ae0c>] (show_stack+0x10/0x14)
[<c021ae0c>] (show_stack) from [<c0336b9c>] (dump_stack+0x88/0xcc)
[<c0336b9c>] (dump_stack) from [<c0279804>] (dump_header.isra.11+0x64/0x178)
[<c0279804>] (dump_header.isra.11) from [<c0279b10>] (oom_kill_process+0x70/0x384)
[<c0279b10>] (oom_kill_process) from [<c027a2a0>] (out_of_memory+0x2d4/0x304)
[<c027a2a0>] (out_of_memory) from [<c027d180>] (__alloc_pages_nodemask+0x608/0x664)
[<c027d180>] (__alloc_pages_nodemask) from [<c0278780>] (filemap_fault+0x1f8/0x390)
[<c0278780>] (filemap_fault) from [<c028f45c>] (__do_fault+0xa4/0x42c)
[<c028f45c>] (__do_fault) from [<c0292494>] (handle_mm_fault+0x230/0x7b0)
[<c0292494>] (handle_mm_fault) from [<c021f70c>] (do_page_fault+0x114/0x26c)
[<c021f70c>] (do_page_fault) from [<c0208440>] (do_PrefetchAbort+0x34/0x98)

Need to check whether it is a regression or not.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
