Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz2mv-0003Mo-Hz
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 11:51:54 +0000
Message-ID: <1403524278.4418.19.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 23 Jun 2014 13:51:18 +0200
In-Reply-To: <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 (sfid-20140623_121907_420359_3A843E5E)
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
 <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 (sfid-20140623_121907_420359_3A843E5E)
Mime-Version: 1.0
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

>  [worker]
>  complete_all()
>  device_release_driver()
>  dev_lock()
>  {already held, yield}
>  [syscall]
>  free(internal structures)
>  dev_unlock()
>  return
>  [worker]
>  {woken up, but dev->driver == NULL so no callbacks}
>  dev_unlock()
>  return
> 
> The driver code section may not be reachable anymore upon worker
> returning from the device_release_driver() call, right? Also since
> ath10k uses an internal worker it also means the work_struct would be
> already freed by the syscall flow (i.e. worker would run after driver
> has supposedly been cleaned up..). Even if ath10k was to use
> request_firmware_nowait(), which allocates a temporary work_struct,
> the unreachable code section still remains a problem.
> 
> Or maybe this isn't really a problem and/or I'm missing something?

Yeah, hmm, this looks like a problem. I guess we didn't really consider
module unload in such detail ...

I guess this would crash upon return from device_release_driver()? I
guess if that's the last thing then maybe we'd actually get a tail-call
optimisation, but we don't want to rely on that of course!

Seems like to fix it we just need to get a module reference though? Can
a module put() itself though? Hmmm.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
